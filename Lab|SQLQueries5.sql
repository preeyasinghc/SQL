## LAB|SQLQueries5:
USE sakila;
##Instructions:
##1.Drop column picture from staff.
SELECT * FROM STAFF;
ALTER TABLE staff
DROP COLUMN picture;
##2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER ORDER BY customer_id desc;
INSERT into CUSTOMER values (600, 1, 'TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 9, 1, '2023-02-24 22:04:36', '2023-02-25 22:04:36');
SELECT * FROM customer where customer_id = 600;

##3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
##You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table 
##rental and see what information you would need to add there. You can query those pieces of information. 
##For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

##select customer_id from sakila.customer
##where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
##Use similar method to get inventory_id, film_id, and staff_id.
SELECT * FROM FILM;
SELECT * FROM RENTAL ORDER BY rental_id DESC;
SELECT * FROM INVENTORY ORDER BY inventory_id desc;
SELECT * FROM FILM WHERE TITLE = 'ACADEMY DINOSAUR';
SELECT * FROM STAFF;
SELECT customer_id from sakila.customer;
SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
##To get the inventory id, first insert the value in inventory table.
INSERT INTO INVENTORY VALUES(4582, 1, 1, '2023-02-25 12:30:01');
##Now use above inventory id to insert values in Rental table
INSERT INTO RENTAL VALUES(16050, '2023-02-23 11:50:23', 4582, 130, '2023-02-28 11:50:23', 1, '2023-02-23 12:59:00');
##4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, 
## and the date for the users that would be deleted. Follow these steps:

##Check if there are any non-active users
SELECT distinct active from customer;
SELECT * FROM CUSTOMER WHERE ACTIVE = 0;
##Create a table backup table as suggested
CREATE TABLE backup_users(customer_id numeric, 
email text,
last_date datetime);
);
## Insert the non active users in the table backup table
INSERT INTO backup_users(customer_id, email, last_date) values
(16, 'SANDRA.MARTIN@sakilacustomer.org', NOW()),
(64, 'JUDITH.COX@sakilacustomer.org', NOW()),
(124, 'SHEILA.WELLS@sakilacustomer.org', NOW()),
(169, 'ERICA.MATTHEWS@sakilacustomer.org', NOW()),
(241, 'HEIDI.LARSON@sakilacustomer.org', NOW()),
(271, 'PENNY.NEAL@sakilacustomer.org', NOW()),
(315, 'KENNETH.GOODEN@sakilacustomer.org', NOW()),
(368, 'HARRY.ARCE@sakilacustomer.org', NOW()),
(406, 'NATHAN.RUNYON@sakilacustomer.org',	NOW()),
(446, 'THEODORE.CULP@sakilacustomer.org',	NOW()),
(482, 'MAURICE.CRAWLEY@sakilacustomer.org', NOW()),
(510, 'BEN.EASTER@sakilacustomer.org', NOW()),
(534, 'CHRISTIAN.JUNG@sakilacustomer.org', NOW()),
(558, 'JIMMIE.EGGLESTON@sakilacustomer.org', NOW()),
(592, 'TERRANCE.ROUSH@sakilacustomer.org', NOW());

SELECT * FROM backup_users;

## Delete the non active users from the table customer
DELETE * FROM customer WHERE active = 0;