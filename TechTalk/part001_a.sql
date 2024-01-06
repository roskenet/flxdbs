--| The Power of Indexes:

DROP TABLE IF EXISTS t_test;
CREATE TABLE t_test (id SERIAL, name TEXT, active BOOLEAN DEFAULT true);

INSERT INTO t_test (name, active) SELECT 'Charles', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'Camilla', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'Harry', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'William', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'Meghan', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'Kate', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'George', false
   FROM generate_series(1, 2000000);
INSERT INTO t_test (name, active) SELECT 'Charlotte', false
   FROM generate_series(1, 2000000);

INSERT INTO t_test (name) VALUES
    ('Antonio'),
    ('Lucas'),
    ('Abd'),
    ('Peter'),
    ('Ivan'),
    ('Michal'),
    ('Rebecca'),
    ('Taras');


--| My way:
BEGIN;
UPDATE t_test SET name = 'Louis' WHERE id%3=0 AND active = false;
ROLLBACK;
-- COMMIT;

SELECT * from t_test LIMIT 10;

SELECT count(*) FROM t_test;

--| Just in Time expression compiler (since PostgreSQL 11)
SET JIT=OFF;

EXPLAIN ANALYSE
SELECT name FROM t_test WHERE id=3;

EXPLAIN ANALYZE
SELECT name FROM t_test WHERE active = true ORDER BY id LIMIT 10;

--| First try:
CREATE INDEX ON t_test(id);

--| Second try:
CREATE INDEX ON t_test(active);

--| Generally on 'active':
CREATE INDEX ON t_test(id, active);

--| Selectivity of an Index:
CREATE INDEX ON t_test(active) WHERE active = true;
