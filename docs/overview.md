# MinIO

## Overview

MinIO is an object storage application that is fully compatible with the S3 API. Deploying MinIO enables portability for apps that need S3 as a backend so they can run outside of an AWS environment.

The application works by running MinIO Server as a Pod using PersistentVolumes as the backend storage for the objects it is managing.

Please review the BigBang [Architecture Document](https://repo1.dso.mil/platform-one/big-bang/bigbang/-/blob/master/charter/packages/minio/Architecture.md) for more information about its role within BigBang.

## Dependencies

This chart depends on the [minio-operator](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio-operator/-/tree/main/) Big Bang package.

## How it works

This chart works by deploying an instance of MinIO using the MinIOInstance CRD which is created by the MinIO operator. To deploy MinIO, `minioOperator` and `minio` must both be enabled through the addons functionality in the Big Bang [values.yaml](https://repo1.dso.mil/platform-one/big-bang/bigbang/-/blob/master/chart/values.yaml). This will create the MinIO operator in the `minio-operator` namespace and an instance of MinIO in the `minio` namespace.

## External Resources

If you'd like to learn more about the MinIO application and its features, see their [official documentation](https://min.io/).


## Granting Egress to Blocked Services

When Istio hardening is enabled through the settings `istio.enabled` and `istio.enabled.hardened`, a sidecar is injected into the Minio namespace. This sidecar limits network traffic to 'REGISTRY_ONLY', effectively blocking access to external services.

> **Note:** Access to external services will be blocked.

This restriction commonly affects cloud provider object stores configured in the Minio UI. To resolve this, you'll need to identify the hosts blocked by Istio and add a `customServiceEntry` for each one to your Big Bang `values.yaml` file.

### Discovering Blocked Hosts

To find out which hosts are being blocked, inspect the `istio-proxy` logs from the 'minio' pod using the following commands:

```bash
export SOURCE_POD=$(kubectl -n minio get pod -l name=minio -o jsonpath={.items..metadata.name})
kubectl -n minio logs "$SOURCE_POD" -c istio-proxy | grep -i "BlackHoleCluster"
```

Here is an example of a `customServiceEntry` that can be added to your Big Bang `values.yaml`
```yaml
istio:
  enabled: true
  hardened:
    enabled: true
    customServiceEntries:
     - name: "allow-amazonaws"
       enabled: true
       spec:
         hosts:
           - "<bucket-name>.s3.us-gov-west-1.amazonaws.com"
         location: MESH_EXTERNAL
         exportTo:
         - "."
         ports:
         - name: https
           number: 443
           protocol: TLS
         resolution: DNS
```

