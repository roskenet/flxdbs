# content-creation-test
zkubectl login content-creation-test && \
zkubectl tunnel -n default cat-clarifications-api-db-cluster 6543:5432

# content-creation
zkubectl login content-creation && \
zkubectl tunnel -n default cat-clarifications-api-db-cluster 6543:5432

