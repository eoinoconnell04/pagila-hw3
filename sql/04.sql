/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */


SELECT DISTINCT first_name, last_name FROM
actor as a1
join film_actor as fa1 using (actor_id)
join film as f1 using (film_id)
join film_category as fc1 using (film_id)
join category as c1 using (category_id)
where c1.name = 'Children'
AND a1.actor_id NOT IN (SELECT DISTINCT a2.actor_id FROM
actor as a2
join film_actor as fa2 using (actor_id)
join film as f2 using (film_id)
join film_category as fc2 using (film_id)
join category as c2 using (category_id)
where c2.name = 'Horror')
ORDER BY last_name, first_name;
