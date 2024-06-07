--| How to dump and restore a db:

pg_dump -h localhost -U froske -d production_status_db -p 6543 -a > production_status.db
psql -h localhost -p 6543 -d production_status_db -U production_status_user -f production_status.db

--| General PostgreSQL maintenance scripts |------------------------------------
SELECT * FROM pg_database;

CREATE ROLE :ROLE WITH LOGIN PASSWORD :PASSWORD;
CREATE DATABASE :DBNAME OWNER :OWNER;

SELECT * FROM pg_roles;

SELECT datname, pid, usename, query
FROM pg_stat_activity WHERE STATE !='idle';

SELECT pg_cancel_backend(pid)
SELECT pg_terminate_backend(pid)

-- DROP DATABASE :DBNAME;

-- | Hello World
SELECT 'Hello World' AS hello;

SELECT * FROM pg_stat_database;

CREATE ROLE robot_zmon WITH PASSWORD 'postgres';

CREATE DATABASE outbound;

REINDEX DATABASE CONCURRENTLY <the_database>;