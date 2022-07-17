--exercise 1:
--a:
select *
from dealer cross join client;
--b:
select dealer.id, dealer.name, client.id, client.name, client.city, client.priority,sell.id,sell.date,sell.amount
from dealer inner join client on dealer.id=client.dealer_id
            inner join sell on client.id=sell.client_id;
--c:
select dealer.id, dealer.name,client.id,client.name,client.city
from dealer inner join client on dealer.location=client.city;
--d:
select sell.id, sell.amount,client.id,client.name,client.city
from sell inner join client on sell.client_id=client.id
and amount between 100 and 500;
--e:
select dealer.id, dealer.name,client.id,client.name
from client right join dealer on client.dealer_id=dealer.id;
--f:
select client.id,client.name,client.city,dealer.id,dealer.name,dealer.charge
from client inner join dealer on client.dealer_id=dealer.id;
--g:
select client.id,client.name,client.city,dealer.id,dealer.name,dealer.charge
from client inner join dealer on client.dealer_id=dealer.id and
dealer.charge>0.12;
--h:
select
client.id,client.name,client.city,sell.id,sell.date,sell.amount,dealer.id,dealer.name,dealer.charge
from client left join dealer on client.dealer_id=dealer.id
            left join sell on client.id=sell.client_id;
--i:
select
client.id,client.name,client.priority,dealer.id,dealer.name,sell.id,sell.amount
from client inner join dealer on client.dealer_id=dealer.id
            left join sell on client.id=sell.client_id
where sell.amount>=2000 and client.priority is not null;
--exercise 2:
--a:
create or replace view a AS
select date,count(client_id),avg(amount),sum(amount)
from sell
group by date;
--b
create or replace view b AS
select date,sum(amount)
from sell
group by date
order by sum(amount) DESC
LIMIT 5;
--c
create or replace view c AS
select dealer_id,count(dealer_id),avg(amount),sum(amount)
from sell
group by dealer_id;
--d
create or replace view d AS
select sell.dealer_id,count(sell.dealer_id),sum(sell.amount)*dealer.charge
from sell inner join dealer on sell.dealer_id=dealer.id
group by sell.dealer_id,dealer.charge;
--e;
create view e AS
select client.city,count(client.city),sum(sell.amount),avg(sell.amount)
from client inner join sell on client.dealer_id=sell.client_id
group by client.city;
--f;
create view e AS
select client.city,count(client.city),sum(sell.amount),avg(sell.amount)
from client inner join sell on client.id=sell.client_id
group by client.city;
--g

