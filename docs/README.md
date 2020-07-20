# Minio Operator

Project [here](https://github.com/minio/minio-operator).

MinIO is a high performance, distributed object storage system. It is software-defined, runs on industry standard hardware and is 100% open source under the Apache V2 license.

App Version: Operator 1.0.7, instance 1.0.7
Plugins: 
Additional docs for using  and its plugins can be found at $URL
The containers being used are maintained in the public/apps/minio registry.  These containers ahve not been hardened, but have been retagged.  When available hardened containers will be implemented.

Minio instances mount a secret named by default as minio-creds-secret with "accesskey" and "secretkey"
By default this is "minio" and "minio123" respectively and this should be changed for production deployments

### Prerequisites

* Kubernetes cluster deployed
* kubectl configuration installed
* Elasticsearch and Kibana deployed to Kubernetes namespace

Install kubectl

```
brew install kubectl
```

Install kustomize for development

```
brew install kustomize
```

### Deployment

Clone repository

```
git clone https://repo1.dsop.io/platform-one/apps/minio.git
cd minio/deployment
```

Apply kustomized manifest

```
kubectl apply -k ./manifests/operator
kubectl apply -k ./manifests/instance
```

## Logs

By default, this application's logs will appear on Kibana under an index prefix name of logstash-*. To verify and configure the index, utilize Kibana Discover.

Logs are emitted in two namespaces  `minio-operator` and `minio` (Use filter `kubernetes.namespace_name`: <namespace>)

The minio-operator pod runs the `minio-operator` container in the `minio-operator` namespaces and the logs for this contaienr can be filtered with `kubernetes.container_name`: `minio-operator`

minio-* pods run inthe `minio` namespace. The number of replicas vary and the * is replaced by the instance number. The logs for this pod can be filtered with `kubernetes.pod_name`: `minio-<instanceid`


Container Environment Variables

These variables are patched in via kustomize and may require modifications depending on your
environment.

To disable authentication at the /minio/prometheus/metrics end point, set `MINIO_PROMETHEUS_AUTH_TYPE` to `public`


## Metrics

List of metrics exposed by MinIO

MinIO server exposes the following metrics on /minio/prometheus/metrics endpoint. All of these can be accessed via Prometheus dashboard. The full list of exposed metrics along with their definition is available in the demo server at https://play.min.io:9000/minio/prometheus/metrics

### Default set of information

- go_	all standard go runtime metrics
- process_	all process level metrics
- promhttp_	all prometheus scrape metrics

### MinIO node specific information

- minio_version_info	Current MinIO version with its commit-id
- minio_disks_offline	Total number of offline disks on current MinIO instance
- minio_disks_total	Total number of disks on current MinIO instance

### Disk metrics are labeled by 'disk' which indentifies each disk

- disk_storage_total	Total size of the disk
- disk_storage_used	Total disk space used per disk
- disk_storage_available	Total available disk space per disk

### S3 API metrics are labeled by 'api' which identifies different S3 API requests

- s3_rx_bytes_total	Total number of s3 bytes received by current MinIO server instance
- s3_tx_bytes_total	Total number of s3 bytes sent by current MinIO server instance

### Internode metrics only available in a distributed setup
- internode_rx_bytes_total	Total number of internode bytes received by current MinIO server instance
- internode_tx_bytes_total	Total number of bytes sent to the other nodes by current MinIO server instance

### Bucket usage specific metrics

- bucket_usage_size	Total size of the bucket
- bucket_objects_count	Total number of objects in a bucket
- bucket_objects_histogram	Total number of objects filtered by different sizes



## Contributing

Clone repository

git clone https://repo1.dsop.io/platform-one/apps/fluentd-elasticsearch.git

Create a feature branch

git checkout -b <branch>

Stage and commit changes

git add .

git commit -m "Made a change for reasons"

Push commits to upstream branch

git push -u origin <branch>

Create a new merge request
