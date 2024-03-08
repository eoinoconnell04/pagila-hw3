/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */
WITH CategoryFilmRentals AS (
    SELECT
        c.name,
        c.category_id,
        f.film_id,
        f.title AS film_title,
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC, f.title DESC) AS rental_rank
    FROM
        category c
    JOIN
        film_category fc ON c.category_id = fc.category_id
    JOIN
        film f ON fc.film_id = f.film_id
    JOIN
        inventory i ON f.film_id = i.film_id
    JOIN
        rental r ON i.inventory_id = r.inventory_id
    GROUP BY
        c.name, c.category_id, f.film_id, f.title
)

SELECT
    name,
    film_title AS title,
    rental_count AS "total rentals"
FROM
    CategoryFilmRentals
WHERE
    rental_rank <= 5
ORDER BY
    category_id, rental_count DESC, title;
