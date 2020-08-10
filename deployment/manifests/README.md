# NOTES
This is unmodified manifest code version 2.0.9 from  
https://github.com/minio/operator/tree/2.0.9
Any needed changes are made in kustomize overlays.

This is an older version but it must match the latest IronBank hardened image version as close as possible.

Minio is working with IronBank hardened images.

## Important deployment note
The MinIO documentation does not clearly tell you that for distributed mode, the number of volumes per server must match the total number of servers.  If you have 3 servers there must be 3 volumes per server. 

## Quick Minio test
https://docs.min.io/docs/minio-client-quickstart-guide  
These instructions are for Linux but the link also has instructions for Mac.

as root install minio client
```
cd /usr/local/bin/
wget https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
./mc --help
```
as regular user port-forward the headless minio service from the cluster
```
kubectl port-forward svc/minio-hl-svc 9000:9000 -n minio
```
as regular user
```
 mc alias set minio http://127.0.0.1:9000 minio minio123
 mc ls minio
 mc mb minio/mybucket
 mc ls minio
```
