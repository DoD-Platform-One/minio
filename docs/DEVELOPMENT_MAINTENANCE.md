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
