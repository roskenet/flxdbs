# Staging

```shell
zkubectl login content-creation-test && \
zkubectl tunnel -n default cat-backlog-staging-db-cluster 6543:5432
```