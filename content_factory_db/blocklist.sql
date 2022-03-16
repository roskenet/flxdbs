---| BLOCKLIST INFO: |---------------------------------------------------------
select * from zprod_data.blacklist where b_word = :WORD ORDER BY b_language_code;
select * from zprod_data.blacklist where b_word = :WORD || '_blocked';

---| UNBLOCK: |----------------------------------------------------------------
begin;
update zprod_data.blacklist set b_word = :WORD || '_blocked' where b_word = :WORD;
-- commit;
rollback;

---| BLOCK AGAIN: |------------------------------------------------------------
begin;
update zprod_data.blacklist set b_word = :WORD where b_word = :WORD || '_blocked';
-- commit;
rollback;

---| ADD TO LIST: |------------------------------------------------------------
begin;
INSERT INTO zprod_data.blacklist (b_word, b_consumer_id, b_language_code)
SELECT 'coni', '1', l_code FROM zprod_data.language;
INSERT INTO zprod_data.blacklist (b_word, b_consumer_id, b_language_code)
SELECT 'coni', '2', l_code FROM zprod_data.language;
DELETE FROM zprod_data.blacklist WHERE b_word = 'coni' AND b_language_code = 'BE';
-- commit;
rollback;

select * from zprod_data.language;
