# Test Cluster
zkubectl login content-creation-test && \
zkubectl tunnel -n default cat-inbound-api-db-cluster 6543:5432

# Production Cluster
zkubectl login content-creation && \
zkubectl tunnel -n default cat-inbound-api-db-cluster 6543:5432
