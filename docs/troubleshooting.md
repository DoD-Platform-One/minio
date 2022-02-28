# Troubleshooting

## General

MinIO consists of a configurable number of Pods in the `minio` namespace. The Pods have unique labels and can be targeted for troubleshooting commands directly through them as such:

### Check Pod status

`kubectl get pod -l app.kubernetes.io/instance=minio-minio -n minio`

`kubectl describe pod -l app.kubernetes.io/instance=minio-minio -n minio`

### Get Pod logs

`kubectl logs -l app.kubernetes.io/instance=minio-minio -n minio`
