
use sakila;
##Instructions
##Get film ratings.

SELECT * FROM FILM ORDER BY RATING;
SELECT DISTINCT(RATING) AS ratings FROM FILM;

##Get release years.
SELECT Distinct(release_year) FROM FILM;

##Get all films with ARMAGEDDON in the title.
 SELECT title from film;

 SELECT * FROM film where title like 'ARMAGEDDON%';

##Get all films with APOLLO in the title
SELECT * FROM film where title like 'APOLLO%';

##Get all films which title ends with APOLLO.
SELECT * FROM film where title like '%APOLLO';

##Get all films with word DATE in the title.
SELECT * FROM film where title like '%DATE%';

##Get 10 films with the longest title.
select film_id,title, length(title) as len_title from film
order by length(title) desc limit 10;

 
##Get 10 the longest films.
## This query gives me the 10 longest film in minutes under 'length' column
SELECT length, length(length) AS LongestFilm FROM film order by length(length) desc limit 10;
## Now I am trying to convert it to hours and minutes from total number of minutes
SELECT LENGTH(length),CONCAT(FLOOR(length/60),'h ', MOD(length,60),'m') AS longestFilm FROM FILM order by length(length) desc limit 10;


##How many films include Behind the Scenes content?
SELECT * FROM film;
SELECT * FROM film WHERE special_features like '%Behind the scenes%';
SELECT COUNT(special_features) FROM film WHERE special_features like 'Behind the scenes';

##List films ordered by release year and title in alphabetical order.
SELECT * FROM FILM order by release_year;