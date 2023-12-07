-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name) as disctinct_actors_last_names
from actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as different_languages
from film;

-- 3. How many movies were released with "PG-13" rating?
select count(film_id) as number_of_pg13_rated_movies
from film
where rating = "PG-13";

-- 4.Get 10 the longest movies from 2006.
select title as longest_ten_movies_from_2006
from film
where release_year = 2006
order by length desc
limit 10; 

-- 5.How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as days_operating
from rental;

-- 6.Show rental info with additional columns month and weekday. Get 20.
select *, extract(month from rental_date) as month, dayname(rental_date) as weekday
from rental;

-- 7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
	case 
		when dayname(rental_date) in ("Sunday","Saturday") then "weekend"
		else "workday"
	end as day_type
from rental;

-- 8.How many rentals were in the last month of activity? 
select count(rental_id) as number_of_rentals_from_last_month
from rental 
where year(rental_date) = year(current_date - interval 1 month)
and month(rental_date) = month(current_date - interval 1 month)
