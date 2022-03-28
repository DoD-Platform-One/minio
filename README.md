# minio-instance

![Version: 4.4.10-bb.1](https://img.shields.io/badge/Version-4.4.10--bb.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.4.10](https://img.shields.io/badge/AppVersion-v4.4.10-informational?style=flat-square)

A Helm chart for MinIO Operator

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
| annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| service.nameOverride | string | `""` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `9090` |  |
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
| openshift | bool | `false` |  |
| tenants.name | string | `"minio"` |  |
| tenants.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/minio"` |  |
| tenants.image.tag | string | `"RELEASE.2022-02-26T02-54-46Z"` |  |
| tenants.image.pullPolicy | string | `"IfNotPresent"` |  |
| tenants.imagePullSecret.name | string | `"private-registry"` |  |
| tenants.scheduler | object | `{}` |  |
| tenants.pools[0].servers | int | `4` |  |
| tenants.pools[0].volumesPerServer | int | `4` |  |
| tenants.pools[0].size | string | `"1Gi"` |  |
| tenants.pools[0].storageClassName | string | `""` |  |
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
| tenants.pools[0].securityContext.runAsNonRoot | bool | `true` |  |
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
| tenants.liveness | object | `{}` |  |
| tenants.readiness | object | `{}` |  |
| tenants.exposeServices | object | `{}` |  |
| tenants.serviceAccountName | string | `""` |  |
| tenants.prometheusOperator | bool | `false` |  |
| tenants.logging | object | `{}` |  |
| tenants.serviceMetadata | object | `{}` |  |
| tenants.env | object | `{}` |  |
| tenants.priorityClassName | string | `""` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://{{ include \"minio-operator.fullname\" . \| trim }}-console:{{ include \"minio-operator.servicePort\" . \| trim }}/login"` |  |
| bbtests.cypress.secretEnvs[0].name | string | `"cypress_secretkey"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ .Values.tenants.secrets.name }}"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"secretkey"` |  |
| bbtests.cypress.secretEnvs[1].name | string | `"cypress_accesskey"` |  |
| bbtests.cypress.secretEnvs[1].valueFrom.secretKeyRef.name | string | `"{{ .Values.tenants.secrets.name }}"` |  |
| bbtests.cypress.secretEnvs[1].valueFrom.secretKeyRef.key | string | `"accesskey"` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/minio/mc:RELEASE.2022-02-26T03-58-31Z"` |  |
| bbtests.scripts.envs.MINIO_PORT | string | `"80"` |  |
| bbtests.scripts.envs.MINIO_HOST | string | `"http://minio"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"SECRET_KEY"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ .Values.tenants.secrets.name }}"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"secretkey"` |  |
| bbtests.scripts.secretEnvs[1].name | string | `"ACCESS_KEY"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.name | string | `"{{ .Values.tenants.secrets.name }}"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.key | string | `"accesskey"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
