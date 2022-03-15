-- General Info
SELECT * FROM zprod_data.article_consumer WHERE ac_article_id = (
    SELECT a_id FROM zprod_data.article WHERE a_sku = :SKU
    );
-------------------------------------------------------------------------------


-- Article Production Station for SKU
SELECT * FROM zprod_data.article_production_station,
              zprod_data.article_consumer,
              zprod_data.article
WHERE article_production_station.aps_article_consumer_id = article_consumer.ac_id
AND   article_consumer.ac_article_id = article.a_id
AND   article.a_sku = :SKU;
-------------------------------------------------------------------------------

SELECT * FROM zprod_data.editor;

BEGIN;
DELETE FROM zprod_data.article_production_station
WHERE aps_id = 195946;
-- COMMIT;

BEGIN;
DELETE FROM zprod_data.article_config
WHERE ac_config_sku = :SKU;
-- COMMIT;
ROLLBACK;