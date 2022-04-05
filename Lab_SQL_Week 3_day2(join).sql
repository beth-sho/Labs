use sakila;
--Which actor has appeared in the most films?
SELECT * from film
SELECT count(*), actor_id, first_name, last_name
FROM actor, 
inner join actor using (actor_id)
order by first_name desc limit 1

--Most active customer (the customer that has rented the most number of films)
select count(*), customer_id, first_name, last_name from customer
inner join rental using(customer_id)
order by first_name desc limit 1;

--List number of films per category
SELECT film_id, name,
FROM category
INNER JOIN film_category USING category_id
GROUP BY category

--display the first and last names, as well as the address, of each staff member
SELECT first_name, last_name, address
FROM staff
inner join address using (address_id)

---Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, SUM(amount)
FROM staff
INNER JOIN payment using (staff_id)
GROUP by payment.staff_id

--List each film and the number of actors who are listed for that film.
SELECT film.title,count(film_actor.actor_id) as 'Number of Actors'
FROM film_actor
INNER JOIN film using (film_id)
GROUP BY film.title

--Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT last_name,first_name, sum(payment.amount) as 'total paid per customer'
FROM customer
INNER JOIN payment using(customer_id)
GROUP BY last_name
ORDER BY last_name

**Optional**: Which is the most rented film?
SELECT title,max(rental_rate)
FROM film

SELECT film


