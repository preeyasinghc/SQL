##Lab| Sql Queries 3

USE sakila;
##1.How many distinct (different) actors' last names are there?
SELECT count(DISTINCT (last_name)) FROM actor;

##2.In how many different languages where the films originally produced?
 ##(Use the column language_id from the film table)
SELECT DISTINCT language_id FROM film; 

##3.How many movies were released with "PG-13" rating?
SELECT * FROM film WHERE rating = "PG-13";
SELECT COUNT(rating) FROM film WHERE rating = 'PG-13';

##4.Get 10 the longest movies from 2006.
SELECT * FROM film WHERE release_year >= '2006' and length >= 'max' order by length desc limit 10;

##5.How many days has been the company operating (check DATEDIFF() function)?
SELECT rental_id, DATE_FORMAT(rental_date,"%Y-%m-%d") AS first_rental_date, datediff('2005-05-24',DATE_FORMAT(rental_date,"%Y-%m-%d")) AS days_of_dif
FROM rental
ORDER BY rental_date DESC
LIMIT 1;


##6.show rental info with additional columns month and weekday. Get 20.
select *, 
case when (dayname(rental_date) = "month" or dayname(rental_date) = "sunday") then "weekend" 
Else "workday"
end as rental_date
from rental limit 20;
##7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental 
#day of the week.
SELECT rental_date FROM rental;

SELECT *, 
case when (dayname(rental_date) = "saturday" or dayname(rental_date) = "sunday") then "weekend" 
Else "workday"
END AS day_type
FROM rental;

##How many rentals were in the last month of activity?
SELECT * FROM rental order by rental_date asc;
SELECT LAST_DAY("2006-02-01 09:34:00");
SELECT COUNT(rental_date)
FROM
    rental
WHERE PERIOD_ADD(200602, 28);

SELECT * FROM rental
WHERE rental_date BETWEEN '2006-02-01' AND '2006-02-28';