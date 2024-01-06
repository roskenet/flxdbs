--| Sizes:

SELECT
  table_name,
  pg_size_pretty(pg_total_relation_size(quote_ident(table_name))),
  pg_relation_size(quote_ident(table_name))
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY 3 DESC;

SELECT
   relname  AS table_name,
   pg_size_pretty(pg_total_relation_size(relid)) AS total_size,
   pg_size_pretty(pg_indexes_size(relid)) AS index_size,
   pg_size_pretty(pg_relation_size(relid)) AS heap_size
   FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;

SELECT indexrelname AS index_name,
       pg_size_pretty(pg_relation_size(quote_ident(indexrelname))) as size
FROM pg_catalog.pg_stat_user_indexes ORDER BY pg_relation_size(quote_ident(indexrelname)) DESC;
