SELECT * from actor;

EXPLAIN ANALYSE
SELECT * from customer, address where customer.address_id = address.address_id and store_id = 1;

select * from film limit 10;
