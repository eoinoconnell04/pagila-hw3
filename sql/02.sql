/*
 * Compute the country with the most customers in it. 
 */

SELECT country from (SELECT country.country, count(*) from customer join address using (address_id) join city using (city_id) join country using (country_id) group by country.country order by count desc limit 1) as t;



