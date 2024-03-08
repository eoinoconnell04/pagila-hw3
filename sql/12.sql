/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

WITH ActionRentals AS (
    SELECT
        r.customer_id,
        COUNT(*) AS action_count
    FROM
        rental r
    JOIN
        inventory i ON r.inventory_id = i.inventory_id
    JOIN
        film_category fc ON i.film_id = fc.film_id
    JOIN
        category c ON fc.category_id = c.category_id
    WHERE
        c.name = 'Action'
    GROUP BY
        r.customer_id
    HAVING
        COUNT(*) >= 4
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customer c
JOIN
    ActionRentals ar ON c.customer_id = ar.customer_id;

