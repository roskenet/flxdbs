
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