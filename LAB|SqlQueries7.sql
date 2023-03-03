
##LAB|SqlQueries7:
USE sakila;
##1.In the table actor, which are the actors whose last names are not repeated?For example if you would 
##sort the data in the table actor by last_name, you would see that 
##there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same
## last name. So we do not want to include this last name in our output. Last name "Astaire" is present only 
##one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT * FROM actor;
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;


##2.Which last names appear more than once? We would use the same logic as in the previous question but 
##this time we want to include the last names of the actors where the last name was present more than once.
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name
HAVING COUNT(last_name) != 1;

SELECT
MAX(first_name) AS first_name,
CASE
WHEN COUNT(DISTINCT first_name) = 1
THEN last_name ELSE null
END AS uniqu_lastname
FROM actor
group by last_name
HAVING uniq_lastname IS NOT NULL;

##3.Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM rental;
SELECT staff_id,COUNT(rental_id) FROM rental group by staff_id;

##4.Using the film table, find out how many films were released each year.
SELECT * FROM FILM;
SELECT release_year,count(title)  FROM FILM GROUP BY release_year;

##5.Using the film table, find out for each rating how many films were there.

SELECT rating,COUNT(title) AS FILM FROM film GROUP BY rating;

##6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM FILM;
	SELECT rating, round(avg(length), 2) AS mean	
	FROM FILM	
	GROUP BY rating;	

##7.Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, avg(length) AS mean	
	FROM FILM	
	GROUP BY rating
    HAVING avg(LENGTH) >= 120;
    ##OR having mean >120 as we can use the alias directly. 
    SELECT rating, avg(length) AS mean	
	FROM FILM	
	GROUP BY rating
    HAVING mean > 120;
