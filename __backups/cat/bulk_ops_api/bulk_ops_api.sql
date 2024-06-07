EXPLAIN analyse
select jobitem0_.id as id1_2_,
	       jobitem0_.config_sku as config_s2_2_,
	       jobitem0_.created as created3_2_,
	       jobitem0_.ean as ean4_2_,
	       jobitem0_.failure_reason as failure_5_2_,
	       jobitem0_.image_count as image_co6_2_,
	       jobitem0_.job_id as job_id14_2_,
	       jobitem0_.job_item_data as job_item7_2_,
	       jobitem0_.job_status as job_stat8_2_,
	       jobitem0_.last_modification as last_mod9_2_,
	       jobitem0_.lock_id as lock_id10_2_,
	       jobitem0_.payload as payload11_2_,
	       jobitem0_.ql as ql12_2_,
	       jobitem0_.version as version13_2_
	from job_items jobitem0_
	    left outer join jobs job1_ on jobitem0_.job_id=job1_.id where job1_.id=5738;

create index concurrently if not exists job_items_job_id_idx on job_items(job_id);
drop index job_items_job_id_idx;

explain analyse
select jobitems0_.job_id as job_id14_2_0_,
       jobitems0_.id as id1_2_0_,
       jobitems0_.id as id1_2_1_,
       jobitems0_.config_sku as config_s2_2_1_,
       jobitems0_.created as created3_2_1_,
       jobitems0_.ean as ean4_2_1_,
       jobitems0_.failure_reason as failure_5_2_1_,
       jobitems0_.image_count as image_co6_2_1_,
       jobitems0_.job_id as job_id14_2_1_,
       jobitems0_.job_item_data as job_item7_2_1_,
       jobitems0_.job_status as job_stat8_2_1_,
       jobitems0_.last_modification as last_mod9_2_1_,
       jobitems0_.lock_id as lock_id10_2_1_,
       jobitems0_.payload as payload11_2_1_,
       jobitems0_.ql as ql12_2_1_,
       jobitems0_.version as version13_2_1_
from job_items jobitems0_ where jobitems0_.job_id=5603;
