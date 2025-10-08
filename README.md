<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# minio-instance

![Version: 7.1.1-bb.11](https://img.shields.io/badge/Version-7.1.1--bb.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v7.1.1](https://img.shields.io/badge/AppVersion-v7.1.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

A Helm chart for MinIO

## Upstream References

- <https://min.io>
- <https://github.com/minio/operator>

## Upstream Release Notes

This package has no upstream release note links on file. Please add some to [chart/Chart.yaml](chart/Chart.yaml) under `annotations.bigbang.dev/upstreamReleaseNotesMarkdown`.
Example:
```yaml
annotations:
  bigbang.dev/upstreamReleaseNotesMarkdown: |
    - [Find our upstream chart's CHANGELOG here](https://link-goes-here/CHANGELOG.md)
    - [and our upstream application release notes here](https://another-link-here/RELEASE_NOTES.md)
```

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install minio-instance chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apiVersion | string | `"minio.min.io/v2"` |  |
| upstream | object | Upstream chart values | Values to pass to [the upstream minio chart](https://github.com/minio/operator/blob/master/helm/tenant/values.yaml) |
| domain | string | `"dev.bigbang.mil"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.hardened.outboundTrafficPolicyMode | string | `"REGISTRY_ONLY"` |  |
| istio.hardened.customServiceEntries | list | `[]` |  |
| istio.hardened.tempo.enabled | bool | `false` |  |
| istio.hardened.tempo.namespaces[0] | string | `"tempo"` |  |
| istio.hardened.tempo.principals[0] | string | `"cluster.local/ns/tempo/sa/tempo-tempo"` |  |
| istio.hardened.minio.enabled | bool | `true` |  |
| istio.hardened.minio.namespaces[0] | string | `"minio"` |  |
| istio.hardened.minio.principals[0] | string | `"cluster.local/ns/minio/sa/minio-minio-minio-instance-sa"` |  |
| istio.hardened.minioOperator.enabled | bool | `true` |  |
| istio.hardened.minioOperator.namespaces[0] | string | `"minio-operator"` |  |
| istio.hardened.minioOperator.principals[0] | string | `"cluster.local/ns/minio-operator/sa/minio-operator"` |  |
| istio.hardened.velero.enabled | bool | `true` |  |
| istio.hardened.velero.namespaces[0] | string | `"velero"` |  |
| istio.hardened.velero.principals[0] | string | `"cluster.local/ns/velero/sa/velero"` |  |
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
| networkPolicies.additionalPolicies | list | `[]` |  |
| openshift | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.permissions.apiGroups[0] | string | `""` |  |
| bbtests.scripts.permissions.resources[0] | string | `"configmaps"` |  |
| bbtests.scripts.permissions.verbs[0] | string | `"create"` |  |
| bbtests.scripts.permissions.verbs[1] | string | `"delete"` |  |
| bbtests.scripts.permissions.verbs[2] | string | `"list"` |  |
| bbtests.scripts.permissions.verbs[3] | string | `"get"` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/minio/mc:RELEASE.2025-08-13T08-35-41Z"` |  |
| bbtests.scripts.envs.MINIO_HOST | string | `"http://minio"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"SECRET_KEY"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"minio-access"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"secretkey"` |  |
| bbtests.scripts.secretEnvs[1].name | string | `"ACCESS_KEY"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.name | string | `"minio-access"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.key | string | `"accesskey"` |  |
| waitJob.enabled | bool | `true` |  |
| waitJob.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.33.5"` |  |
| waitJob.permissions.apiGroups[0] | string | `"minio.min.io"` |  |
| waitJob.permissions.apiGroups[1] | string | `"minio.min.io/v2"` |  |
| waitJob.permissions.resources[0] | string | `"tenants"` |  |
| waitJob.permissions.resources[1] | string | `"tenant"` |  |
| waitJob.permissions.resources[2] | string | `"tenants.minio.min.io"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

