-- CAT-7659
-- DROP TABLE zprod_data.campaign_skus;
-- DROP TABLE zprod_data.campaign;

-- SELECT * from zprod_data.campaign;

-- SELECT * from schema_version;

SELECT * from zprod_data.article WHERE a_sku = :SKU;
SELECT * from zprod_data.article_config WHERE ac_config_sku = :SKU;


SELECT * FROM zprod_data.article_attribute_value, zprod_data.article
         WHERE aav_article_id = a_id
         AND a_sku = :SKU;
