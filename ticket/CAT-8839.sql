SELECT * FROM zprod_data.garfield_media_import_history limit 100;

SELECT * FROM zprod_data.article_media;
SELECT * FROM zprod_data.article_consumer WHERE ac_id=92;
SELECT * FROM zprod_data.article WHERE a_id=256;

SELECT * FROM zprod_data.media WHERE m_vacuum_flag IS NULL;

SELECT * FROM zprod_data.article_media LIMIT 10;
SELECT * FROM zprod_data.media order by m_last_modified ASC LIMIT 10;

SELECT * FROM zprod_data.media WHERE m_id IN (20523, 19833, 19834, 19738, 19739, 19740, 19741, 18698);

SELECT * FROM zprod_data.media WHERE m_vacuum_flag IS NOT NULL ;

SELECT count(*) from zprod_data.media WHERE m_vacuum_flag IS NOT NULL ;
BEGIN;
UPDATE zprod_data.media SET m_last_modified = '2018-08-22T00:15:42Z' WHERE m_vacuum_flag IS NOT NULL;
UPDATE zprod_data.media SET m_vacuum_flag = null WHERE m_vacuum_flag IS NOT NULL ;
COMMIT ;

-- RIA12F02L-C11

select * from zprod_data.garfield_media_import_history
where gmih_garfield_media_id in (
	SELECT m_garfield_media_id FROM zprod_data.media
	JOIN zprod_data.article_media ON am_media_id = m_id
	JOIN zprod_data.article_consumer ON am_article_consumer_id = ac_id
	JOIN zprod_data.consumer ON c_id = ac_consumer_id
	JOIN zprod_data.article ON a_id = ac_article_id
	WHERE a_sku = :SKU);

SELECT * FROM zprod_data.media WHERE m_id IN (SELECT m_id FROM zprod_data.media
JOIN zprod_data.article_media ON am_media_id = m_id
JOIN zprod_data.article_consumer ON am_article_consumer_id = ac_id
JOIN zprod_data.consumer ON c_id = ac_consumer_id
JOIN zprod_data.article ON a_id = ac_article_id
WHERE a_sku = :SKU)

SELECT * from zprod_data.article_media where am_media_id=11;


-- CAT-8782 : Remove garfield import history:

select * from zprod_data.garfield_media_import_history where gmih_garfield_media_id IN (
select m_garfield_media_id from zprod_data.media where m_id IN (
   SELECT am_media_id FROM zprod_data.article_media where am_article_consumer_id = (
    select ac_id from zprod_data.article_consumer where ac_article_id = (
        SELECT a_id from zprod_data.article where a_sku = :SKU
 )
)
)
);

select * from zprod_data.media where m_id IN (
   SELECT am_media_id FROM zprod_data.article_media where am_article_consumer_id = (
    select ac_id from zprod_data.article_consumer where ac_article_id = (
        SELECT a_id from zprod_data.article where a_sku = :SKU
    )
  )
);

BEGIN;
delete from zprod_data.garfield_media_import_history where gmih_garfield_media_id IN (
    select m_garfield_media_id from zprod_data.media where m_id IN (
        SELECT am_media_id FROM zprod_data.article_media where am_article_consumer_id = (
            select ac_id from zprod_data.article_consumer where ac_article_id = (
                SELECT a_id from zprod_data.article where a_sku = :SKU
            )
        )
    )
);

DELETE from zprod_data.media where m_id IN (
    SELECT am_media_id FROM zprod_data.article_media where am_article_consumer_id = (
        select ac_id from zprod_data.article_consumer where ac_article_id = (
            SELECT a_id from zprod_data.article where a_sku = :SKU
        )
    )
);
-- COMMIT


-- Count rows (do they decrease?

select COUNT(*) from zprod_data.garfield_media_import_history;

SELECT COUNT(*) from zprod_data.media;