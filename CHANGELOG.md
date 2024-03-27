# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [5.0.12-bb.6] - 2024-03-25
### Changed
- Updated minio to `RELEASE.2024-03-15T01-07-19Z`
- Updated mc to `RELEASE.2024-03-13T23-51-57Z`

## [5.0.12-bb.5] - 2024-03-15
### Added
- Adding the minio policy for limited intranamespace communication

## [5.0.12-bb.4] - 2024-03-08
### Changed
- Openshift update for deploying Minio into Openshift cluster

## [5.0.12-bb.3] - 2024-02-13
### Changed
- Updated minio to `RELEASE.2024-02-26T09-33-48Z`
- Updated mc to `RELEASE.2024-02-24T01-33-20Z`

## [5.0.12-bb.2] - 2024-02-20
### Changed
- Updated Renovate to include helmv3

## [5.0.12-bb.1] - 2024-02-13
### Changed
- Modified test-values.yaml to reduce pod creation, was causing issues with pipelines

## [5.0.12-bb.0] - 2024-02-13
### Changed
- Updated minio to `RELEASE.2024-02-09T21-25-16Z`
- Updated mc to `RELEASE.2024-02-09T22-18-24Z`
- Updated gluon to `0.4.8`

## [5.0.11-bb.6] - 2024-02-09
### Changed
- fixed ingress gateway authorization policy

## [5.0.11-bb.5] - 2024-02-06
### Changed
- Updated minio to `RELEASE.2024-02-04T22-36-13Z`

## [5.0.11-bb.4] - 2024-02-05
### Changed
- Updated minio to `RELEASE.2024-01-31T20-20-33Z`
- Updated mc to `RELEASE.2024-01-31T08-59-40Z`

## [5.0.11-bb.3] - 2024-01-23
### Changed
- Updated minio to `RELEASE.2024-01-18T22-51-28Z`
- Updated mc to `RELEASE.2024-01-18T07-03-39Z`

## [5.0.11-bb.2] - 2024-01-11
### Changed
- Updated gluon to 0.4.7

## [5.0.11-bb.1] - 2024-01-09
### Changed
- Added istio hardening to tests

## [5.0.11-bb.0] - 2023-12-05
### Changed
- Updated chart to v5.0.11
- Updated gluon to 0.4.4

## [5.0.10-bb.4] - 2023-11-22
### Changed
- Updated minio to `RELEASE.2023-11-20T22-40-07Z`
- Updated mc to `RELEASE.2023-11-20T16-30-59Z`

## [5.0.10-bb.3] - 2023-11-13
### Changed
- Updated minio to `RELEASE.2023-11-06T22-26-08Z`

## [5.0.10-bb.2] - 2023-11-02
### Changed
- Updated minio to `RELEASE.2023-10-16T04-13-43Z`
- Updated mc to `RELEASE.2023-10-30T18-43-32Z`

## [5.0.10-bb.1] - 2022-10-17
### Added
- Added istio `allow-nothing` policy
- Added istio `allow-ingress` polic(y|ies)
- Added istio `allow-tempo` policy
- Added istio custom policy template

## [5.0.10-bb.0] - 2023-10-16
### Changed
- Updated minio to `RELEASE.2023-10-07T15-07-38Z`
- Updated mc to `RELEASE.2023-10-14T01-57-03Z`

## [5.0.9-bb.2] - 2023-09-26
### Changed
- Updated minio to `RELEASE.2023-09-23T03-47-50Z`
- Updated mc to `RELEASE.2023-09-22T05-07-46Z`

## [5.0.9-bb.1] - 2023-09-25
### Changed
- Updated minio to `RELEASE.2023-09-20T22-49-55Z`
- Updated mc to `RELEASE.2023-09-20T15-22-31Z`

## [5.0.9-bb.0] - 2023-09-22
### Changed
- Updated chart to v5.0.9
- Updated minio to `RELEASE.2023-09-16T01-01-47Z`
- Updated mc to `RELEASE.2023-09-13T23-08-58Z`

## [5.0.6-bb.0] - 2023-09-19
### Changed
- Updated chart to v5.0.6
- Updated minio to `RELEASE.2023-09-07T02-05-02Z`
- Updated mc to `RELEASE.2023-09-07T22-48-55Z`
- Updated gluon from 0.4.0 to 0.4.1
- Updated folder structure for cypress 13.X+

## [5.0.5-bb.0] - 2023-06-23
### Changed
- Updated chart to v5.0.5
- Updated minio to `RELEASE.2023-06-19T19-52-50Z`
- Updated mc to `RELEASE.2023-06-19T19-31-19Z`

## [5.0.4-bb.1] - 2023-05-18
### Updated
- Updated chart/values.yaml hostname key to domain
---
## [5.0.4-bb.0] - 2023-05-10
### Changed
- Updated chart to v5.0.4
- Updated minio to `RELEASE.2023-05-04T21-44-30Z`
- Updated mc to `RELEASE.2023-05-04T18-10-16Z`

## [5.0.3-bb.2] - 2023-05-08
### Fix
- Update container security context run as user and group to 1001 to match IronBank image.
- add network policy to egress

## [5.0.3-bb.1] - 2023-04-06 
### Changed
- Updated chart to v5.0.3
- Updated MinIO to `RELEASE.2023-04-28T18-11-17Z` 
- Update mc to `RELEASE.2023-04-12T02-21-51Z`

## [4.5.8-bb.0] - 2022-01-17
### Changed
- Updated images, helm chart, and tenant

## [4.5.4-bb.3] - 2022-01-17
### Changed
- Update gluon to new registry1 location + latest version (0.3.2)

## [4.5.4-bb.2] - 2022-12-05
### Updated
- Update MinIO to `RELEASE.2022-11-26T22-43-32Z`

## [4.5.4-bb.1] - 2022-11-28
### Updated
- Update MinIO to `RELEASE.2022-11-17T23-20-09Z`

## [4.5.4-bb.0] - 2022-11-14
### Updated
- Update MinIO to `RELEASE.2022-11-08T05-27-07Z`
- Update chart to v4.5.4

## [4.5.3-bb.1] - 2022-10-25
### Changed
- Update MinIO default resource requirements

## [4.5.3-bb.0] - 2022-10-20
### Changed
- Update MinIO image to RELEASE.2022-10-15T19-57-03Z
- Update tenant configuration to v4.5.3

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
