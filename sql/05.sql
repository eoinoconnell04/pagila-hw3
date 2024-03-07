/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */


SELECT f2.title
FROM film f1
JOIN film_actor fal ON (f1.film_id = fal.film_id)
JOIN actor ON (fal.actor_id = actor.actor_id)
JOIN film_actor fa2 ON (actor.actor_id = fa2.actor_id)
JOIN film f2 ON (f2.film_id = fa2.film_id)
WHERE f1.title = 'AMERICAN CIRCUS'
ORDER BY f2.title;
