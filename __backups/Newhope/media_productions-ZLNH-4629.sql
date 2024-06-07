--| ZLNH-4629

--| How to dump and restore a db:
-- pg_dump -h localhost -U froske -d media_productions -p 6543 -a > media_productions.db
-- psql -h localhost -p 5432 -d media_productions -U media_productions_user -f media_productions.db

SELECT * FROM productions;
SELECT * FROM campaign_sales_channels;
SELECT * FROM retail_events;