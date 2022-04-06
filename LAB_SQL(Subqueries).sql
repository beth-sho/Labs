use sakila;
-- 1. How many copies of the film _Hunchback Impossible_ exist in the inventory system?
SELECT title, count(inventory_id)
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
WHERE title='Hunchback Impossible';
 

-- 2. List all films whose length is longer than the average of all the films.
SELECT avg(length) from film
SELECT film.title from film where film.length > (SELECT avg(length) from film)

-- 3. Use subqueries to display all actors who appear in the film _Alone Trip_.
SELECT first_name, last_name
FROM actor where actor_id in (SELECT actor_id 
FROM film LEFT JOIN film_actor ON (film.film_id=film_actor.film_id)
WHERE film.title='Alone Trip')

-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title from film
SELECT film_id from film_category 
LEFT JOIN category_id using film_category on category.category_id where category.name="Family"


-- OR
SELECT title
FROM film
LEFT JOIN film_category ON (film.film_id=film_category.film_id)
LEFT JOIN category ON (film_category.category_id=category.category_id)
WHERE category.name='Family';

-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
-- a. Using Subqueries
SELECT first_name, last_name, email
FROM customer where customer_id in(SELECT country_id,customer_id from country where country="Canada")


-- b. Using JOIN
SELECT first_name, last_name, email, country
FROM country c 
LEFT JOIN customer cu 
ON c.country_id=cu.customer_id 
WHERE country="Canada"

---OPTIONAL
-- 6.Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT title from film where film_id in 
(select film_id from film_actor
where actor_id =
(select actor_id from film_actor
INNER JOIN actor USING(actor_id)
GROUP BY actor_id
ORDER BY count(*) desc limit 1))


 