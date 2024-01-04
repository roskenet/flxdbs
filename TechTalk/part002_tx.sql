
--| Be careful in long running transactions:
BEGIN;
SELECT now();
SELECT pg_sleep(10);
SELECT now();
ROLLBACK;
