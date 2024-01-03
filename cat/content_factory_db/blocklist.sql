---| BLOCKLIST INFO: |---------------------------------------------------------
SELECT * FROM zprod_data.blacklist WHERE b_word = :WORD ORDER BY b_language_code;
SELECT * FROM zprod_data.blacklist WHERE b_word = :WORD || '_blocked';
SELECT * FROM zprod_data.blacklist WHERE b_word ILIKE :WORD;

---| UNBLOCK: |----------------------------------------------------------------
BEGIN;
UPDATE zprod_data.blacklist SET b_word = :WORD || '_blocked' WHERE b_word = :WORD;
-- COMMIT;
ROLLBACK;

---| BLOCK AGAIN: |------------------------------------------------------------
BEGIN;
UPDATE zprod_data.blacklist SET b_word = :WORD WHERE b_word = :WORD || '_blocked';
-- COMMIT;
ROLLBACK;

---| ADD TO LIST: |------------------------------------------------------------
BEGIN;
INSERT INTO zprod_data.blacklist (b_word, b_consumer_id, b_language_code)
SELECT 'coni', '1', l_code FROM zprod_data.language;
INSERT INTO zprod_data.blacklist (b_word, b_consumer_id, b_language_code)
SELECT 'coni', '2', l_code FROM zprod_data.language;
DELETE FROM zprod_data.blacklist WHERE b_word = 'coni' AND b_language_code = 'BE';
-- commit;
ROLLBACK;

SELECT * FROM zprod_data.language;
