--| zkubectl login content-creation && zkubectl tunnel -n default cat-inbound-api-db-cluster 6543:5432
--| zkubectl login content-creation-test && zkubectl tunnel -n default cat-inbound-api-db-cluster 6543:5432

SELECT sku, format, production_location, location, floor
  FROM ordered_article
  WHERE location IS NOT NULL
  AND location != production_location
  ORDER BY id DESC
  LIMIT 100;

SELECT * FROM inbounded_article;

SELECT * FROM ordered_article;

DELETE FROM inbounded_article;
DELETE FROM ordered_article;

DROP SCHEMA froske CASCADE ;