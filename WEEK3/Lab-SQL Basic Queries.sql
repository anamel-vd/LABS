#Use the sakila database
USE sakila;

#Display all available tables in the Sakila database.
SHOW Tables;

#Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film; 
SELECT * FROM customer;

#Titles of all films from the film table.
SELECT title
FROM film;

#List of languages used in films, with the column aliased as language from the language table.
SELECT language_id
FROM language;

#List of first names of all employees from the staff table.
SELECT first_name
FROM staff
ORDER BY first_name ASC;

#Retrieve unique release years.
SELECT DISTINCT release_year
FROM film;

#Determine the number of stores that the company has.
SELECT SUM(store_id)
FROM store;

#Determine the number of employees that the company has.
SELECT SUM(staff_id)
FROM staff;

#Determine how many films are available for rent and how many have been rented.
SELECT COUNT(DISTINCT inventory_id) AS films_available_for_rent
FROM rental
WHERE return_date IS NULL;

#Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name)
FROM actor;

#Retrieve the 10 longest films.
SELECT DISTINCT(length)
FROM film
ORDER BY length DESC
LIMIT 10;

#Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name
FROM actor
WHERE first_name = 'SCARLETT';

#BONUS Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title
FROM film
WHERE title LIKE '%ARMAGEDDON%'
  AND length > 100;