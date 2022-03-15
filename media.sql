SELECT m_id, a_sku, m_garfield_media_id FROM zprod_data.media
JOIN zprod_data.article_media ON am_media_id = m_id
JOIN zprod_data.article_consumer ON am_article_consumer_id = ac_id
JOIN zprod_data.consumer ON c_id = ac_consumer_id
JOIN zprod_data.article ON a_id = ac_article_id
WHERE a_sku = 'C1821N05T-K11';


