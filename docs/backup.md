# Backups and Disaster Recovery

### MinIO Data

There are two options for configuring backups of your data stored by MinIO: bucket replication and volume backups.

#### Bucket Replication
Bucket replication has two different modes of operation: server-side and client-side.

- Server-side works by setting up another MinIO instance and configuring the primary MinIO to synchonize objects and updates to the backup instance. This setup requires two different MinIO servers to function correctly.
- Client-side works by having some external process run an `mc mirror` command to synchronize objects between the MinIO server and another S3-compatible endpoint. This setup enables backups to AWS S3 directly or to any other service that supports the S3 API.

Bucket Replication by itself will not automatically back up your MinIO server's configuration data! This data is stored in the backend volume and you should have another way of storing this data externally, perhaps by storing it in git and applying it via IaC.

For more detailed information on the options available for backing up MinIO, see the [official documentation](https://docs.min.io/minio/baremetal/replication/replication-overview.html).

#### Volume Backups
The other option to backup your MinIO data would be to back up the underlying PersistentVolumes that the data is residing on; since this is backing up the data stores directly, this method should capture the server configuration data as well as all the application data. The Big Bang recommended way of doing this is with a tool called Velero:

- [Big Bang Velero package](https://repo1.dso.mil/platform-one/big-bang/apps/cluster-utilities/velero)
- [Official Velero documentation](https://velero.io/docs/v1.6/index.html)
