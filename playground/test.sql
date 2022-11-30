select * from test;

ALTER TABLE test ALTER COLUMN id TYPE bigint;

SELECT pg_typeof(id) from test limit 1;
