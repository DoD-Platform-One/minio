# minio-instance

![Version: 4.2.3-bb.8](https://img.shields.io/badge/Version-4.2.3--bb.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.2.3](https://img.shields.io/badge/AppVersion-v4.2.3-informational?style=flat-square)

A Helm chart for MinIO based on Minio Operator 4.2.3

## Upstream References
* <https://min.io>

* <https://github.com/minio/operator>

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install minio-instance chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hostname | string | `"bigbang.dev"` |  |
| upgradeTenants.enabled | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| service.nameOverride | string | `""` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `9090` |  |
| podAnnotations | object | `{}` |  |
| istio.enabled | bool | `false` |  |
| istio.console.enabled | bool | `true` |  |
| istio.console.annotations | object | `{}` |  |
| istio.console.labels | object | `{}` |  |
| istio.console.gateways[0] | string | `"istio-system/main"` |  |
| istio.console.hosts[0] | string | `"minio.{{ .Values.hostname }}"` |  |
| istio.console.service | string | `""` |  |
| istio.console.port | string | `""` |  |
| istio.api.enabled | bool | `true` |  |
| istio.api.annotations | object | `{}` |  |
| istio.api.labels | object | `{}` |  |
| istio.api.gateways[0] | string | `"istio-system/main"` |  |
| istio.api.hosts[0] | string | `"minio-api.{{ .Values.hostname }}"` |  |
| istio.api.service | string | `""` |  |
| istio.api.port | string | `""` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| image.name | string | `"registry1.dso.mil/ironbank/opensource/minio/minio"` |  |
| image.tag | string | `"RELEASE.2021-08-31T05-46-54Z"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| zones.servers | int | `3` |  |
| volumesPerServer | int | `2` |  |
| volumeClaimTemplate.accessModes | string | `"ReadWriteOnce"` |  |
| volumeClaimTemplate.storage | string | `"1Gi"` |  |
| minioRootCreds | string | `"default-minio-creds-secret"` |  |
| tenants.name | string | `"minio"` |  |
| tenants.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/minio"` |  |
| tenants.image.tag | string | `"RELEASE.2021-08-31T05-46-54Z"` |  |
| tenants.image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants.imagePullSecret.name | string | `"private-registry"` |  |
| tenants.scheduler | object | `{}` |  |
| tenants.pools[0].servers | int | `4` |  |
| tenants.pools[0].volumesPerServer | int | `4` |  |
| tenants.pools[0].size | string | `"1Gi"` |  |
| tenants.pools[0].storageClassName | string | `"local-path"` |  |
| tenants.pools[0].tolerations | object | `{}` |  |
| tenants.pools[0].nodeSelector | object | `{}` |  |
| tenants.pools[0].affinity | object | `{}` |  |
| tenants.pools[0].resources.requests.cpu | string | `"250m"` |  |
| tenants.pools[0].resources.requests.memory | string | `"2Gi"` |  |
| tenants.pools[0].resources.limits.cpu | string | `"250m"` |  |
| tenants.pools[0].resources.limits.memory | string | `"2Gi"` |  |
| tenants.pools[0].securityContext.runAsUser | int | `1001` |  |
| tenants.pools[0].securityContext.runAsGroup | int | `1001` |  |
| tenants.pools[0].securityContext.fsGroup | int | `1001` |  |
| tenants.mountPath | string | `"/export"` |  |
| tenants.subPath | string | `"/data"` |  |
| tenants.secrets.enabled | bool | `true` |  |
| tenants.secrets.name | string | `"minio-creds-secret"` |  |
| tenants.secrets.accessKey | string | `"minio"` |  |
| tenants.secrets.secretKey | string | `"minio123"` |  |
| tenants.metrics.enabled | bool | `false` |  |
| tenants.metrics.port | int | `9000` |  |
| tenants.certificate.externalCaCertSecret | object | `{}` |  |
| tenants.certificate.externalCertSecret | object | `{}` |  |
| tenants.certificate.requestAutoCert | bool | `false` |  |
| tenants.certificate.certConfig | object | `{}` |  |
| tenants.s3.bucketDNS | bool | `false` |  |
| tenants.podManagementPolicy | string | `"Parallel"` |  |
| tenants.serviceMetadata.minioServiceLabels.label | string | `"minio-svc"` |  |
| tenants.serviceMetadata.minioServiceAnnotations."v2.min.io" | string | `"minio-svc"` |  |
| tenants.env | object | `{}` |  |
| tenants.priorityClassName | string | `""` |  |
| tenants.console.enabled | bool | `false` |  |
| tenants.console.image.repository | string | `"minio/console"` |  |
| tenants.console.image.tag | string | `"v0.7.4"` |  |
| tenants.console.image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants.console.replicaCount | int | `1` |  |
| tenants.console.secrets.enabled | bool | `true` |  |
| tenants.console.secrets.name | string | `"console-secret"` |  |
| tenants.console.secrets.passphrase | string | `"SECRET"` |  |
| tenants.console.secrets.salt | string | `"SECRET"` |  |
| tenants.console.secrets.accessKey | string | `"YOURCONSOLEACCESS"` |  |
| tenants.console.secrets.secretKey | string | `"YOURCONSOLESECRET"` |  |
| openshift | bool | `false` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
