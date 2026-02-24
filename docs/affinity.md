# Affinity

* [Kubernetes affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity)

Pod constraints for this package are implemented following the Kubernetes affinity documentation. The MinIO tenant chart supports `nodeSelector` and affinity/anti-affinity at the **pool level**.

> **Note:** These values must be nested under `upstream.tenant.pools[]` as this chart wraps the upstream MinIO tenant Helm chart. Each pool can have its own scheduling constraints.

## nodeSelector

In the `values.yaml`, set `nodeSelector` at the pool level:

```yaml
upstream:
  tenant:
    pools:
      - name: pool-0
        servers: 4
        volumesPerServer: 4
        size: 10Gi
        nodeSelector:
          <key>: <value>
```

## nodeAffinity

In the `values.yaml`, set `nodeAffinity` at the pool level:

```yaml
upstream:
  tenant:
    pools:
      - name: pool-0
        servers: 4
        volumesPerServer: 4
        size: 10Gi
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

In the `values.yaml`, set Pod affinity/anti-affinity at the pool level:

```yaml
upstream:
  tenant:
    pools:
      - name: pool-0
        servers: 4
        volumesPerServer: 4
        size: 10Gi
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

> **Important:** When overriding pool definitions, all required pool values must be included (e.g., `securityContext`, `containerSecurityContext`) as arrays are replaced rather than merged. See `chart/values.yaml` for the complete default pool configuration.
