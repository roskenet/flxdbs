-- Reset nakadi queue

select * from article_production_statuses limit 5;
SELECT * from production_status_enrichment_events limit 5;


select * from cat_queue.messages limit 5;

select * from cat_queue.messages where visible_after > '2023-01-01';

select * from cat_queue.messages limit 10;

select * from cat_queue.messages where visible_after > '2022-04-05';