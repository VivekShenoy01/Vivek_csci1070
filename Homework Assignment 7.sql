-- Question 1
-- select *
-- from customer
-- where last_name LIKE 'T%'

-- Question 2
-- select *
-- from rental R
-- where return_date BETWEEN '2005-05-28' AND '2005-06-01'

-- Question 3
-- You would have to use left join to compare rental and film for rental_duration
-- select *
-- from rental R
-- left join inventory I
-- on r.inventory_id = i.inventory_id
-- left join film F
-- on i.film_id = f.film_id
-- where rental_duration >= 7
-- limit 10

-- Question 4
-- EXPLAIN ANALYZE select SUM(p.amount), c.first_name, c.last_name
-- from customer C
-- left join payment P
-- on c.customer_id = p.customer_id
-- GROUP BY p.amount, c.first_name, c.last_name
-- ORDER BY p.amount DESC;



-- Question 5
-- select concat(a.first_name, a.last_name) full_name, f.release_year,
-- COUNT(concat(a.first_name, a.last_name))
-- from actor A
-- left join film_actor FA
-- on a.actor_id = fa.actor_id
-- left join film F
-- on fa.film_id = f.film_id
-- Group By first_name, release_year, last_name

-- Question 6
-- Question number 4 is going through the dataset through shared customer_id from customer to payment
-- and then outptting the amount and reversing it into descending order
-- The cost for the aggregate was 460.98..603.24 with 11381 rows and the actual was
-- 1089.731..1093.575 with 4677
-- It took longer than anticipated but went through less rows

-- Question number 5 is going through the datasets actor, film_actor, and film and grouping
-- The first_name from actor and the release_year from film together and seeing the correlation
-- The expected cost for the aggregate was 298.93..300.53 with 128 rows but the actual was 742.761..742 with 199 rows
-- It took longer than anticipated and went through more rows

-- Question 7
-- select AVG(f.rental_rate), c.name
-- from film F
-- left join film_category FC
-- on f.film_id = fc.film_id
-- left join category C
-- on fc.category_id = c.category_id
-- GROUP BY rental_rate, name
-- ORDER BY rental_rate DESC;

-- Question 8
-- select SUM(p.amount), MAX(f.rental_rate) rr, c.name
-- from payment P
-- left join rental R
-- on p.customer_id = r.customer_id
-- left join inventory I
-- on r.inventory_id = i.inventory_id
-- left join film F
-- on i.film_id = f.film_id
-- left join film_category FC
-- on f.film_id = fc.film_id
-- left join category C
-- on fc.category_id = c.category_id
-- GROUP BY c.name
-- ORDER BY rr DESC
-- limit 5


-- Extra Credit
SELECT to_char(r.rental_date, 'Month') AS month, c.name AS genre, COUNT(r.rental_id)
from rental R
inner join inventory I
on r.inventory_id = i.inventory_id
inner join film F
on i.film_id = f.film_id
inner join film_category FC
on f.film_id = fc.film_id
inner join category C
on fc.category_id = c.category_id
GROUP BY month, genre
ORDER BY month



-- select c.name, r.rental_date, f.title
-- from category C
-- left join film_category FC
-- on c.category_id = fc.category_id
-- left join film F
-- on fc.film_id = f.film_id
-- left join inventory I
-- on f.film_id = i.inventory_id
-- left join rental R
-- on i.inventory_id = r.inventory_id
-- where return_date BETWEEN '2005-01-01' AND '2005-12-31'
-- GROUP BY name, rental_date, title
-- ORDER BY rental_date ASC;