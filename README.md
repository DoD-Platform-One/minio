# Minio Instance Documentation

MinIO is a high performance, distributed object storage system. It is software-defined, runs on industry standard hardware and is 100% open source under the Apache V2 license.

* Operator version based on: 4.0.4
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

## New set of deployment values

This release of the Minio instance is based on the Minio 4.0.4 Operator which creates a CRD for deploying the instance.  
The CRD is now named "tenant" and it's values more comprehensive than the 2.0.9 deploymnet. 

## Deployment
```
git clone https://repo1.dsop.io/platform-one/big-bang/apps/core/monitoring.git
cd monitoring
helm dependency update chart
helm install minio chart --debug
```

## CLI Testing of the Minio Deployment

This helm chart used to deploy Minio instances has additional CLI testing capabilities via the use of Helm Chart Tests
(https://helm.sh/docs/topics/chart_tests).  These tests invoke the MC command line tool to create, delete, populate, 
and retrieve information from Minio buckets.   The tests will succeed if there are no errors reported from the MC CLI.

The package pipelines have been enhanced to execute the "helm test" command and dump the log files of the tests results.

In order to add CLI or API tests, the following enhancements were made to the Helm Chart.

* A test directory was added to the templates/ directory within the helm chart.  This directory contains Kubernetes object 
defintiions which are deployed only when a "helm Test" command is executed.   For example, the Minio tests are composed of 
3 YAML files.   One file contians a configmap definition that is used by the other YAML files.  These second and thrid 
files contain pod defintions that are to be executed and return success or failure (i.e., the container should exit 
successfully with an exit 0 for a test to be considered a success).
* Each test object defintion must contain a "helm.sh/hook: test-success" annotation telling Helm that this object is a 
test and should only be deployed when tests are executed. The following example create a configmap that is only 
created during testing. 

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: "{{ .Release.Name }}-cypress-test-configmap"
  annotations:
    "helm.sh/hook": test-success
    "helm.sh/hook-weight": "5"
    sidecar.istio.io/inject: "false"
  labels:
    helm-test: enabled
    {{- include "minio.labels" . | nindent 4 }}
  namespace: {{ .Release.Namespace }}
data:
{{ (.Files.Glob "cypress/*").AsConfig | indent 2 }}

```    
Also note that the "helm.sh/hook-weight" can be used to order the creation and execution of test objects.    

To execute the tests, execute the command "helm test <helm deployment name> -n <namespace>".   
This execute the tests with output similar to:

```
helm test minio-minio -n bigbang
Pod minio-minio-access-test pending
Pod minio-minio-access-test running
Pod minio-minio-access-test succeeded
Pod minio-minio-ui-test pending
Pod minio-minio-ui-test pending
Pod minio-minio-ui-test running
Pod minio-minio-ui-test succeeded
NAME: minio-minio
LAST DEPLOYED: Thu Apr  8 23:50:45 2021
NAMESPACE: minio
STATUS: deployed
REVISION: 1
TEST SUITE:     minio-minio-cypress-test-configmap
Last Started:   Thu Apr  8 17:51:19 2021
Last Completed: Thu Apr  8 17:51:19 2021
Phase:          Succeeded
TEST SUITE:     minio-minio-ui-test
Last Started:   Thu Apr  8 17:51:22 2021
Last Completed: Thu Apr  8 17:51:43 2021
Phase:          Succeeded
TEST SUITE:     minio-minio-access-test
Last Started:   Thu Apr  8 17:51:19 2021
Last Completed: Thu Apr  8 17:51:22 2021
Phase:          Succeeded

``` 

 

