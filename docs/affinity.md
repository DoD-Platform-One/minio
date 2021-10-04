# Affinity

* [Kubernetes affinity ](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

Pod constraints for this package is implemented following the Kubernetes affinity documentation. The MinIO operator can constrain a MinIO Pod using `nodeSelector` or the affinity/anti-affinity feature.

## nodeSelector 
In the `values.yaml`, set `nodeSelector` as such:
```
 nodeSelector:
    <key>: <values> 
```

## nodeAffinity
In the `values.yaml`, set `nodeAffinity` as such:

```
affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/e2e-az-name
            operator: In
            values:
            - e2e-az1
            - e2e-az2
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: another-node-label-key
            operator: In
            values:
            - another-node-label-value
```
## podAffinity
In the `values.yaml`, set Pod affinity/antiaffinity as such:

```
affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: security
            operator: In
            values:
            - S1
        topologyKey: topology.kubernetes.io/zone
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: security
              operator: In
              values:
              - S2
          topologyKey: topology.kubernetes.io/zone
```
