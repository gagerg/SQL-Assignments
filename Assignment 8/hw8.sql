/*Gage Gutmann
Homework 8
11/14/19
Description: This script writes queries based off tables in the cpsc 321 database.
New examples of queries include those using subqueries and outer joins
*/




/*Query 1*/
SELECT a.first_name, a.last_name, COUNT(*) AS num_films
FROM actor a JOIN film_actor f USING (actor_id)
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(*) DESC;

/*Query 2*/
SELECT c.name, COUNT(*) AS num_of_films
FROM category c JOIN film_category f USING (category_id)
GROUP BY c.name
ORDER BY COUNT(*) DESC;

/*Query 3*/
SELECT c.first_name, c.last_name, COUNT(*) AS num_rentals
FROM rental r JOIN payment p ON r.rental_id = p.rental_id
    JOIN inventory i ON i.inventory_id = r.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN customer c ON c.customer_id = r.customer_id
WHERE p.amount = 2.99
    AND f.rating = 'PG'
GROUP BY c.first_name,c.last_name
HAVING COUNT(*) >= 4
ORDER BY COUNT(*) DESC;

/*Query 4*/
SELECT DISTINCT f.title, p.amount
FROM film f JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
    JOIN payment p on r.rental_id = p.rental_id,
    (SELECT MAX(amount) as max_amount FROM payment) AS p2
WHERE p.amount = p2.max_amount 
    AND f.rating = 'G';

/*Query 5*/
SELECT c.name, (COUNT(*)) AS num_pg_rated_films
FROM category c JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
WHERE f.rating = 'PG'
GROUP BY c.name
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                        FROM category c2 JOIN film_category fc2 ON c2.category_id = fc2.category_id
                            JOIN film f2 ON fc2.film_id = f2.film_id
                        WHERE f2.rating = 'PG'
                        GROUP BY c2.name);

/*Query 6-- Use a nested subquery*/

SELECT f.title, COUNT(*) as num_rentals
FROM film f JOIN inventory i ON i.film_id = f.film_id JOIN rental r ON r.inventory_id = i.inventory_id
WHERE f.rating = 'G'
GROUP BY f.title
HAVING COUNT(*) > ALL (SELECT f2.title, (COUNT(*))
    FROM film f2 JOIN inventory i2 ON i2.film_id = f2.film_id JOIN rental r2 ON r2.inventory_id = i2.inventory_id
    WHERE f2.rating = 'G'
    GROUP BY f2.title
    HAVING COUNT (*) = (SELECT AVG(rental_date)
                        FROM rental))
ORDER BY COUNT(*) DESC;


/*Query 7*/

SELECT a.first_name, a.last_name
FROM actor a JOIN film_actor fc USING (actor_id) JOIN film f USING (film_id)
WHERE f.rating != 'G'
AND a.actor_id != ALL(SELECT fc2.actor_id
                        FROM film_actor fc2);




/*Query 8-Rewriting without COUNT*/

SELECT f.title 
FROM film f JOIN inventory i ON f.film_id = i.film_id 
GROUP BY f.title
HAVING COUNT(i.store_id) = (SELECT COUNT(s.store_id)
                            FROM store s);

/*Query 9*/

/*Query 10*/

SELECT f.title
FROM film f JOIN film_actor fa USING (film_id)
    RIGHT OUTER JOIN actor a ON fa.actor_id = a.actor_id
WHERE fa.actor_id != a.actor_id;

/*Query 11*/

SELECT f.title
FROM film f JOIN inventory i USING (film_id) RIGHT OUTER JOIN rental r USING (inventory_id)
WHERE r.rental_date IS NULL;

/*Query 12*/
