-- The SKU
-- ZZO128510-E00

select * from zprod_data.article where a_sku = :SKU;
-- 39084569
select * from zprod_data.article_config where ac_config_sku = :SKU;
-- 11887638

select * from zprod_data.article_consumer where ac_article_id = (
    select a_id from zprod_data.article where a_sku = :SKU
    );
-- 6198871

-- SKU Armageddon
--| Remove all station information:
begin;
delete from zprod_data.article_production_station where aps_article_consumer_id =
 (select ac_id from zprod_data.article_consumer where ac_article_id = (
     select a_id
     from zprod_data.article
     where a_sku = :SKU
 ));
--| Remove the article_consumer:
delete from zprod_data.article_consumer where ac_article_id = (
    select a_id from zprod_data.article where a_sku = :SKU
    );
delete from zprod_data.article where a_sku = :SKU;
delete from zprod_data.article_config where ac_config_sku = :SKU;
rollback;
-- commit;