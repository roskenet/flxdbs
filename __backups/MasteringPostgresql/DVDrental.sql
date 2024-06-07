--| Do some selects
SELECT * FROM customer;

--| Join for a customer
EXPLAIN ANALYSE
SELECT first_name, last_name, public.city.city, country.country
FROM customer, address, city, country
WHERE customer.address_id=address.address_id
AND city.country_id = country.country_id
AND address.city_id = city.city_id
AND last_name = :LAST_NAME;