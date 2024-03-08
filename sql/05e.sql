/* 
 * You've decided that you don't actually like ACADEMY DINOSAUR and AGENT TRUMAN,
 * and want to focus on more movies that are similar to AMERICAN CIRCUS.
 * This time, however, you don't want to focus only on movies with similar actors.
 * You want to consider instead movies that have similar categories.
 *
 * Write a SQL query that lists all of the movies that share 2 categories with AMERICAN CIRCUS.
 * Order the results alphabetically.
 *
 * NOTE:
 * Recall that the following query lists the categories for the movie AMERICAN CIRCUS:
 * ```
 * SELECT name
 * FROM category
 * JOIN film_category USING (category_id)
 * JOIN film USING (film_id)
 * WHERE title = 'AMERICAN CIRCUS';
 * ```
 * This problem should be solved by a self join on the "film_category" table.
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
order by title;

