-- SELECT * from zprod_data.article_attribute_value order by aav_id desc LIMIT 10;
--
--
-- Alter table zprod_data.article_attribute_value add column new_id BIGINT;
--
-- CREATE FUNCTION set_new_id() RETURNS TRIGGER AS
-- $BODY$
-- BEGIN
--     NEW.new_id := NEW.id;
--     RETURN NEW;
-- END
-- $BODY$ LANGUAGE PLPGSQL;
-- CREATE TRIGGER set_new_id_trigger BEFORE INSERT OR UPDATE ON zprod_data.article_attribute_value
-- FOR EACH ROW EXECUTE PROCEDURE set_new_id();
--
-- DROP trigger set_new_id_trigger on zprod_data.article_attribute_value;
--
--
-- UPDATE zprod_data.article_attribute_value SET new_id = aav_id WHERE aav_id BETWEEN 1 AND 2147483281;

SELECT * from zprod_data.article where a_id = 69846270;
SELECT * from zprod_data.article where a_sku = :SKU;

SELECT * from zprod_data.article_attribute_value order by aav_id LIMIT 10;
SELECT count(*) from zprod_data.article_attribute_value where aav_article_id = 69846270;
-- 540 rows

SELECT * from zprod_data.article where a_id = 2142700;
SELECT * from zprod_data.article where a_sku = 'AD115O1FD-A11';
-- 1142692
SELECT * from zprod_data.article_attribute_value where aav_article_id = 67002591;
