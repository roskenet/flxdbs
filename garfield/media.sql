SET ROLE TO ADMIN; SELECT set_user('garfield');

select m.id as media_id, p1.value as sku, p2.value as sort_order, p3.value as consumer,
    f.location as location, t.tag as tag, f.mime_type as mime_type from media m
    join media_property p1 on m.id=p1.media_id
    join media_property p2 on m.id = p2.media_id
    join media_property p3 on m.id = p3.media_id
    join media_file f on m.id = f.media_id
    join media_tag t on m.id=t.media_id
    where is_deleted= TRUE
    and p1.key ='config_sku'
    and p2.key ='sort_order'
    and p1.value in ('P2K14D00S-K11')
    and usage = 'IMAGE_REGULAR'
    group by m.id, p1.value, p2.value, p3.value, f.location, t.tag, f.mime_type;

select * from media where id = 71946631;
select * from media_property where media_id = 71946631;
select * from media_property where key='sku' and value = 'P2K14D00S-K11';
