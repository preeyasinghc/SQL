###LAB| SQLQueries8:
use sakila;

##Instructions
##1.Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title,
## length and rank in your output.
SELECT * FROM film LIMIT 5;


SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null;
## Other way to check if we can directly put like 'WHERE length > 0
SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length > 0;

##2.Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). 
##In your output, only select the columns title, length, rating and rank.
SELECT * FROM FILM LIMIT 5;

SELECT title, length, rating, DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length > 0; 

##3.How many films are there for each of the categories in the category table? 
##Hint: Use appropriate join between the tables "category" and "film_category"
## Solution: Here we are taking category table and film_category table to join the two tables.Using category_id field
## in both tables as the relationship between the two tables.
SELECT C.category_id, C.name, count(*) AS num_of_films
FROM category C
JOIN film_category FC
ON C.category_id = FC.category_id
GROUP BY C.category_id, C.name;

##4.# Which actor (name) has appeared in the most films? Hint: You can create a 
##join between the tables "actor" and "film actor" and count the number of times an actor appears.


## Here we will consider "actor table" and "film_actor table" . Using "actor_id" field
## in both tables as the relationship between the two tables.
SELECT A.actor_id, A.first_name, A.last_name, count(*) AS num_of_films
FROM actor A
JOIN film_actor FA
ON A.actor_id = FA.actor_id
GROUP BY A.actor_id, A.first_name, A.last_name
ORDER BY num_of_films DESC
LIMIT 1;

# #5.Which is the most active customer (the customer that has rented the most number of films)? 
##Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.


## Here we will consider "customer table" and "rental table". Using "customer_id" field
## in both tables as the relationship between the two tables.
SELECT C.customer_id, C.first_name, C.last_name, COUNT(R.rental_id) as num_of_rentals 
FROM customer C
JOIN rental R
ON C.customer_id = R.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
ORDER BY num_of_rentals DESC
LIMIT 1;
