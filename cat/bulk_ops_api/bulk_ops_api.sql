SELECT * FROM jobs limit 10;

SELECT count(*) from job_items;

BEGIN;
DELETE from job_items where created < '2022-03-23';
-- COMMIT;
ROLLBACK;

BEGIN;
DELETE from jobs where created < '2022-03-23';
COMMIT;