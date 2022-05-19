use sakila;

-- Q-1 List all actors.

SELECT COUNT(actor_ID) FROM actor;

-- Q-2 Find the surname of the actor with the forename 'John'.

SELECT * FROM actor WHERE first_name LIKE '%John';

-- Q-3 Find all actors with surname 'Neeson'.

SELECT * FROM actor WHERE last_name LIKE '%Neeson';

-- Q-4 Find all actors with ID numbers divisible by 10.

SELECT * FROM actor WHERE (actor_id%10)=0;

-- Q-5 What is the description of the movie with an ID of 100?

SELECT `description` FROM film WHERE film_id=100;

-- Q-6 Find every R-rated movie.

SELECT * FROM film WHERE rating= 'r';
SELECT COUNT(RATING) FROM film WHERE rating= 'r';

-- Q-7 Find every non-R-rated movie.

SELECT * FROM film WHERE rating!= 'r';
SELECT COUNT(RATING) FROM film WHERE rating!= 'r';

-- Q-8 Find the ten shortest movies.

SELECT * FROM film ORDER BY length ASC LIMIT 10;

-- Q-9 Find the movies with the longest runtime, without using LIMIT

SELECT * FROM film ORDER BY length DESC;

-- Q-10 Find all movies that have deleted scenes.

SELECT * FROM film WHERE special_features LIKE '%deleted scenes%';

-- Q-11 Using HAVING, reverse-alphabetically list the last names that are not repeated.

SELECT DISTINCT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name)=1 ORDER BY last_name DESC;

-- Q-12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.

SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1 ORDER BY last_name DESC;

-- Q-13 Which actor has appeared in the most films?

SELECT actor_id, COUNT(actor_id) AS actor_count FROM film_actor GROUP BY actor_id ORDER BY actor_count DESC LIMIT 1;

-- Q-14 When is 'Academy Dinosaur' due?

SELECT film.title, rental.rental_date, film.rental_duration FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
WHERE film.title = 'Academy Dinosaur'
AND rental.return_date IS NULL;

-- Q-15 What is the average runtime of all films?

SELECT AVG(length) FROM film;

-- Q-16 List the average runtime for every film category.

SELECT c.name, AVG(f.length)
FROM category AS c
JOIN film_category AS f_c ON f_c.category_id=c.category_id
JOIN film AS f ON f.film_id=f_c.film_id
GROUP BY c.category_id
ORDER BY AVG(f.length) DESC;

-- Q-17 List all movies featuring a robot

SELECT * FROM film WHERE `description` LIKE '%robot%';

-- Q-18 How many movies were released in 2010?

SELECT COUNT(release_year) FROM film WHERE release_year = (2010);

-- Q-19 Find the titles of all the horror movies.

SELECT * FROM film_list;
SELECT title, category FROM film_list WHERE category='Horror';

-- Q-20 List the full name of the staff member with the ID of 2.

SELECT staff_ID, first_name, last_name FROM staff WHERE staff_id= '2';

-- Q-21 List all the movies that Fred Costner has appeared in.

SELECT f.title
FROM film AS f
JOIN film_actor AS f_a ON f_a.film_id=f.film_id
JOIN actor AS a ON a.actor_id=f_a.actor_id
WHERE a.first_name='FRED' AND a.last_name='Costner';

-- Q-22 How many distinct countries are there?

SELECT DISTINCT * FROM country;

SELECT DISTINCT COUNT(*) FROM country;

-- Q-23 List the name of every language in reverse-alphabetical order

SELECT * FROM `language` ORDER BY `name` DESC;  

-- Q-24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son%' ORDER BY first_name ASC;

-- Q-25  Which category contains the most films?

SELECT category_id, COUNT(film_id) AS film_count FROM film_category GROUP BY category_id ORDER BY film_count DESC LIMIT 1;








