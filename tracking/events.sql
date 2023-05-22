-- Search for tracking events

SELECT * FROM events WHERE e_article_ql = :QL ORDER BY id DESC;

