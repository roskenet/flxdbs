--| The Power:

DROP TABLE IF EXISTS t_test;
CREATE TABLE t_test (id SERIAL, name TEXT, active BOOLEAN DEFAULT true);

INSERT INTO t_test (name) SELECT 'Antonio'
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name) SELECT 'Lucas'
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name) SELECT 'Abd'
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name) SELECT 'Michal'
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name) SELECT 'Ivan'
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name) SELECT 'Rebecca'
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'Pablo', false
   FROM generate_series(1, 2000000);

SELECT count(*) FROM t_test where active = false;

BEGIN;
UPDATE t_test SET name = 'Taras', active = true WHERE id%3=0;
COMMIT;
-- ROLLBACK;

--| Just in Time expression compiler (since PostgreSQL 11)
SET JIT=off;

EXPLAIN ANALYSE
SELECT * FROM t_test WHERE id=100000;

EXPLAIN ANALYZE
SELECT * from t_test LIMIT 10;

EXPLAIN ANALYZE
SELECT * FROM t_test WHERE active = false ORDER BY id LIMIT 10;

--| First try:
CREATE INDEX ON t_test(id);

--| Generally on 'active':
CREATE INDEX ON t_test(id, active);

--| Selectivity of an Index:
CREATE INDEX ON t_test(id, active) WHERE active = false;
