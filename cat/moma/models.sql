--| Get model ID |--
SELECT *
  FROM model
 WHERE last_name ILIKE :LAST_NAME;

--| Get SKUs with this model |--
--  This get's executed in production_db
SELECT ac_config_sku
  FROM zprod_data.article_config
 WHERE ac_current_model_id = :MODEL_ID;
