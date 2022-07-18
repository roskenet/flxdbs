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

SELECT * FROM zprod_data.article;

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

SELECT
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename = 'bulk_operation_history';

CREATE INDEX CONCURRENTLY IF NOT EXISTS task_lock_tl_user_name_idx ON zprod_data.task_lock (tl_user_name);
CREATE INDEX CONCURRENTLY IF NOT EXISTS bulk_operation_history_boh_uploading_user_idx ON zprod_data.bulk_operation_history (boh_uploading_user);
CREATE INDEX CONCURRENTLY IF NOT EXISTS translation_status_ts_editor_id_idx ON zprod_data.translation_status (ts_editor_id);

EXPLAIN SELECT * from zprod_data.bulk_operation_history WHERE boh_uploading_user <> 'anonymous.user' AND bulk_operation_history.boh_created < '2022-03-15';