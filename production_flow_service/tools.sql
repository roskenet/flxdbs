BEGIN;
EXPLAIN SELECT
    MIN(created_at)
FROM production_flow_instance_step_history WHERE last_changed_by != 'anonymous.user';
ROLLBACK ;

BEGIN;
EXPLAIN ANALYZE UPDATE production_flow_instance_step_history
    SET last_changed_by = 'anonymous.user'
WHERE last_changed_by IS NOT NULL
  AND last_changed_by != 'anonymous.user'
  AND created_at <= '2022-12-20 12:32:27'
  AND created_at >= '2022-12-19 00:00:00';
ROLLBACK;

SELECT * from production_flow_instance_step_history order by production_flow_instance_step_history.created_at DESC LIMIT 100;

SELECT *
    FROM production_flow_instance_step_history
    WHERE last_changed_by = 'anonymous.user'
    AND created_at > '2022-12-20 14:21:00';

SELECT * FROM production_flow_instance_step_history where created_at > '2023-12-19';
SELECT * FROM production_flow_instance_step_history WHERE last_changed_by = 'anonymous.user' order by created_at DESC;

SELECT pg_cancel_backend(237969);


SELECT pg_cancel_backend(pid) FROM pg_stat_activity WHERE state = 'active' and pid <> pg_backend_pid();
