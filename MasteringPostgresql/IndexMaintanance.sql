--| Mastering PostgreSQL 15: Chapter 5

--| Inspecting live traffic
select * from dvdrental.pg_catalog.pg_stat_activity;

SELECT pid, query_start, state_change, state, query
FROM   pg_stat_activity;

--| Inspecting databases
select *
from pg_stat_database;

--| Terminate a query
SELECT pg_terminate_backend(:PID);

SELECT * FROM pg_stat_user_tables;
SELECT * FROM pg_statio_user_tables;

--| Helps to find missing indexes:
SELECT schemaname, relname, seq_scan, seq_tup_read,
       seq_tup_read / seq_scan AS avg, idx_scan
FROM pg_stat_user_tables
WHERE seq_scan > 0
ORDER BY seq_tup_read DESC LIMIT 25;

--| Reseting PostgreSQL internal statistics:
-- pg_stat_reset()
-- pg_stat_statements_reset()

BEGIN;
SELECT pg_stat_reset();
ROLLBACK;
