# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [7.1.1-bb.12] - 2025-10-16

### Updated

- Updated gluon from 0.9.3 -> 0.9.5
- Change Kubectl to not use patch version v1.33.5 -> v1.33

## [7.1.1-bb.11] - 2025-10-07

### Updated

- Updated gluon from 0.9.2 -> 0.9.3

## [7.1.1-bb.10] - 2025-09-30

### Changed

- Updated gluon from 0.9.0 -> 0.9.2
- Updated registry1.dso.mil/ironbank/opensource/minio/operator-sidecar (source) v7.0.1 -> v7.1.0

## [7.1.1-bb.9] - 2025-09-18

### Changed

- Reconfigured package for passthrough pattern
- Fixed older image being pulled in with passthrough values
- Removed duplicate upstream helpers
- Updated registry1.dso.mil/ironbank/opensource/minio/mc (source) RELEASE.2025-04-16T18-13-26Z -> RELEASE.2025-08-13T08-35-41Z
- Updated registry1.dso.mil/ironbank/opensource/kubernetes/kubectl 1.30.11 -> 1.33.5
- Updated gluon from 0.7.0 -> 0.9.0

## [7.1.1-bb.8] - 2025-08-15

### Updated

- update the test-write.sh script to fail fast and a few other re-factorings

## [7.1.1-bb.7] - 2025-07-31

### Updated

- ironbank/opensource/minio/minio (source) RELEASE.2025-07-18T21-56-31Z -> RELEASE.2025-07-23T15-54-02Z

## [7.1.1-bb.6] - 2025-07-23

### Updated

- Updated registry1.dso.mil/ironbank/opensource/minio/minio (source) RELEASE.2025-06-13T11-33-47Z -> RELEASE.2025-07-18T21-56-31Z
- Updated gluon from 0.6.3 -> 0.7.0
- Cypress console login test removed due to Admin UI fully removed

## [7.1.1-bb.5] - 2025-07-08

### Updated

- Updated gluon from 0.6.2 -> 0.6.3

## [7.1.1-bb.4] - 2025-06-25

### Changed

- ironbank/opensource/minio/minio (source) RELEASE.2025-05-24T17-08-30Z -> RELEASE.2025-06-13T11-33-47Z
- Updated registry1.dso.mil/ironbank/opensource/minio/minio (source) RELEASE.2025-05-24T17-08-30Z -> RELEASE.2025-06-13T11-33-47Z

## [7.1.1-bb.3] - 2025-06-12

### Changed

- Updated ironbank/opensource/minio/minio (source) RELEASE.2025-04-22T22-12-26Z -> RELEASE.2025-05-24T17-08-30Z
- Updated registry1.dso.mil/ironbank/opensource/minio/minio (source) RELEASE.2025-04-22T22-12-26Z -> RELEASE.2025-05-24T17-08-30Z

## [7.1.1-bb.2] - 2025-06-11

### Changed

- Updated gluon from 0.5.21 -> 0.6.2

## [7.1.1-bb.1] - 2025-05-23

### Changed

- Updated gluon from 0.5.17 -> 0.5.21

## [7.1.1-bb.0] - 2025-05-09

### Changed

- Updated minio-instance to 7.1.1
- Updated gluon from 0.5.16 -> 0.5.17
- Updated ironbank/opensource/minio/minio (source) RELEASE.2025-04-03T14-56-28Z -> RELEASE.2025-04-22T22-12-26Z
- Updated registry1.dso.mil/ironbank/opensource/minio/mc (source) RELEASE.2025-01-17T23-25-50Z -> RELEASE.2025-04-16T18-13-26Z
- Updated registry1.dso.mil/ironbank/opensource/minio/minio (source) RELEASE.2025-04-03T14-56-28Z -> RELEASE.2025-04-22T22-12-26Z

## [7.0.1-bb.1] - 2025-04-29

### Changed

- Updated gluon from 0.5.15 -> 0.5.16

## [7.0.1-bb.0] - 2025-04-21

### Changed

- Updated ironbank/opensource/minio/minio (source) RELEASE.2025-01-20T14-49-07Z -> RELEASE.2025-04-03T14-56-28Z
- Updated minio-instance to 7.0.1
- Updated operator-sidecar to v7.0.1

## [7.0.0-bb.7] - 2025-04-04

### Changed

- Updated cypress minio test login

## [7.0.0-bb.6] - 2025-04-01

### Changed

- Updated gluon from 0.5.14 -> 0.5.15

## [7.0.0-bb.5] - 2025-03-28

### Changed

- Added dynamic network policy support for istio

## [7.0.0-bb.4] - 2025-03-28

### Changed

- Updated registry1.dso.mil/ironbank/opensource/kubernetes/kubectl 1.29.6 -> 1.30.11

## [7.0.0-bb.3] - 2025-03-17

### Changed

- remove pools.securityContext.capabilites is not supported and cause error when enabling drift detection

## [7.0.0-bb.2] - 2025-02-07

### Changed

- Add filler value to test-wait-job

## [7.0.0-bb.1] - 2025-02-05

### Changed

- Added correct matchLabel in peerauthentication

## [7.0.0-bb.0] - 2025-01-28

### Changed

- Updated minio-instance to  v7.0.0
- Updated ironbank/opensource/minio/minio (source) RELEASE.2024-12-13T22-19-12Z -> RELEASE.2025-01-20T14-49-07Z
- Updated registry1.dso.mil/ironbank/opensource/minio/mc (source) RELEASE.2024-11-21T17-21-54Z -> RELEASE.2025-01-17T23-25-50Z
- Updated registry1.dso.mil/ironbank/opensource/minio/minio (source) RELEASE.2024-12-13T22-19-12Z -> RELEASE.2025-01-20T14-49-07Z

## [6.0.4-bb.6] - 2025-01-21

### Changed

- Updated gluon 0.5.12 -> 0.5.14

## [6.0.4-bb.5] - 2024-12-19

### Changed

- Updated registry1.dso.mil/ironbank/opensource/minio/mc RELEASE.2024-11-17T19-35-25Z -> RELEASE.2024-11-21T17-21-54Z
- Updated ironbank/opensource/minio/minio RELEASE.2024-06-04T19-20-08Z -> RELEASE.2024-12-13T22-19-12Z

## [6.0.4-bb.4] - 2024-12-03

### Changed

- registry1.dso.mil/ironbank/opensource/minio/mc RELEASE.2024-10-29T15-34-59Z -> RELEASE.2024-11-17T19-35-25Z
- gluon from 0.5.10 to 0.5.12

## [6.0.4-bb.3] - 2024-12-03

### Changed

- Added app.kubernetes.io/name label to minio.labels helper
- Created new helper for tenants to ensure it also gets the app.kubernetes.io/version label
- Updated tenant deployment to include newly created helper
- Removed previous solution to fix Kiali Labels applied in 6.0.2-bb.3

## [6.0.4-bb.2] - 2024-11-08

### Changed

- Upgraded gluon from 0.5.8 to 0.5.10
- Added the maintenance track annotation and badge

## [6.0.4-bb.1] - 2024-11-04

### Changed

- Patch registry1.dso.mil/ironbank/opensource/minio/mc RELEASE.2024-10-08T09-37-26Z -> RELEASE.2024-10-29T15-34-59Z

## [6.0.4-bb.0] - 2024-10-25

### Changed

- Upgraded minio to v6.0.4

## [6.0.3-bb.8] - 2024-10-22

### Changed

- Upgraded gluon from 0.5.7 to 0.5.8
- Upgraded mc RELEASE.2024-10-02T08-27-28Z -> RELEASE.2024-10-08T09-37-26Z

## [6.0.3-bb.7] - 2024-10-18

### Changed

- Upgraded gluon from 0.5.4 to 0.5.7

## [6.0.3-bb.6] - 2024-10-11

### Changed

- Removed all hardcoded match labels

## [6.0.3-bb.5] - 2024-10-07

### Changed

- Upgraded mc RELEASE.2024-09-16T17-43-14Z -> RELEASE.2024-10-02T08-27-28Z

## [6.0.3-bb.4] - 2024-09-25

### Changed

- Added wait job config


## [6.0.3-bb.3] - 2024-09-23

### Changed

- Upgraded mc to RELEASE.2024-09-16T17-43-14Z

## [6.0.3-bb.2] - 2024-09-17

### Changed

- Fixed a bug in istio authorization policies introduced in 6.0.3-bb.1 that resulted in failing RBAC access denied when istio hardening was enabled

## [6.0.3-bb.1] - 2024-09-12

### Changed

- Upgraded minio to v6.0.3


## [6.0.2-bb.5] - 2024-09-05

### Changed

- Removed hardcoded match labels

## [6.0.2-bb.4] - 2024-08-29

### Changed

- Updated mc to `RELEASE.2024-08-26T10-49-58Z`

## [6.0.3-bb.0] - 2024-08-29

### Changed

- Upgraded to RELEASE.2024-08-26T10-49-58Z

## [6.0.2-bb.3] - 2024-08-26

### Added

- Added `podLabels` input value
- Added usage of `podLabels` in `chart/templates/tenant.yaml`

## [6.0.2-bb.2] - 2024-08-21

### Changed

- Updated to RELEASE.2024-08-17T11-33-50Z

## [6.0.2-bb.1] - 2024-08-14

### Changed

- Revert 5.0.16-bb.1 changes due to issues with app: label

## [6.0.2-bb.0] - 2024-08-13

### Changed

- Updated chart to v6.0.2
- Updated mc to `RELEASE.2024-07-15T17-46-06Z`
- Update gluon to 0.5.3

## [5.0.16-bb.1] - 2024-07-31

### Added

- Added `bigbang.labels` helper function to authservice under `templates/bigbang`
- Added call to `bigbang.labels` function in `pools` template section of `chart/templates/tenant.yaml`

## [5.0.16-bb.0] - 2024-06-27

### Changed

- Updated mc to `RELEASE.2024-07-03T20-17-25Z`
- Updated chart to v5.0.16

## [5.0.15-bb.7] - 2024-07-12

### Changed

- Removed shared authpolicies implemented directly in istio

## [5.0.15-bb.6] - 2024-07-11

### Changed

- Remove redundant entries in package test-values.yaml already in package values.yaml
- Update cypress resources to standard 2 cpu and 4 Gi memory

## [5.0.15-bb.5] - 2024-06-27

### Changed

- Updated mc to `RELEASE.2024-06-24T19-40-33Z`

## [5.0.15-bb.4] - 2024-06-21

### Changed

- Updated mc to `RELEASE.2024-06-12T14-34-03Z`

## [5.0.15-bb.3] - 2024-06-06

### Changed

- Updated minio to `RELEASE.2024-06-04T19-20-08Z`
- Updated mc to `RELEASE.2024-06-01T15-03-35Z`

## [5.0.15-bb.2] - 2024-06-03

### Changed

- Updated minio to `RELEASE.2024-05-28T17-19-04Z`

## [5.0.15-bb.1] - 2024-05-29

### Changed

- Updated minio to `RELEASE.2024-05-27T19-17-46Z`
- Updated registry1.dso.mil/ironbank/opensource/minio/mc  to `RELEASE.2024-05-24T09-08-49Z`

## [5.0.15-bb.0] - 2024-05-17

### Changed

- Updated minio to `RELEASE.2024-05-10T01-41-38Z`
- Updated registry1.dso.mil/ironbank/opensource/minio/mc  to `RELEASE.2024-05-09T17-04-24Z`
- Updated chart to 5.0.15

## [5.0.12-bb.14] - 2024-05-09

### Changed

- Updated minio to `RELEASE.2024-05-07T06-41-25Z`

## [5.0.12-bb.13] - 2024-05-07

### Changed

- Updated gluon to 0.5.0
- Updated minio to `RELEASE.2024-05-01T01-11-10Z`
- Updated mc to `RELEASE.2024-04-29T09-56-05Z`

## [5.0.12-bb.12] - 2024-04-17

### Changed

- Updated grafana dashboards to be compatible with Thanos

## [5.0.12-bb.11] - 2024-04-09

### Added

- Added custom network policies

## [5.0.12-bb.10] - 2024-04-04

### Changed

- Added Authpol to allow ingress from then minio-operator workload
- Added Istio Sidecar to restrict egress traffic to REGISTRY_ONLY
- Added Istio ServiceEntry to explicitly allow egress

## [5.0.12-bb.9] - 2024-04-02

### Changed

- Updated minio to `RELEASE.2024-03-30T09-41-56Z`
- Updated mc to `RELEASE.2024-03-30T15-29-52Z`

## [5.0.12-bb.8] - 2024-03-28

### Changed

- Updated minio to `RELEASE.2024-03-26T22-10-45Z`
- Updated mc to `RELEASE.2024-03-25T16-41-14Z`

## [5.0.12-bb.7] - 2024-03-28

### Changed

- Added capabilities: drop: -ALL

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
