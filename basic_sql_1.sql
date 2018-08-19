/*
1. Write a SQL statement to find the total purchase amount of all orders

Tables 
Orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)
Customer(Cust_id,cust_name,city,grade,salesman_id)
salesman(salesman_id,name,city,comission)
*/

select SUM(purch_amt) as Total_Purchase_Amount
from Orders


-- 2. Write a SQL statement to find the average purchase amount of all orders.

select AVG(purch_amt) as Average_Purchase_Amount
from Orders

--3. Write a SQL statement to find the number of salesmen currently listing for all of their customers

select count(distinct salesman_id)
from Orders

--4. Write a SQL statement know how many customer have listed their names. 

select count(cust_id)
from customer

--cust_id is Primary key in Customer , so no need to select distinct

--5. Write a SQL statement to get the maximum purchase amount of all the orders.

select max(purch_amt)
from orders

--6. Write a SQL statement to get the minimum purchase amount of all the orders

Select min(purch_amt)
from orders

--7. Write a SQL statement which selects the highest grade for each of the cities of the customers.

select max(grade),city
from customer
group by city

--8. Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount

select max(purch_amt),cust_id
from orders
group by cust_id

--9. Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount.

select max(purch_amt),cust_id,ord_date
from orders
group by cust_id,ord_date

--10. Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID. 

select max(purch_amt),salesman_id
from orders
where ord_date=cast('2012-08-17' as date)
group by salesman_id


--11. Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.

select cust_id,ord_date,max(purch_amt)
from orders
group by cust_id,ord_date
having max(purch_amt)>2000

--12. Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000.

select cust_id,ord_date,max(purch_amt)
from orders
group by cust_id,ord_date
having max(purch_amt) between 2000 and 6000

--13. Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.

select cust_id,ord_date,max(purch_amt)
from orders
group by cust_id,ord_date
having max(purch_amt) in (2000,3000,5760,6000)

--14. Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.


select cust_id,max(purch_amt)
from orders
where cust_id between 3002 and 3007
group by cust_id;


--15. Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000

select cust_id,max(purch_amt)
from orders
where cust_id between 3002 and 3007
group by cust_id
having max(purch_amt)>1000;

--16. Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008.


select salesman_id,max(purch_amt)
from orders
where cust_id between 5003 and 5008
group by salesman_id;


--17. Write a SQL statement that counts all orders for a date August 17th, 2012.

SELECT COUNT(*) 
FROM orders 
WHERE ord_date=DATE('2012-08-17');


--18. Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified

select count(salesman_id)
from salesman
where length(trim(city))>0

