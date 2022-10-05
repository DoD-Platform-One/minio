# Changelog

---
## [4.5.1-bb.0] - 2022-10-3
### Changed
- Update MinIO image to RELEASE.2022-09-25T15-44-53Z
- Update tenant configuration to match operator version 4.5.1
- Updated credential usage in tenant due to deprecated minio operator feature in te CRD.

## [4.4.28-bb.1] - 2022-08-23
### Changed
- Update MinIO image to RELEASE.2022-08-26T19-53-15Z

## [4.4.25-bb.0] - 2022-07-11
### Changed
- Update to 4.4.25
- Update MinIO image to RELEASE.2022-07-08T00-05-23Z

## [4.4.16-bb.0] - 2022-05-05
### Changed
- Update to 4.4.16
- Update MinIO image to RELEASE.2022-04-30T22-23-53Z
- Modified by BB to use with instead of range in NOTES and tenant-secret

## [4.4.12-bb.4] - 2022-04-22
### Added
- Added mTLS PeerAuthentication policy for minio pods 

## [4.4.12-bb.3] - 2022-04-14
### Fixed
- Update BB version annotation to RELEASE.2022-04-12T06-55-35Z

## [4.4.12-bb.2] - 2022-04-13
### Changed
- Update MinIO image to RELEASE.2022-04-12T06-55-35Z

## [4.4.12-bb.1] - 2022-03-30
### Added
- Added Tempo Zipkin Egress Policy

## [4.4.12-bb.0] - 2022-03-25

### Changed

- Update to 4.4.12
- Moved Big Bang virtual service definitions to templates/bigbang

## [4.4.10-bb.1] - 2022-03-24

### Added

- Grafana dashboards moved in from Monitoring

## [4.4.10-bb.0] - 2022-02-22

### Changed

- Update to 4.4.10
- Markdown linting and spell checking.

## [4.4.3-bb.2] - 2022-02-15

### Fixed

- Pass through custom annotation to the tenant chart

## [4.4.3-bb.2] - 2022-02-01

### Changed

- Fix a few NPs to bind to all pods and limit ingress on source namespace label

## [4.4.3-bb.1] - 2022-01-31

### Updated

- Update Chart.yaml to follow new standardization for release automation
- Added renovate check to update new standardization

## [4.4.3-bb.0] - 2022-01-24

### Changed

- Update to 4.4.3 -- upstream charts now split on operator/tenant charts -- kpt is used now
- Charts are now closer to upstream versions

## [4.2.3-bb.10] - 2022-01-20

### Changed

- Relocated bbtests from `test-values.yaml` to `values.yaml`

## [4.2.3-bb.9] - 2022-01-05

### Changed

- Added annotations to Tenant

## [4.2.3-bb.8] - 2021-11-29

### Changed

- Changed cypress timeout value to 15000 for testing access to UI

## [4.2.3-bb.7] - 2021-11-22

### Added

- Added virtual service for minio api
- Modified network polices to allow communication to minio api

## [4.2.3-bb.6] - 2021-10-19

### Fixed

- Fixed pipeline CRD wait script

## [4.2.3-bb.5] - 2021-10-19

### Fixed

- Set network policy to the correct port for prometheus scraping

## [4.2.3-bb.4] - 2021-10-14

### Added

- Update README with gluon template

## [4.2.3-bb.3] - 2021-9-29

### Added

- Modify script helm test

## [4.2.3-bb.2] - 2021-9-29

### Added

- NP for operator ingress

## [4.2.3-bb.1] - 2021-9-14

### Changed

- Setting upgradeTenants to true by default.

## [4.2.3-bb.0] - 2021-9-09

### Changed

- Update to 4.2.3

## [4.1.2-bb.6] - 2021-8-25

### Changed

- Changed label passthrough in istio network policy

## [4.1.2-bb.5] - 2021-8-18

### Added

- Add resource requests and resource limits to Minio containers

## [4.1.2-bb.4] - 2021-7-28

### Added

- Add openshift toggle. If it's set, add port 5353 egress rule.

## [4.1.2-bb.3] - 2021-7-26

### Fixes

- remove incorrect annotations from tenant

## [4.1.2-bb.2] - 2021-7-23

### Fixes

- minor fixes to tenant and virtual service templates

## [4.1.2-bb.1] - 2021-7-21

### Updated & Upgraded

- Added infrastructure to support a phases upgrade from version 2.0.9 to version 4.1.2
- NOTE/IMPORTANT: an backup restore of data is required to upgrade from 2.0.9 to 4.1.2
- Added infrastructure and use of new "tenant v2" CRD as handled by the Minio Operator 4.1.2
- Updated documentation
- Refactored secrets to streamline their generation
- Enabled Minio Operator 4.1.2 to create services for tenant deployment
- Please note the storage requirements in the README for deploying this instance.

## [4.0.4-bb.5] - 2021-06-14

### Added

- Added network policies

## [4.0.4-bb.4]

### Added

- Conditional for console enabled / disabled since upstream image is being used

## [4.0.4-bb.3]

### Fixed

- Default values at only one of the levels needed for tenant spec

## [4.0.4-bb.2]

### Changed

- Migrated to new Helm library for testing
- Defaulted IPS to `private-registry`
- Defaulted SecurityContext to IB standard
- Refactored secrets to better "auto-create"

## [4.0.4-bb.1]

### Changed

- Upgraded deployment of Minio using the Minio 4.0.4 operator.
- Added delay in test startup due to time delay to startup minio instances

## [2.0.9-bb.9]

### Added

- Added Virtual Service Parameters

## [2.0.9-bb.8]

### Added

- Added security context for minio

## [2.0.9-bb.7]

### Added

- Added helm tests for mc and cypress

## [2.0.9-bb.6]

### Changed

- Disabling istio toggle by default, will inherit settings from BigBang chart.

## [2.0.9-bb.2]

### Changed

- Repository cleanup

## [2.0.9-bb.1]

### Changed

- Refactor to deploy with helm chart in Big Bang Umbrella.

## [0.1.1]

### Added

- Manifests for deploying minio 1.0.7
