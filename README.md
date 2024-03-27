# minio-instance

![Version: 5.0.12-bb.6](https://img.shields.io/badge/Version-5.0.12--bb.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: RELEASE.2024-03-15T01-07-19Z](https://img.shields.io/badge/AppVersion-RELEASE.2024--03--15T01--07--19Z-informational?style=flat-square)

A Helm chart for MinIO Tenants

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
| domain | string | `"bigbang.dev"` |  |
| upgradeTenants.enabled | bool | `true` |  |
| annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| service.nameOverride | string | `""` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `9090` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.hardened.tempo.enabled | bool | `false` |  |
| istio.hardened.tempo.namespaces[0] | string | `"tempo"` |  |
| istio.hardened.tempo.principals[0] | string | `"cluster.local/ns/tempo/sa/tempo-tempo"` |  |
| istio.hardened.minio.enabled | bool | `true` |  |
| istio.hardened.minio.namespaces[0] | string | `"minio"` |  |
| istio.hardened.minio.principals[0] | string | `"cluster.local/ns/minio/sa/minio-minio-minio-instance-sa"` |  |
| istio.mtls.mode | string | `"STRICT"` |  |
| istio.console.enabled | bool | `true` |  |
| istio.console.annotations | object | `{}` |  |
| istio.console.labels | object | `{}` |  |
| istio.console.gateways[0] | string | `"istio-system/main"` |  |
| istio.console.hosts[0] | string | `"minio.{{ .Values.domain }}"` |  |
| istio.console.service | string | `""` |  |
| istio.console.port | string | `""` |  |
| istio.api.enabled | bool | `true` |  |
| istio.api.annotations | object | `{}` |  |
| istio.api.labels | object | `{}` |  |
| istio.api.gateways[0] | string | `"istio-system/main"` |  |
| istio.api.hosts[0] | string | `"minio-api.{{ .Values.domain }}"` |  |
| istio.api.service | string | `""` |  |
| istio.api.port | string | `""` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| openshift | bool | `false` |  |
| secrets.name | string | `"minio-creds-secret"` |  |
| secrets.accessKey | string | `"minio"` |  |
| secrets.secretKey | string | `"minio123"` |  |
| apiVersion | string | `"minio.min.io/v2"` |  |
| tenant.name | string | `"minio"` |  |
| tenant.image.repository | string | `"registry1.dso.mil/ironbank/opensource/minio/minio"` |  |
| tenant.image.tag | string | `"RELEASE.2024-03-15T01-07-19Z"` |  |
| tenant.image.pullPolicy | string | `"IfNotPresent"` |  |
| tenant.imagePullSecret.name | string | `"private-registry"` |  |
| tenant.scheduler | object | `{}` |  |
| tenant.configuration.name | string | `"myminio-env-configuration"` |  |
| tenant.pools[0].servers | int | `4` |  |
| tenant.pools[0].name | string | `"pool-0"` |  |
| tenant.pools[0].volumesPerServer | int | `4` |  |
| tenant.pools[0].size | string | `"10Gi"` |  |
| tenant.pools[0].storageClassName | string | `""` |  |
| tenant.pools[0].storageAnnotations | object | `{}` |  |
| tenant.pools[0].annotations | object | `{}` |  |
| tenant.pools[0].labels | object | `{}` |  |
| tenant.pools[0].tolerations | list | `[]` |  |
| tenant.pools[0].nodeSelector | object | `{}` |  |
| tenant.pools[0].affinity | object | `{}` |  |
| tenant.pools[0].resources.requests.memory | string | `"2Gi"` |  |
| tenant.pools[0].resources.requests.cpu | string | `"1000m"` |  |
| tenant.pools[0].resources.limits.memory | string | `"2Gi"` |  |
| tenant.pools[0].resources.limits.cpu | string | `"1000m"` |  |
| tenant.pools[0].securityContext.runAsUser | int | `1001` |  |
| tenant.pools[0].securityContext.runAsGroup | int | `1001` |  |
| tenant.pools[0].securityContext.fsGroup | int | `1001` |  |
| tenant.pools[0].securityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| tenant.pools[0].securityContext.runAsNonRoot | bool | `true` |  |
| tenant.pools[0].containerSecurityContext.runAsUser | int | `1001` |  |
| tenant.pools[0].containerSecurityContext.runAsGroup | int | `1001` |  |
| tenant.pools[0].containerSecurityContext.runAsNonRoot | bool | `true` |  |
| tenant.pools[0].topologySpreadConstraints | list | `[]` |  |
| tenant.mountPath | string | `"/export"` |  |
| tenant.subPath | string | `"/data"` |  |
| tenant.metrics.enabled | bool | `false` |  |
| tenant.metrics.port | int | `9000` |  |
| tenant.metrics.protocol | string | `"http"` |  |
| tenant.certificate.externalCaCertSecret | list | `[]` |  |
| tenant.certificate.externalCertSecret | list | `[]` |  |
| tenant.certificate.requestAutoCert | bool | `false` |  |
| tenant.certificate.certConfig | object | `{}` |  |
| tenant.features.bucketDNS | bool | `false` |  |
| tenant.features.domains | object | `{}` |  |
| tenant.features.enableSFTP | bool | `false` |  |
| tenant.buckets | list | `[]` |  |
| tenant.users | list | `[]` |  |
| tenant.podManagementPolicy | string | `"Parallel"` |  |
| tenant.liveness | object | `{}` |  |
| tenant.readiness | object | `{}` |  |
| tenant.startup | object | `{}` |  |
| tenant.exposeServices | object | `{}` |  |
| tenant.serviceAccountName | string | `""` |  |
| tenant.prometheusOperator | bool | `false` |  |
| tenant.logging | object | `{}` |  |
| tenant.serviceMetadata | object | `{}` |  |
| tenant.env | list | `[]` |  |
| tenant.priorityClassName | string | `""` |  |
| tenant.additionalVolumes | list | `[]` |  |
| tenant.additionalVolumeMounts | list | `[]` |  |
| tenant.prometheus.disabled | bool | `true` |  |
| tenant.prometheus.image | string | `""` |  |
| tenant.prometheus.env | list | `[]` |  |
| tenant.prometheus.sidecarimage | string | `""` |  |
| tenant.prometheus.initimage | string | `""` |  |
| tenant.prometheus.diskCapacityGB | bool | `false` |  |
| tenant.prometheus.storageClassName | string | `""` |  |
| tenant.prometheus.annotations | object | `{}` |  |
| tenant.prometheus.labels | object | `{}` |  |
| tenant.prometheus.nodeSelector | object | `{}` |  |
| tenant.prometheus.tolerations | list | `[]` |  |
| tenant.prometheus.affinity.nodeAffinity | object | `{}` |  |
| tenant.prometheus.affinity.podAffinity | object | `{}` |  |
| tenant.prometheus.affinity.podAntiAffinity | object | `{}` |  |
| tenant.prometheus.resources | object | `{}` |  |
| tenant.prometheus.serviceAccountName | string | `""` |  |
| tenant.prometheus.securityContext.runAsUser | int | `1001` |  |
| tenant.prometheus.securityContext.runAsGroup | int | `1001` |  |
| tenant.prometheus.securityContext.runAsNonRoot | bool | `true` |  |
| tenant.prometheus.securityContext.fsGroup | int | `1001` |  |
| tenant.log.disabled | bool | `true` |  |
| tenant.log.image | string | `""` |  |
| tenant.log.env | list | `[]` |  |
| tenant.log.resources | object | `{}` |  |
| tenant.log.nodeSelector | object | `{}` |  |
| tenant.log.affinity.nodeAffinity | object | `{}` |  |
| tenant.log.affinity.podAffinity | object | `{}` |  |
| tenant.log.affinity.podAntiAffinity | object | `{}` |  |
| tenant.log.tolerations | list | `[]` |  |
| tenant.log.annotations | object | `{}` |  |
| tenant.log.labels | object | `{}` |  |
| tenant.log.audit.diskCapacityGB | bool | `false` |  |
| tenant.log.db.image | string | `""` |  |
| tenant.log.db.env | list | `[]` |  |
| tenant.log.db.initimage | string | `""` |  |
| tenant.log.db.volumeClaimTemplate.metadata | object | `{}` |  |
| tenant.log.db.volumeClaimTemplate.spec.storageClassName | string | `""` |  |
| tenant.log.db.volumeClaimTemplate.spec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| tenant.log.db.volumeClaimTemplate.spec.resources.requests.storage | string | `"1Gi"` |  |
| tenant.log.db.resources | object | `{}` |  |
| tenant.log.db.nodeSelector | object | `{}` |  |
| tenant.log.db.affinity.nodeAffinity | object | `{}` |  |
| tenant.log.db.affinity.podAffinity | object | `{}` |  |
| tenant.log.db.affinity.podAntiAffinity | object | `{}` |  |
| tenant.log.db.tolerations | list | `[]` |  |
| tenant.log.db.annotations | object | `{}` |  |
| tenant.log.db.labels | object | `{}` |  |
| tenant.log.db.serviceAccountName | string | `""` |  |
| tenant.log.db.securityContext.runAsUser | int | `999` |  |
| tenant.log.db.securityContext.runAsGroup | int | `999` |  |
| tenant.log.db.securityContext.runAsNonRoot | bool | `true` |  |
| tenant.log.db.securityContext.fsGroup | int | `999` |  |
| tenant.log.serviceAccountName | string | `""` |  |
| tenant.log.securityContext.runAsUser | int | `1001` |  |
| tenant.log.securityContext.runAsGroup | int | `1001` |  |
| tenant.log.securityContext.runAsNonRoot | bool | `true` |  |
| tenant.log.securityContext.fsGroup | int | `1001` |  |
| ingress.api.enabled | bool | `false` |  |
| ingress.api.ingressClassName | string | `""` |  |
| ingress.api.labels | object | `{}` |  |
| ingress.api.annotations | object | `{}` |  |
| ingress.api.tls | list | `[]` |  |
| ingress.api.host | string | `"minio.local"` |  |
| ingress.api.path | string | `"/"` |  |
| ingress.api.pathType | string | `"Prefix"` |  |
| ingress.console.enabled | bool | `false` |  |
| ingress.console.ingressClassName | string | `""` |  |
| ingress.console.labels | object | `{}` |  |
| ingress.console.annotations | object | `{}` |  |
| ingress.console.tls | list | `[]` |  |
| ingress.console.host | string | `"minio-console.local"` |  |
| ingress.console.path | string | `"/"` |  |
| ingress.console.pathType | string | `"Prefix"` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.resources.requests.cpu | string | `"1"` |  |
| bbtests.cypress.resources.requests.memory | string | `"1Gi"` |  |
| bbtests.cypress.resources.limits.cpu | string | `"2"` |  |
| bbtests.cypress.resources.limits.memory | string | `"2Gi"` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://{{ include \"minio-operator.fullname\" . \| trim }}-console:{{ include \"minio-operator.servicePort\" . \| trim }}/login"` |  |
| bbtests.cypress.secretEnvs[0].name | string | `"cypress_secretkey"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ .Values.secrets.name }}"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"secretkey"` |  |
| bbtests.cypress.secretEnvs[1].name | string | `"cypress_accesskey"` |  |
| bbtests.cypress.secretEnvs[1].valueFrom.secretKeyRef.name | string | `"{{ .Values.secrets.name }}"` |  |
| bbtests.cypress.secretEnvs[1].valueFrom.secretKeyRef.key | string | `"accesskey"` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/minio/mc:RELEASE.2024-03-13T23-51-57Z"` |  |
| bbtests.scripts.envs.MINIO_PORT | string | `"80"` |  |
| bbtests.scripts.envs.MINIO_HOST | string | `"http://minio"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"SECRET_KEY"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ .Values.secrets.name }}"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"secretkey"` |  |
| bbtests.scripts.secretEnvs[1].name | string | `"ACCESS_KEY"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.name | string | `"{{ .Values.secrets.name }}"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.key | string | `"accesskey"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
