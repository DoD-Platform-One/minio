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

When Istio is enabled with a restrictive outbound traffic policy, a sidecar is injected into the MinIO namespace. This sidecar can limit network traffic to `REGISTRY_ONLY`, effectively blocking access to external services.

> **Note:** Access to external services will be blocked when using `REGISTRY_ONLY` mode.

This restriction commonly affects cloud provider object stores configured in the MinIO UI. To resolve this, you'll need to identify the hosts blocked by Istio and add a ServiceEntry for each one to your values.

### Discovering Blocked Hosts

To find out which hosts are being blocked, inspect the `istio-proxy` logs from the MinIO pod using the following commands:

```bash
export SOURCE_POD=$(kubectl -n minio get pod -l app.kubernetes.io/name=minio-instance -o jsonpath={.items..metadata.name})
kubectl -n minio logs "$SOURCE_POD" -c istio-proxy | grep -i "BlackHoleCluster"
```

### Configuring Istio with bb-common

This chart uses `bb-common` for Istio resource rendering. Here is an example configuration to enable Istio with a custom ServiceEntry:

```yaml
istio:
  enabled: true
  sidecar:
    enabled: true
    outboundTrafficPolicyMode: REGISTRY_ONLY
  serviceEntries:
    custom:
      - name: "allow-amazonaws"
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

See the [bb-common Istio documentation](https://repo1.dso.mil/big-bang/product/packages/bb-common/-/tree/main/docs/istio) for full configuration options.

