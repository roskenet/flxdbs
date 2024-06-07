REINDEX DATABASE CONCURRENTLY article_production_backlog_db;

SELECT c.config_sku AS configSku, MAX(ssi.stowed_at) AS stowedAt, MIN(lt.lt_min) AS ltMin, MIN(dd.estimated_delivery_date) AS estimatedDeliveryDate
FROM article_config c
    LEFT JOIN article_simple s ON c.config_sku=s.config_sku
    LEFT JOIN article_simple_stow_item ssi ON s.simple_sku = ssi.simple_sku
    LEFT JOIN article_config_lt_min lt ON c.config_sku = lt.config_sku
    LEFT JOIN article_estimated_delivery_date dd ON c.config_sku = dd.config_sku
    WHERE c.config_sku IN ('NI112O0GN-G11')
    GROUP BY c.config_sku limit 100;


SELECT * from garfield_db.pg_catalog.pg_statistic();

select * from article_config limit 1;


SELECT
    activity.pid,
    activity.usename,
    activity.query,
    blocking.pid AS blocking_id,
    blocking.query AS blocking_query
FROM
    pg_stat_activity AS activity
JOIN pg_stat_activity AS blocking
ON
    blocking.pid = ANY(pg_blocking_pids(activity.pid));