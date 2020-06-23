# Minio Operator

Project [here](https://github.com/minio/minio-operator).

MinIO is a high performance, distributed object storage system. It is software-defined, runs on industry standard hardware and is 100% open source under the Apache V2 license.

App Version: Operator 1.0.7, instance 1.0.7
Plugins: 
Additional docs for using  and its plugins can be found at $URL
The containers being used are maintained in the public/apps/minio registry.  These containers ahve not been hardened, but have been retagged.  When available hardened containers will be implemented.

secrets=minio-creds-secret

Usage

Prerequisites

Kubernetes cluster deployed
Kubernetes config installed in ~/.kube/config




Install kubectl
brew install kubectl
Install kustomize
brew install kustomize

Deployment
Clone repository
git clone https://repo1.dsop.io/platform-one/apps/fluentd-elasticsearch.git
cd fluentd-elasticsearch
Apply kustomized manifest
kubectl -k ./

Operations
By default, this application will use an index prefix name of logstash. To verify and configure the
index, utilize Kibana Discover.
The Fluentd inputs and outputs are defined in the ConfigMap resource, which sources from the conf files.

Container Environment Variables
These variables are patched in via kustomize and may require modifications depending on your
environment.






Contributing
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
