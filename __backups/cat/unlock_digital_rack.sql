
-- Check status
SELECT aps_id, aps_article_consumer_id, aps_station, aps_station_status, aps_variant, aps_editor_id, aps_version, aps_created, aps_last_modification, aps_is_locked, aps_lock_assignee_id
    FROM zprod_data.article_production_station
    WHERE aps_article_consumer_id in (
      SELECT ac_id
      FROM zprod_data.article_consumer
        WHERE ac_article_id in (
            SELECT a_id FROM zprod_data.article WHERE a_sku in (:SKU)
        )
    );

-- Update
BEGIN;
UPDATE zprod_data.article_production_station
    SET aps_station_status='OPEN' , aps_is_locked=false
    WHERE aps_station_status = 'ACTIVE' and aps_article_consumer_id in (
      SELECT ac_id
      FROM zprod_data.article_consumer
        WHERE ac_article_id in (
            SELECT a_id FROM zprod_data.article WHERE a_sku in (:SKU)
        )
    );
-- COMMIT;
-- ROLLBACK;
