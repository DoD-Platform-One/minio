# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v## [2.0.0.html).

---

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
