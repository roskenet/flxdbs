# Production Status

# Staging
```shell
zkubectl login content-creation-test && zkubectl tunnel -n default cat-production-status-api-db-cluster 7654:5432
```

# Production:
```shell
zkubectl login content-creation && zkubectl tunnel -n default cat-production-status-api-db-cluster 6543:5432
```
