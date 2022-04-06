-- Tests for anonymization queries
-- SQL TIMESTAMP 2008-11-11 13:23:44

SELECT * FROM zprod_data.task_lock
WHERE tl_timestamp BETWEEN :dateFrom AND :dateTo
AND tl_user_name <> 'anonymous.user';

BEGIN;
UPDATE zprod_data.task_lock t SET tl_user_name = :userName
WHERE tl_timestamp BETWEEN :dateFrom AND :dateTo;
AND tl_user_name <> 'anonymous.user';

ROLLBACK;

select * from zprod_data.task_lock limit 1;