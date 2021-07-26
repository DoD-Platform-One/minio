# Changelog

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
- Added infrastructre and use of new "tenant v2" CRD as handled by the Minio Operator 4.1.2
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
