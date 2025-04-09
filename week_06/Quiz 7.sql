-- select count(*)
-- from actor;

-- select *
-- from actor
-- limit 100

-- select *
-- from customer C
-- left join address A
-- on c.address_id = a.address_id

-- select *
-- from actor
-- where first_name LIKE 'N%'

select *
from payment
where amount >= 9.99
limit 100

select Max(amount)
from payment

select *
from payment P
left join rental R
on p.rental_id = r.rental_id
left join inventory I
on r.inventory_id = i.inventory_id
left join film F
on i.film_id = f.film_id
where amount = 11.99

select s.email, s.first_name, s.last_name, a.address, c.city, co.country
from staff S
left join address A
on s.address_id = a.address_id
left join city C
on a.city_id = c.city_id
left join country CO
on c.country_id = co.country_id

-- Company wise there are 3 that I would like to work at which would be Spotify, Pintrest, or Nivida. If not those I would like to work with a start-up or with Artifical Intellegience. I really want to build C3PO

-- Crows foot notation is where you give one inputs and get multiple outputs
-- Example being using the country table we have one input from a country and we can be given multiple citys
-- If putting in United States for country we can gain cities like New York and Los Angeles as an output
