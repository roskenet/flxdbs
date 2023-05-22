--
-- https://en.zalando.de/adidas-originals-adi2000-unisex-trainers-cream-whitedark-greencollegiate-gold-ad115o1fd-a11.html

-- AD115O1FD-A11
SELECT * from zprod_data.article where a_sku = 'AD115O1FD-A11';
-- a_id : 67002591
SELECT count(*) from zprod_data.article_attribute_value where aav_article_id = 67002591;
SELECT * from zprod_data.article_attribute_value where aav_article_id = 67002591;

-- This executes too long
-- SELECT count(*) from zprod_data.article_attribute_value;

SELECT * from zprod_data.article_attribute_value order by aav_id limit 1;
-- 04:18 -2147663703
-- 04:19 -2147671336
-- 18:30 -2152399245

-- This means: 7633 in about 90 seconds

SELECT * from zprod_data.article order by a_id desc limit 2000;
-- 69860613
SELECT * from zprod_data.article_attribute_value where aav_article_id = 69860806;
SELECT * from zprod_data.article LIMIT 100;