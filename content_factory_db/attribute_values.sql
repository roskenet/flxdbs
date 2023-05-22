
--| SHOW ATTRIBUTE VALUES |----------------------------------------------------
SELECT * from zprod_data.article_attribute_value where aav_article_id =
    (SELECT a_id from zprod_data.article where a_sku = :SKU);


--| SHOW ATTRIBUTE VALUES |----------------------------------------------------
SELECT * from zprod_data.article_attribute_value where aav_article_id =
    (SELECT a_id from zprod_data.article where a_sku = :SKU)
    and aav_attribute_code = 'upper_material';

-- catabase:

SELECT * FROM material_compositions WHERE sku LIKE 'PO284A00T-Q11'