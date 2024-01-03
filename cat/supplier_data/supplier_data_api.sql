-- Check for illegal Control Characters in payloads

SELECT * FROM sustainability_attributes where sku = :SKU;
SELECT * FROM material_compositions where sku = :SKU;
SELECT * FROM supplier_attributes where sku = :SKU;

