DELETE FROM events;
DELETE FROM articles;

SELECT * FROM articles WHERE sku = 'RIA12F256-A11' AND ql = 'VQKINYSQKK5';

SELECT * FROM events WHERE events.e_article_ql = 'VQKINYSQKK5';