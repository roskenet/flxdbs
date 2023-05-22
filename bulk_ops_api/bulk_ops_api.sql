SELECT * FROM jobs where user_company IS NULL order by created DESC LIMIT 400;
SELECT * FROM jobs order by created DESC LIMIT 400;

SELECT COUNT(*) from jobs where user_company IS NULL;

BEGIN;
UPDATE jobs SET user_company = 'Zalando Studios Berlin GmbH' WHERE user_company IS NULL;
ROLLBACK;
-- COMMIT;

BEGIN;
DELETE from job_items where created < '2022-03-23';
-- COMMIT;
ROLLBACK;

BEGIN;
DELETE from jobs where created < '2022-03-23';
COMMIT;