USE sakila;

#Lab | SQL Data Aggregation and Transformation

#.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;

#Express the average movie duration in hours and minutes. Don't use decimals.
#Hint: Look for floor and round functions.
SELECT
    CONCAT(
        FLOOR(AVG(length) / 60), 'h ',
        ROUND(AVG(length) % 60), 'm'
    ) AS average_duration
FROM film;

#Calculate the number of days that the company has been operating.
#Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

#Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT
    rental_id,
    rental_date,
    MONTH(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

#retrieve the film titles and their rental duration. 
#If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.

SELECT
    film.title AS film_title,
    IFNULL(rental.return_date - rental.rental_date, 'Not Available') AS rental_duration
FROM film
JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
ORDER BY rental_duration DESC; #desc to reflect the ones Not Available at first

#CHALLENGE 2
#1.1 The total number of films that have been released.
SELECT COUNT(release_year)
FROM film;

# 1.2 The number of films for each rating.
SELECT
    rating,
    COUNT(*) AS film_count
FROM film
GROUP BY rating;

#1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
#This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.

SELECT
    rating,
    COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

#Using the film table, determine:
#2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
#Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
SELECT
    rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

#2.2 Identify which ratings have a mean duration of over two hours in order to help select films 
#for customers who prefer longer movies.

SELECT
    rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120;









