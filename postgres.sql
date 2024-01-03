--| General PostgreSQL maintenance scripts |------------------------------------
SELECT * FROM pg_database;

CREATE ROLE :ROLE WITH LOGIN PASSWORD :PASSWORD;
CREATE DATABASE :DBNAME OWNER :OWNER;

SELECT * FROM pg_roles;

-- DROP DATABASE :DBNAME;

-- | Hello World

SELECT 'Hello World' as hello;
