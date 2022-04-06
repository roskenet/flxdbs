
     select a_id
     from zprod_data.article
     where a_sku = :SKU;

 select ac_id, ac_consumer_id from zprod_data.article_consumer where ac_article_id = (
     select a_id
     from zprod_data.article
     where a_sku = :SKU
 );

select * from zprod_data.article_status where as_article_consumer_id in
    (select ac_id from zprod_data.article_consumer where ac_article_id = (
       select a_id
       from zprod_data.article
       where a_sku = :SKU
));

select * from zprod_data.article_production_station where aps_article_consumer_id in
 (select ac_id from zprod_data.article_consumer where ac_article_id = (
     select a_id
     from zprod_data.article
     where a_sku = :SKU
 ));






SELECT aps_id, aps_article_consumer_id, aps_station, aps_station_status, aps_variant, aps_editor_id, aps_version, aps_created, aps_last_modification, aps_is_locked, aps_lock_assignee_id
    FROM zprod_data.article_production_station
    WHERE aps_article_consumer_id in (
      SELECT ac_id
      FROM zprod_data.article_consumer
        WHERE ac_article_id in (
            SELECT a_id FROM zprod_data.article WHERE a_sku in (:SKU)
        )
    );