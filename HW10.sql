USE sakila;

#1a
select 
A.first_name, 
A.last_name
from actor A;

#1b
select 
concat(A.first_name,' ',a.last_name) as Actor_Name
from actor A;

#2a
select 
A.actor_id,
A.first_name,
A.last_name
from Actor A
where A.first_name ="Joe";

#2b
select 
A.actor_id,
A.first_name,
A.last_name
from Actor A
where A.last_name like '%GEN%';

#2c
select 
A.actor_id,
A.last_name,
A.first_name
from Actor A
where A.last_name like '%LI%';

#2d
select 
C.country_id,
C.Country
from Country C
where c.country in ('Afghanistan','Bangladesh', 'China');

#3a
ALTER TABLE Actor
add column Description blob;

#3b
ALTER TABLE ACTOR
DROP COLUMN Description;

#4a
select a.last_name,
count(a.last_name)
from Actor A
group by A.last_name;

#4b
	select a.last_name,
	count(a.last_name) as COUNT
	from Actor A
	group by A.last_name
    having count >=2;

#4c
UPDATE actor A
SET A.first_name = "Harpo"
WHERE A.first_name ="Groucho"
AND A.last_name ="Williams";

#4d
SET SQL_SAFE_UPDATES = 0;
UPDATE actor A
SET A.first_name = "Groucho"
WHERE A.first_name ="Harpo";

#5a.
SHOW CREATE TABLE address;
DESCRIBE address;

#6a
select 
s.first_name,
s.last_name,
a.address
from 
staff S
left join address A
on s.address_id = a.address_id;

#6b
select 
s.staff_id,
s.first_name,
s.last_name,
sum(p.amount) as Total 
from 
staff S
inner join payment P
on s.staff_id = p.staff_id
where P.payment_date >='2005-08-01' 
and P.payment_date<='2005-08-31'
group by s.staff_id;


#6c
select 
f.title,
count(fa.actor_id)

from film F
inner join film_actor FA
on f.film_id=fa.film_id
group by f.title;

#6d
select
f.title,
count(i.inventory_id)

from
film F 
inner join Inventory I
on f.film_id = i.film_id

where f.title="Hunchback Impossible"
group by f.title;

#6e
select c.customer_id,
c.first_name,
c.last_name,
sum(p.amount)

from
customer c
inner join payment P
on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name ASC;

#7a

select 
d.title,
d.name
from

(select f.title,
l.name

from film F
inner join language L
on f.language_id = l.language_id
where name ="English") D

where d.title LIKE 'K%' 
OR d.title LIKE 'Q%';



#7b
select f.title,
fa.film_id,
a.first_name,
a.last_name

from film_actor fa
inner join film f on fa.film_id = f.film_id
inner join actor A on fa.actor_id = A.actor_id

where f.title="Alone Trip";

#7c

select
c.first_name,
c.last_name,
c.email,
ci.city,
co.country

from
customer c
inner join address a on c.address_id = a.address_id
inner join city ci on a.city_id = ci.city_id
inner join country co on ci.country_id = co.country_id

where
co.country="Canada";

#7d
select
f.title,
fc.category_id,
c.name

 from 
 film f
 inner join film_category fc on f.film_id = fc.film_id
 inner join category c on fc.category_id = c.category_id
 where c.name ="Family";
 
 #7e
 use sakila;
select 
f.title,
count(r.rental_id)

from film f 
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id

group by f.title
order by count(r.rental_id) DESC;

 #7f
 select s.store_id,
 sum(p.amount)

 
 from 
 payment p
 
 inner join customer c on p.customer_id=c.customer_id
 inner join store s on s.store_id = c.store_id
 group by s.store_id;

#7g
select s.store_id,
c.city,
co.country

from
store s
inner join address a on s.address_id = a.address_id
inner join city c on a.city_id = c.city_id
inner join country co on c.country_id = co.country_id;

#7h.
select c.name,
sum(p.amount)

from 
category c inner join film_category fc on c.category_id = fc.category_id
inner join inventory i on fc.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join payment p on r.rental_id = p.rental_id 
group by name
order by sum(p.amount) DESC
LIMIT 5;

#8a
CREATE VIEW TOP5 AS select c.name,
sum(p.amount)

from 
category c inner join film_category fc on c.category_id = fc.category_id
inner join inventory i on fc.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join payment p on r.rental_id = p.rental_id 
group by name
order by sum(p.amount) DESC
LIMIT 5;

#8b
select * from top5;

#8c
DROP VIEW top5;






