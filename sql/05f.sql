/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
SELECT title
FROM (
        SELECT f2.title, count(f2.title)
        from film as f1
        join film_category as fc1 on (f1.film_id = fc1.film_id)
        join film_category as fc2 on (fc1.category_id = fc2.category_id)
        join film as f2 on (fc2.film_id = f2.film_id)
        where f1.title = 'AMERICAN CIRCUS'
        group by f2.title) as films
where count > 1
-- above returns all movies that share 2 categories (from part 05e)
INTERSECT
SELECT f2.title
FROM film f1
JOIN film_actor fal ON (f1.film_id = fal.film_id)
JOIN actor ON (fal.actor_id = actor.actor_id)
JOIN film_actor fa2 ON (actor.actor_id = fa2.actor_id)
JOIN film f2 ON (f2.film_id = fa2.film_id)
WHERE f1.title = 'AMERICAN CIRCUS'
ORDER BY title;
-- returns all movies that share at least 1 actor (from part 05)
