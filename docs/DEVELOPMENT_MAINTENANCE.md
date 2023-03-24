# How to upgrade

Upgrading the minio instance can be a a little tricky since there are a number of changes that are unique to the minio instance deployed by Big Bang.
You can not simply do a kpt pull and replace since there are unique changes that must be maintained.   This is because of the way the minio tenant was originally deployed by
in the upstream minio operator charts.

 1. Sync with new chart. This can be done with kpt or meld:  Be careful not to overwrite the Big Bang specific changes.
 `kpt pkg update chart/@{TAG} --strategy alpha-git-patch`
 or
 `kpt pkg update chart/@{TAG} --strategy force-delete-replace`
 or
 Meld UI
 1. Move `minio.min.io_tenants.yaml` to `minio-operator-crds/templates/`
 1. Update `minio-operator-crds/Chart.yaml` with new version
 1. Update `chart/Chart.yaml` dependency version
 1. Rebuild dependency .tgz:
 `export HELM_EXPERIMENTAL_OCI=1`
 `helm dependency update chart`

# How to test the upgrade

Local install:
1. Clean install:
install minio-operator and minio from your branch.
1. Upgrade:
install current versions of minio-operator and minio, and upgrade to your branch. Ensure both minio-operator and minio have upgraded to the newer versions.

Pipeline:
modify [MinIO](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio/-/blob/main/tests/dependencies.yaml) package dependency to point to your branch/version and create an MR

# Modifications made to upstream chart
This is a high-level list of modifications that Big Bang has made to the upstream helm chart. You can use this as as cross-check to make sure that no modifications were lost during the upgrade process.

## When performing the helm update the following items should be maintained.
- in chart/templates/_helpers.tpl: keep the BB specific _helpers
```
{{/* Big Bang Added Helpers Start Here */}}

{{/*
Create the name of the service used to access the Minio object UI.
Note: the Minio operator has a fixed name of "minio" for the service it creates.
*/}}
{{- define "minio-operator.serviceName" }}
{{- if .Values.upgradeTenants.enabled -}}
minio
{{- else -}}
{{- default (include "minio.fullname" .) .Values.service.nameOverride }}
{{- end }}
{{- end }}

```
- in chart/templates/tenant-configuration.yaml:  keep the secrets data access key changes._helpers
```r
{{- if dig "secrets" true (.Values | merge (dict)) }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ dig "secrets" "name" "" (.Values | merge (dict)) }}
type: Opaque
stringData:
  config.env: |-
    export MINIO_ROOT_USER={{ .Values.secrets.accessKey | quote }}
    export MINIO_ROOT_PASSWORD={{ .Values.secrets.secretKey | quote }}
data:
  ## Access Key for MinIO Tenant
  accesskey: {{ dig "secrets" "accessKey" "" (.Values | merge (dict)) | b64enc }}
  ## Secret Key for MinIO Tenant
  secretkey: {{ dig "secrets" "secretKey" "" (.Values | merge (dict)) | b64enc }}
  {{- end }}
```
- in charts/templates/tenant.yaml:  keep the changes associated with..._helpers
    - assigning the metadata/name
    - spec/image name
    - spec/configuration secret and name
    - metadata/annotations

##  chart/values.yaml
- Bigbang additions at the end of the file
- images to ironbank

## chart/templates/bigbang/*
- networkpolicies/*
- minio-operaotor-exception.yaml
- peer-authentication.yaml
- tenant-patch-job.yaml

##  chart/charts/*.tgz
- run ```helm dependency update ./chart``` and commit the downloaded archives

- commit the tar archives that were downloaded from the helm dependency update command. And also commit the requirements.lock that was generated.
