<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# minio-instance

![Version: 7.1.1-bb.16](https://img.shields.io/badge/Version-7.1.1--bb.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v7.1.1](https://img.shields.io/badge/AppVersion-v7.1.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

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
| networkPolicies | object | Basic configuration for minio to run and allow cluster-wide access to minio's S3 API on port 9000 | Network Policy configuration; see bb-common network policy docs for details: https://repo1.dso.mil/big-bang/product/packages/bb-common/-/tree/main/docs/network-policies?ref_type=heads |
| routes | object | Route skeletons configured for minio API and console; no gateways or hosts defined and routes disabled | Routes configuration; see bb-common routes docs for details: https://repo1.dso.mil/big-bang/product/packages/bb-common/-/tree/main/docs/routes?ref_type=heads |
| istio | object | Istio disabled | Istio configuration; see bb-common istio docs for details: https://repo1.dso.mil/big-bang/product/packages/bb-common/-/tree/main/docs/istio?ref_type=heads |
| monitoring.enabled | bool | `false` |  |
| apiVersion | string | `"minio.min.io/v2"` |  |
| upstream | object | Upstream chart values | Values to pass to [the upstream minio chart](https://github.com/minio/operator/blob/master/helm/tenant/values.yaml) |
| openshift | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.permissions.apiGroups[0] | string | `""` |  |
| bbtests.scripts.permissions.resources[0] | string | `"configmaps"` |  |
| bbtests.scripts.permissions.verbs[0] | string | `"create"` |  |
| bbtests.scripts.permissions.verbs[1] | string | `"delete"` |  |
| bbtests.scripts.permissions.verbs[2] | string | `"list"` |  |
| bbtests.scripts.permissions.verbs[3] | string | `"get"` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/big-bang/devops-tester:1.0"` |  |
| bbtests.scripts.envs.MINIO_HOST | string | `"http://minio"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"SECRET_KEY"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"minio-access"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"secretkey"` |  |
| bbtests.scripts.secretEnvs[1].name | string | `"ACCESS_KEY"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.name | string | `"minio-access"` |  |
| bbtests.scripts.secretEnvs[1].valueFrom.secretKeyRef.key | string | `"accesskey"` |  |
| waitJob.enabled | bool | `true` |  |
| waitJob.permissions.apiGroups[0] | string | `"minio.min.io"` |  |
| waitJob.permissions.apiGroups[1] | string | `"minio.min.io/v2"` |  |
| waitJob.permissions.resources[0] | string | `"tenants"` |  |
| waitJob.permissions.resources[1] | string | `"tenant"` |  |
| waitJob.permissions.resources[2] | string | `"tenants.minio.min.io"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

