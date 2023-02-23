
##Lab|Sql queries 2
USE sakila;

# 1.Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor where first_name like 'Scarlett' ;

# 2.Select all the actors with the last name ‘Johansson’
select * from actor where last_name like 'Johansson';

#3. How many films (movies) are available for rent?
SELECT COUNT(DISTINCT(film_id)) from film;
SELECT DISTINCT film_id FROM film;

#4. How many films have been rented?
SELECT count(rental_id) FROM rental where rental_id >= true;
SELECT * FROM rental;

#5. What is the shortest and longest rental period?
SELECT rental_duration FROM film;
SELECT min(rental_duration) FROM film;
SELECT max(rental_duration) FROM film;

#6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) FROM film;
SELECT min(length) FROM film;

SELECT * from film WHERE length >= 'max' AND  'min';

#7. What's the average movie duration?
SELECT AVG( length ) FROM film;

#8. What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG( length ) FROM film where length = 'HH:MI:SS';
SELECT convert(date_add('2023-02-19', interval 115 minute), time);

##CONCAT(FLOOR(minutes/60),'h ', MOD(minutes,60),'m');
	
#9. How many movies longer than 3 hours?
SELECT count(film_id) from film where length >= '180';

#10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT email from customer;

SELECT first_name,last_name,email, concat_ws(' ' ,first_name,last_name,'-',lower(email)) as new_format
FROM customer;

#11. What's the length of the longest film title?
SELECT max(LENGTH(title)) AS Longestfilmtitle FROM film;

