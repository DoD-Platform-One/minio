# Minio S3 Gateway on K8s with Multi-tenancy

This instantiation of MinIO runs as a cluster available service in its own namespace. Using helm charts, it is
 started in a 4 node deployment as a S3 gateway. To support multiple users, MinIO also needs access to ETCD, so a
  single node ETCD SS is setup. By integrating the minio_provisioner plugin, applications can be provisioned a unique
   set of credentials and bucket to limit access to just them. 
 
# General Structure  

The general structure of the project applies the top level kustomization.yaml, which on top of building the rest of
 the project, also includes the two secrets from cluster-secrets necessary for operation that merge into minio-admin
 -keys (and the common repo1 pull secret to use the repo1 copy of the images). The deployment relies on the helm generator plugin used by P1 https://repo1.dsop.io/platform-one/plugins/kustomize/-/blob/master/Dockerfile
  
The minio_provisioner plugin is then evoked in each applications integration specific namespace (e.g "hypersonic-scinet-db") 

```
apps/
|-- minio/
    |-- kustomization.yaml
    |-- resources/
        |-- namespace.yaml
    |-- minio-generator.yaml
    |-- etcd-generator.yaml
    |-- minio-engine/
        |-- values.yaml
        |-- Chart.yaml
        |-- templates/
    |-- etcd/
        |-- values.yaml
        |-- Chart.yaml
        |-- templates/
    
integrations/
|-- plugins/
    |-- minio_provisioner/
        |-- kustomization.yaml
        |-- minio-provisioner.yaml
        |-- readwrite.json
|-- cluster-secrets
    |-- env/
        |-- s3-access-key/
        |-- minio-admin-secrets/
```


 
# MinIO Engine 
The included files in minio-engine/ are left as found from the source except for the following changes:

```
sources:
   - https://github.com/minio/minio
   version: 6.0.4
```

- An existing secret is set, `existingSecret: "minio-admin-keys"`, which contain the secret key and access key for an
 accessing the admin profile of MinIO. This secret is loaded into the minio namespace at creation and the
  app_db namespace whenver minio_provisioner is used.
  namespace 
    - The required format is 
    ```
    accesskey=
    secretkey=
    ```
- s3gateway is enabled and configured:
    - The configuration used is
    ```
    s3gateway:
      enabled: true
      replicas: 4
      serviceEndpoint: "https://s3.us-gov-west-1.amazonaws.com"
      accessKey: "nonsense"
      secretKey: "nonsensepass"
    ```
    - replicas is kept at default of 4
    - serviceEndpoint is set to the clusters endpoint for s3
    - accessKey and secretKey are set to filler values.  Since the s3 secrets are stored in the same secret that we
     specify above, we use a secret generator with `behavior: merge` to overwrite the secret that minio makes. 
    ```
    apiVersion: goabout.com/v1beta1
    kind: SopsSecretGenerator
    metadata:
      name: minio-admin-keys
    disableNameSuffixHash: true
    behavior: merge
    envs:
      - mission-staging-s3-access-keys.mission-staging-enc.env
    
    ---
    
    awsAccessKeyId=
    awsSecretAccessKey=
    ```
- ETCD is set use the service endpoint we create 
    ```
    etcd:
      endpoints: ["http://etcd.minio.svc.cluster.local:2379"]
    ```
- Images are overwritten to use the Repo1 copy of the images and image pull secret uses the repo1-pull-secret
```
image:
  repository: registry.dsop.io/platform-one/private/big-bang/apps/minio
---
mcImage:
  repository: registry.dsop.io/platform-one/private/big-bang/apps/minio-client
---
helmKubectlJqImage:
  repository: registry.dsop.io/platform-one/private/big-bang/apps/helm-kuebctl-jq
---
imagePullSecrets:
 - name: "repo1-registry-read-creds"
```

Since we are using the istio service mesh with mTLS, we aren't using MinIO TLS settings, although it does use TLS
 when connecting to S3

# ETCD 
ETCD is deployed straight from the source with special consideration to provide the namespace to the helm generator
, and is subbed with repo1 images
```
name: etcd
sources:
- https://github.com/bitnami/bitnami-docker-etcd
version: 4.10.0
```

# minio_provisioner Plugin
Similar to the solution used with RDS, minio_provisioner runs a job that ensures there a exists a user account with
 the provided credentials, ensures a bucket for the application exists, and ties that account to only that bucket
 . Then, using those credentials, the application can use the provided env variables as if they were connecting to S3
  directly. 
  
To have the provisioner and application work as intended, the application namespace needs the application specific
 creds and the apps integration namespace needs the minio admin creds and the application specific creds. 
 
 Application creds should follow this format:
 
```
minio-creds/
|-- app-name.env
|-- kustomization.yaml
|-- minio-creds-generator.yaml
```