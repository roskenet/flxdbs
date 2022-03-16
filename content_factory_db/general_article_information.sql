SELECT * FROM zprod_data.article_simple LIMIT 10;

SELECT * FROM zprod_data.article_simple_size LIMIT 10;


SELECT * from zprod_data.article where a_sku = :SKU;
--301

select * from zprod_data.article_consumer where ac_article_id = (
    SELECT a_id from zprod_data.article where a_sku = :SKU
    );

SELECT * FROM zprod_data.article_media where am_article_consumer_id = (
    select ac_id from zprod_data.article_consumer where ac_article_id = (
        SELECT a_id from zprod_data.article where a_sku = :SKU
    )
);

select * from zprod_data.media where m_id IN (155, 156, 158, 157, 160, 159);

SELECT am_id, am_article_consumer_id,
       am_media_id, am_sort_order,
       am_simple_sku, m_path from zprod_data.article_media,
                                  zprod_data.media
where am_article_consumer_id =109 AND m_id = article_media.am_media_id;