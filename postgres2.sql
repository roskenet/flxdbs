--| PostgreSQL maintenance scripts |-------------------------------------------
--
SELECT * FROM pg_database;

CREATE DATABASE :DBNAME OWNER :OWNER;

select *
from pg_stat_database