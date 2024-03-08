/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH bacall1 AS (
    SELECT DISTINCT a2.actor_id
    FROM actor AS a1
    JOIN film_actor AS fa1 ON a1.actor_id = fa1.actor_id
    JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id
    JOIN actor AS a2 ON fa2.actor_id = a2.actor_id
    WHERE (a1.first_name || ' ' || a1.last_name = 'RUSSELL BACALL')
)

SELECT DISTINCT a3.first_name || ' ' || a3.last_name AS "Actor Name"
FROM actor AS a1
JOIN film_actor AS fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id
JOIN actor AS a2 ON fa2.actor_id = a2.actor_id
JOIN film_actor AS fa3 ON a2.actor_id = fa3.actor_id
JOIN actor AS a3 ON fa3.actor_id = a3.actor_id
WHERE a3.actor_id NOT IN (SELECT actor_id FROM bacall1)
      AND a1.actor_id <> a3.actor_id  -- Exclude the starting actor 'RUSSELL BACALL'
ORDER BY "Actor Name";
