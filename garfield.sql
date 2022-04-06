SET ROLE TO ADMIN; SELECT set_user('garfield');

select * from pg_user;

-- SET ROLE TO ADMIN; SELECT user_management.create_user('quberger');

BEGIN;
UPDATE media SET is_deleted = false
WHERE id IN (
    SELECT media_id FROM media_property WHERE value = :SKU
    );
ROLLBACK;
-- COMMIT;