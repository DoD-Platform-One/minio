# Minio Instance Documentation

MinIO is a high performance, distributed object storage system. It is software-defined, runs on industry standard hardware and is 100% open source under the Apache V2 license.

* Operator version based on: 2.0.9
* Instance deployment version:  RELEASE.2020-11-19T23-48-16Z

## Open Source Documentation

The opensource documentation for Minio can be found at https://docs.min.io/docs/minio-quickstart-guide.html

The deployment of minio instance is based on the use of the minio Operator which is documented 
[here](https://github.com/minio/minio-operator).

## Prerequisites
* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

## Values Used for Deployment

Most of the values used to deploy the minio instance are documented in the chart/values.yaml file.
Most of these values are decribed in the opensource documentation listed above.  However, this section describes a 
few of the values in more detail.

### Root Credentials
```
minioRootCreds: default-minio-creds-secret
```
Th default root credentials are spcified in secret name in the above value.   The secret must contain 2 fields:  
* accesskey:  effectively the username
* secretkey:  effectively the password 

This helm chart create a default secret that will be used if none is specified.

### service name override
Internal service name for minio instance.  This is the full name of the service used to connect to Minio from 
within the cluster. If not specified, the service name will be the default full name of the minio instance.

```
service:
  nameOverride: ""
```

## Deployment
```
git clone https://repo1.dsop.io/platform-one/big-bang/apps/core/monitoring.git
cd monitoring
helm dependency update chart
helm install minio chart --debug
```
