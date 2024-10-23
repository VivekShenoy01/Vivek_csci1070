-- ALTER TABLE rental
-- ADD status varchar(255);

-- -- Question #1
-- UPDATE rental R
--  	SET status = CASE
--  		WHEN EXTRACT(DAY FROM r.return_date):: INTEGER < EXTRACT(DAY FROM r.rental_date)::INTEGER + f.rental_duration THEN 'Early'
--  		WHEN EXTRACT(DAY FROM r.return_date):: INTEGER = EXTRACT(DAY FROM r.rental_date):: INTEGER + f.rental_duration THEN 'On Time'
--  		ELSE 'Over Due'
-- 	END
-- from inventory I
-- left join film F
-- on i.film_id = f.film_id

-- select rental_date, rental_duration, status, return_date
-- from rental R
-- left join inventory I
-- on r.inventory_id = i.inventory_id
-- left join film F
-- on i.film_id = f.film_id

-- Question #2
-- EXPLAIN select SUM(p.amount), c.city AS total_amount
-- from city C
-- left join address A
-- on c.city_id = a.city_id
-- left join customer CO
-- on a.address_id = co.address_id
-- left join payment P
-- on co.customer_id = p.customer_id
-- WHERE c.city IN ('Saint Louis','Kansas City')
-- GROUP BY c.city;

-- Question #3
-- EXPLAIN select c.name, COUNT(f.film_id) AS film_count
-- from category C
-- left join film_category FC
-- on c.category_id = fc.category_id
-- left join film F
-- on fc.film_id = f.film_id
-- GROUP BY c.name;

-- Questions #4

-- There is mainly a 2 tables one for film_category and category because film_category is more exact and goes more indepth on the data
-- Instead of category being super broad and containg all the information they decided to split the flim_category information into its own table
-- And connecting the category table to the film_category
-- In the end category table is broad with multiple broad data while the film_category is more exact and precicse holding information only about film categorys

-- Questions #5
-- select f.film_id, f.title, f.length, r.return_date
-- from film F
-- left join inventory I
-- on f.film_id = i.film_id
-- left join rental R
-- on i.inventory_id = r.inventory_id
-- WHERE return_date BETWEEN '2005-05-15' AND '2005-05-31'

-- Question #6
-- select AVG(p.amount), f.title
-- from film F
-- left join inventory I
-- on f.film_id = i.film_id
-- left join rental R
-- on i.inventory_id = r.inventory_id
-- left join payment P
-- on r.rental_id = p.rental_id
-- WHERE p.amount < 4.2006056453822965
-- GROUP BY f.title;

-- Question #7

-- select COUNT(status)
-- from rental
-- WHERE status BETWEEN 'Early'AND 'Over Due'
-- GROUP BY status

-- On Time = 1334
-- Early = 10712
-- Over Due = 3998
-- Question #8
--select rental_duration, title,
--PERCENT_RANK() OVER (ORDER BY title) AS rental_duration
--from film F

-- Question #9
-- Question 3 is going through the dataset to see how many films are in each category
-- Taking the count of the film_id and name of the movie and putting it AS film_count
-- Then sorting by name
-- The cost for the aggregate is 138.81..138.97 with rows = 16 adn width = 76
-- Question 2 is going through the dataset to see how many of the total payments are coming from Kansas City or Saint Louis
-- Doing this by Utalizing the Sum of p.amount, c.city and setting it AS total_amount
-- The Aggregate cost is 32.72..32.74 rows = 2 and width = 41

-- Extra Credit Questions
-- Set-Based Programming is defined as a performing operations on datasets as a whole rather than just the rows
-- Procedural Programming is defined as the series of instructions given to a computer that tells it what to do and what tasks to perform
-- Set-Based Programming is working with datasets on a large scale compared to Procedural
-- Set-Based is what you want to do while Procedural is how you get it
-- Set-Based is best for SQL since SQL you are able to manipulate datasets better than Python and on a large scale
-- Procedural is best for Python since Python is more about the instructions and tasks given to the computer to complete unlike where SQL is about manipulating datasets
