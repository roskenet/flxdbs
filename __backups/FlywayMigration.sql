create table if not exists public.flyway_schema_history
(
    installed_rank integer                 not null
        constraint flyway_schema_history_pk
            primary key,
    version        varchar(50),
    description    varchar(200)            not null,
    type           varchar(20)             not null,
    script         varchar(1000)           not null,
    checksum       integer,
    installed_by   varchar(100)            not null,
    installed_on   timestamp default now() not null,
    execution_time integer                 not null,
    success        boolean                 not null
);

-- alter table public.flyway_schema_history
--     owner to postgres;

create index if not exists flyway_schema_history_s_idx
    on public.flyway_schema_history (success);

BEGIN;
INSERT INTO public.flyway_schema_history
(installed_rank, version, description, type, script, checksum, installed_by, execution_time, success)
SELECT installed_rank, version, description, type, script, checksum, installed_by, execution_time, success
FROM schema_version;
ROLLBACK ;
-- COMMIT;