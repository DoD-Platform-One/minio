# Metrics

MinIO exports Prometheus compatible data by default as an authorized endpoint at `/minio/v2/metrics/cluster`; users can point Prometheus at this endpoint to scrape operational metrics about their MinIO instance. Capability requires the [Monitoring](https://repo1.dso.mil/platform-one/big-bang/apps/core/monitoring) Big Bang package and can be enabled in this package's `values.yaml` file.

## Additional Information

A list of all metrics reported by MinIO can be seen [here](https://github.com/minio/minio/blob/master/docs/metrics/prometheus/list.md).

For more information about using Prometheus to monitor MinIO, see the [official documentation](https://min.io/docs/minio/linux/operations/monitoring/collect-minio-metrics-using-prometheus.html).
