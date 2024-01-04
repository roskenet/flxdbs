SELECT 'Hello World!' AS greeting;

CREATE TABLE team (id INTEGER, name TEXT);
CREATE TABLE member (id INTEGER, name TEXT, t_it INTEGER);

insert into team values (1, 'a_team'),
                        (2, 'b_team'),
                        (3, 'c_team');

insert into member values (1, 'a-member', 1),
                          (2, 'b-member', 1),
                          (3, 'c-member', 1),
                          (4, 'aa', 2),
                          (5, 'bbb', 3);

select team.name, member.id, member.name from member, team
where member.t_it = team.id;

CREATE INDEX ON team using HASH(id);
CREATE INDEX ON member using HASH (t_it);

CREATE INDEX on member (t_it);

-- DROP INDEX team_id_idx;
-- DROP INDEX member_t_it_idx;

EXPLAIN ANALYSE
select team.name, count(member.id) from team, member
where t_it = team.id group by team.name;

EXPLAIN
select * from member order by t_it DESC ;

select (random() * 100)::INTEGER % 6 AS zahl, count(1) FROM generate_series(1, 1000) group by zahl order by zahl;
