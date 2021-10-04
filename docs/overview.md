# MinIO

## Overview

MinIO is an object storage application that is fully compatible with the S3 API. Deploying MinIO enables portability for apps that need S3 as a backend so they can run outside of an AWS environment.

The application works by running MinIO Server as a Pod using PersistentVolumes as the backend storage for the objects it is managing.

Please review the BigBang [Architecture Document](https://repo1.dso.mil/platform-one/big-bang/bigbang/-/blob/master/charter/packages/minio/Architecture.md) for more information about its role within BigBang.

## Dependencies

This chart depends on the [minio-operator](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio-operator/-/tree/main/) Big Bang package.

## How it works

This chart works by deploying an instance of MinIO using the MinIOInstance CRD which is created by the MinIO operator. To deploy MinIO, `minioOperator` and `minio` must both be enabled through the addons functionality in the Big Bang [values.yaml](https://repo1.dso.mil/platform-one/big-bang/bigbang/-/blob/master/chart/values.yaml). This will create the MinIO operator in the `minio-operator` namespace and an instance of MinIO in the `minio` namespace.

## External Resources

If you'd like to learn more about the MinIO application and its features, see their [official documentation](https://min.io/).
