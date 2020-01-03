select * from customers where name = '3M';

select * from customers where credit_limit > 4000;

select * from products;

select * from products where category_id = 1;

select * from employees;

select * from employees where manager_id =1;

select * from employees where manager_id in (9,1,2,21); 

select * from employees where manager_id not in (9,1,2,21); 

select * from employees where manager_id in (select employee_id from employees);

select employee_id, employees.first_name, manager_id from employees 
where manager_id not in 
(select employee_id from employees) or manager_id is null;

select * from contacts;

select * from contacts where last_name = 'Estrada';

select * from contacts where first_name = 'Charlie';

select * from contacts where first_name = 'Charlie' and last_name = 'Pacino';

select count(*) from employees;

select * from orders where status = 'Pending';

select * from orders where status = 'Pending' and salesman_id = 55;

select * from orders where status not in ('Shipped', 'Canceled');

select * from customers;

select first_name||' '||last_name name from contacts 
order by name desc;

select * from customers order by credit_limit desc;

select name, customer_id, credit_limit from customers;

select Distinct first_name, last_name from contacts;

select Distinct last_name from contacts;

select * from orders;

select * from customers where name = 'Aflac';

select * from orders where salesman_id is Null;
select * from orders where order_date = '27-SEP-17';
select * from orders where customer_id = (select customer_id from customers where name = 'Aflac');

select * from orders where salesman_id = 
(select employee_id FROM employees where first_name = 'Grace' and last_name = 'Ellis');

select * from employees;
select * from employees where manager_id = 
(select employee_id from employees where first_name = 'Isabella' and last_name = 'Cole');

select * from orders;
select * from orders where status = 'Shipped' and order_date = '29-NOV-16'; 

select * from products;
select * from products order by list_price desc;

select * from order_items;
select * from order_items where product_id in (5,7,32,95);

select * from products;
select order_id, oi.product_id, (select product_name from products where product_id = oi.product_id)
from order_items oi where product_id in (5,7,32,95);



select * from customers
where credit_limit >= 3000 and credit_limit <= 5000
order by credit_limit desc;

select * from customers
where credit_limit between 3000 and 5000
order by credit_limßit desc;

select * from orders
where order_date between '17-NOV-16' and '20-FEB-17'
--like:

select * from customers where name like '%National'

select * from customers where name like 'Lincoln%';

select last_name from contacts where 
REGEXP_LIKE(last_name, 'Emers(o|e|a)n')


select last_name from contacts
order by last_name desc

select last_name from contacts
where REGEXP_LIKE(last_name ,'Rober')

select * from contacts where last_name like 'Wil%';


---1---column name and values

insert into employees (employee_id, first_name, last_name, email, phone, hire_date, job_title)
values ('1076', 'sak', 'sol', 'sak.sl@cp.com', '321321', '27-SEP-16', 'Manager')

select * from employees where employee_id = 1000;
insert into employees values ('1001', 'jihun', 'park', 'jihun@gmail.com', '213905', '02-DEC-19', 'Train')

select * from customers
insert into customers (customer_id, name, address, credit_limit)
values ('1005', 'Collabera', 'Chicago', '5000')

insert into customers(customer_id, name, address, credit_limit)
values ('1006', 'Ji', 'Chicago', '5000')


select * from Regions
insert into regions (region_id, region_name)
values (5,'Africa')

select * from employees order by employee_id desc;
update employees set first_name = 'sakshi', last_name = 'S' 
where employee_id = 1000;

select * from products;
update products set list_price = list_price + .5 ;

select * from customers;
update customers set website = 'http://www.unitednew.com' where customer_id = 177;

select * from customers;
update customers set credit_limit = credit_limit + 100;

select * from employees
select * from employees where manager_id in 2;
update employees set manager_id = 2 where manager_id = 1;

select * from contacts;

select * from customers;
insert into contacts (contact_id, first_name, last_name, email, phone, customer_id)
values ('1000','collabera','c', 'collaera@g.com','21321','1000')




select * from employees;
select employee_id, first_name, last_name, oi.manager_id,
(select first_name||' '||last_name "Name" from employees where employee_id = oi.manager_id)
from employees oi;

select * from products
select * from inventories
select * from warehouses

select oi.warehouse_id,
(select warehouse_name from warehouses where warehouse_id = oi.warehouse_id),
quantity, oi.product_id, 
(select product_name from products where product_id = oi.product_id)
from inventories oi;


select * from employees order by first_name, last_name desc;

update employees set first_name = 'Amelia' where employee_id = 103;

select * from contacts order by first_name, last_name;

select * from employees;

select * from employees where hire_date between '01-JAN-15' and '31-JAN-16'

select * from products order by standard_cost, list_price desc;

select * from products;
select * from product_categories

select product_name, oi.category_id,
(select category_name from product_categories where category_id = oi.category_id)
from products oi where category_id = 5;


select * from countries;
select * from countries where region_id = '2';

select * from locations;


select * from warehouses;
select * from warehouses where location_id in (5,6,7,8,9,23);

select oi.location_id from warehouses oi where location_id in(
(select location_id from locations where country_id in (select country_id from countries where region_id = '2')));

select * from inventories;
select count(*) from inventories oi where warehouse_id in (
(select warehouse_id from warehouses where location_id in
(select location_id from locations where country_id in (select country_id from countries where region_id = '2'))));




select * from customers order by UPPER(name);
select * from contacts order by 1 desc;

select * from employees order by manager_id desc nulls first;


select customer_id, name customer_name, address from customers order by customer_name;


select * from locations;
select * from locations order by city asc;
select * from locations order by state desc;
select * from locations order by state desc nulls last;
select * from locations order by UPPER(state);

select 
    product_name,
    list_price,
    CASE category_id
        WHEN 1
        THEN ROUND(list_price * 0.05,2) --CPU
        WHEN 2
        THEN ROUND(list_price * 0.1,2) -- video card
        ELSE ROUND(list_price * 0.08,2)
    END discount
FROM
    products
ORDER BY
    product_name;
    
select * from inventories;
select product_id, Quantity,
CASE
    WHEN Quantity > 200 THEN 'greater than 200'
    WHEN Quantity = 200 THEN 'The quantity is 200'
    ELSE 'UNDER 200'
END category
FROM inventories where warehouse_id = 1 order by product_id;



select * from products;
select list_price,
CASE
    WHEN list_price between 0 and 600 THEN 'normal'
    WHEN list_price between 600 and 1000 THEN 'economy'
    WHEN list_price > 1000 THEN 'luxury'
END product_group
FROM products where category_id = 1;


select * from locations order by country_id,
CASE country_id
when 'US' THEN state
else city
end;

select * from locations where country_id in ('US','CA','UK')
order by country_id,
CASE country_id
when 'US' THEN state
else city
end;


select * from products;
update products
set list_price = 
CASE
when standard_cost > 1800 and standard_cost < 2000
then list_price + 100
when standard_cost > 2000 and standard_cost < 2200
then list_price + 200
END
Where standard_cost > 1800;

select * from employees where manager_id = 2;

update employees
set hire_date = '01-JAN-2019'
where manager_id = 2;

select * from employees where job_title = 'Software Programmer';
update employees
set job_title = 'Software Programmer'
where job_title = 'Programmer';

select * from orders;
select * from order_items
    
select * from orders o inner join order_items oi on o.order_id = oi.order_id
inner join customers c on o.customer_id = c.customer_id;

select * from orders o inner join order_items oi using(order_id);

select o.order_id, oi.item_id, c.customer_id, name from orders o
inner join order_items oi on o.order_id = oi.order_id
inner join customers c on o.customer_id = c.customer_id;

select * from orders;
select * from employees;
select first_name, salesman_id, order_id, employee_id from orders o
inner join employees e on o.salesman_id = e.employee_id;

--select empid, first last name, and manager id and manager name
select employee_id, first_name, last_name, oi.manager_id,
(select first_name||' '||last_name "Name" from employees where employee_id = oi.manager_id)
from employees oi;

select * from employees;

select e.employee_id, e.first_name, e.manager_id, m.first_name from employees e 
inner join employees m on e.manager_id = m.employee_id;

select * from orders;
select * from employees;



select o.order_id, e.employee_id, e.first_name FROM orders o 
INNER JOIN employees e on o.salesman_id = e.employee_id
where e.job_title = 'sales rep' ORDER by e.first_name;




-- order_item and products combine order id, item id, product id and product name
select * from order_items;
select * from products;
select o.order_id, o.item_id, o.product_id, p.product_name from order_items o
inner join products p on o.product_id = p.product_id;

select customer_id, count(order_id) from orders
group by customer_id
having count(order_id) < 4 order by customer_id;


--count of orders for each salesman
select * from orders;
select salesman_id, count(order_id) from orders
group by salesman_id
having count(order_id) > 10 order by salesman_id;

--how many employe for each manager
select * from employees;
select manager_id, count(employee_id) from employees
group by manager_id;

-- how many employee hired on JUNE 16
select * from employees;
select hire_date, count(employee_id) from employees
group by hire_date;
having count(employee_id) > 1 order by hire_date;

--from order items, all the orders 
select * from order_items;
select count(item_id), order_id, sum(unit_price * Quantity) from order_items
group by order_id
having count(item_id) between 10 and 12 
and
sum(unit_price * Quantity) > 1000000 order by order_id;

--find the max from list_price from product
select * from products;
select max(list_price) from products;

--count pending shipped and canceled from orders
select * from orders;
select status, count(order_id) from orders
group by status;

--shipped in dec 2016 from orders
select * from orders;
select status, order_date from orders
group by status
having order_date between '01-DEC-16' and '31-DEC-16' and status = Shipped;

--group all producs by categry_id
select * from products;

select count(product_id), category_id from products
group by category_id;


select e.employee_id, e.first_name, e.manager_id, m.first_name from employees e 
inner join employees m on e.manager_id = m.employee_id;

select * from products;
select * from product_categories;
--iner join
select count(product_id), a.category_id, b.category_name from products a
inner join product_categories b on a.category_id = b.category_id
group by a.category_id, b.category_name
having count(product_id) > 0 order by a.category_id;


select count(product_id), a.category_id, b.category_name from products a
right join product_categories b on a.category_id = b.category_id
group by a.category_id, b.category_name
order by a.category_id;

--customer name, email, address. product_id, order_id
select * from customers;
select * from orders;
select * from order_items;
select * from contacts;


select cu.name, email, cu.address, oi.product_id, order_id FROM contacts c
inner join customers cu USING(customer_id)
inner join orders o USING(customer_id) 
inner join order_items oi using(order_id)
where oi.product_id = 227;



--unitd continental holding - 177, customerid, productid, productname
select * from customers;
select * from products;
select * from order_items;
select * from orders;

select customer_id, product_id, c.product_name from order_items a
inner join orders b USING(order_id)
inner join products c USING(product_id)
where customer_id= 16;

--all products that were ordered in jan 2017 ,prod_id, prod_name, order_Date

select * from products;
select * from orders;
select * from order_items;


select product_id, order_date, c.product_name from order_items a
inner join orders b USING(order_id)
inner join products c USING(product_id)
where order_date between '01-JAN-17' and '31-JAN-17';


--all empid, emp name, last_name, who didnt place order
select * from orders;
select * from employees;
select * from contacts;

select employee_id, first_name, last_name from employees a
left outer join orders b on a.employee_id = b.salesman_id
where salesman_id is null;


--

select product_id, warehouse_id from products cross join warehouses;

--min list_price from products
--min value for each order(quantity x unitprice) need prodid, orderid, value
select * from products;
select * from order_items;

select min(list_price) from products;

select order_id, min(unit_price * quantity) from order_items
group by order_id order by order_id;


--create table

create table persons (
person_id NUMBER NOT NULL,
FIRST_NAME  VARCHAR(50) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
AGE NUMBER (10,2),
PRIMARY KEY(PERSON_ID)
);

DESC PERSONS;

alter table persons
add birthdate DATE NOT NULL;

ALTER TABLE PERSONS
ADD (
PHONE VARCHAR2(10),
ADDRESS VARCHAR2 (50)
);

--DROP COLUMN
ALTER TABLE PERSONS
DROP COLUMN ADDRESS;

--RENAME COLUMN
ALTER TABLE persons RENAME COLUMN phone to phonenumber;
alter table persons rename to people;

desc people;

--create 4 tables, student id, name, age address
CREATE TABLE Students (
student_id number not null,
name varchar(50) not null,
age number(10,2),
address varchar (250) not null,
primary key (student_id)
);

desc students;

alter table Students
add admission_date date not null;

ALTER TABLE STUDENTS RENAME COLUMN name to student_name;


--create subject table
CREATE TABLE Subjects (
subject_id number not null,
subject_namme varchar(250) not null,
primary key(subject_id)
);
desc subjects;

alter table subjects
add departname varchar2(50) not null;


--create teacher
CREATE TABLE Teachers (
teacher_id number not null,
teacher_name varchar (250) not null,
subject_id number not null,
primary key(teacher_id)
);
desc teachers;

alter table teachers
add joining_date date not null;

--create student subject
CREATE TABLE StudentSubject (
id number not null,
student_id number not null,
subject_id number not null,
primary key(id)
);
desc studentsubject;

alter table studentsubject rename to studentsubrotation;

desc studentsubrotation;

--
insert into studentsubrotation (id, student_id, subject_id)
values ('1', '1', '100')

insert into teachers (teacher_id, teacher_name, subject_id, joining_date)
values ('2','sakshi','3','02-DEC-19')

insert into subjects (subject_id, subject_namme,departname)
values (4,'CS','Sci Depart')

insert into students (student_id, student_name, age, address, admission_date)
values (6,'jihun',27,'chicago','03-DEC-19')


--change age of student to 40
select * from students;
update students set age = 40
where student_id = 6

--drop departname from subject table
select * from subjects;
ALTER TABLE subjects
DROP COLUMN departname;

--truncate and drop table
select * from studentsubrotation;
truncate table studentsubrotation;

alter table studentsubrotation
drop table studentsubrotation;

--
select * from user_tab_cols;
select user_tab_cols where table_name = students count(column_name);


--create views

CREATE OR REPLACE VIEW EMPLOYEE_JUN2016
AS
SELECT * FROM EMPLOYEES WHERE hire_date BETWEEN '01-JUN-16' and '30-JUN-16';
SELECT * FROM EMPLOYEE_JUN2016;

select * from employees where manager_id = 2;

select * from employees where employee_id =2;

select * from employees;
select * from employees where manager_id = 2;

select * from employees where manager_id = 2 and where hire_date between '01-JUN-16' and '30-JUN-2016';

--create jude
CREATE OR REPLACE VIEW JUDE
as
select * from employees where manager_id = 2;
select * from jude;
select * from JUDE where hire_date between '01-JUN-16' and '30-JUN-16';

--customer name, orderid, orer status, ordatedate, productname, (viewname = pendingorder)
--for orders that are pending

--customer name, orderid, order status, order date, productname
select * from orders;
--orderid, orderstatus, orderdate, orerid, customerid
select * from customers;
--customername, customerid
select * from products;
--productname, productid
select * from order_items;
--productid, orderid

CREATE OR REPLACE VIEW PendingOverView
as
select order_id, status, order_date, name, product_name from orders a
inner join order_items b USING(order_id)
inner join products c USING(product_id)
inner join customers d USING(customer_id)
where status = 'Pending';

select * from pendingoverview;


--createview programmer, empid, firstname, jobtitle = programmer
select * from employees;
--empid, firstname, jobtitle

CREATE OR REPLACE VIEW Programmer
as
select e.employee_id, e.first_name, e.job_title,    --e = programmer
m.first_name managername, m.job_title manager_title --m = employees
from employees e
inner join employees m on e.manager_id = m.employee_id 
where e.job_title = 'Programmer';

select * from programmer;





--start from employees, salesman

create or replace view salesman
as
select * from employees where job_title = 'Sales Representative';
select * from salesman;

--salesman_contcts, empid, empname, email, phonenumber
create or replace view salesman_contact
as
select employee_id, first_name, email, phone from salesman;
select * from salesman_contact;

alter view salesman
drop view salesman;


--create a view
--productname, quantity, order_date, status, unit_price
--that are ordered in 2016 (join orders , order_item, products)
select * from orders;
--order_date, status. order_id
select * from order_items;
--quantity, unit price, product_id, order,id
select * from products;
--product_name, product_id

CREATE OR REPLACE VIEW ORDER2016
AS
select order_id, quantity, unit_price, order_date, status, product_name from order_items a
inner join orders b USING(order_id)
inner join products c using(product_id)
where order_date between '01-JAN-16' and '31-DEC-16';

select * from order2016;

--sum(quantity * unitprice) groupby orderid
select order_id, sum(quantity * unit_price) from ORDER2016
group by order_id;

--sum fromabove >50,000

select order_id, sum(quantity * unit_price) from order2016
group by order_id
having sum(quantity * unit_price) > 50000 order by order_id;


--from orders_items table get product name (SUB QUERY)
select * from order_items;
--orderid, prodid, quantity, unitprice and prod name
select * from products;


select 
quantity, unit_price, order_id, product_id,
(Select product_name from products where products.product_id = order_items.product_id) --product_name
from order_items;


--from orders placed by 'sales reprensative' 
--select empid from employees where job title = sales rep
select * from orders;
select * from employees;

select * from orders, 
(select * from employees where job_title = 'Sales Representative') salesman
where orders.salesman_id = salesman.employee_id;


select * from orders where salesman_id in 
(select employee_id from employees where job_title = 'Sales Representative');


select * from orders;

--sub query to get all employee that are managers
select * from employees;


select * from employees where employee_id in
(select manager_id from employees);

--
select current_date from dual;
select * from dual;

--employes all email caps
select * from employees;
select employee_id, first_name, upper(email) from employees;


select concat(first_name, last_name) name from employees;

select greatest() from dual;

select max(list_price) from products;
select round(list_price,1) from products;

select add_months(sysdate,5) from dual;
select extract(year from sysdate) from dual;
select last_day(current_date) from dual;
select months_between(current_date, '06-MAR-19') from dual;

select round(current_date) from dual;

--how many years 

select * from employees;
select concat(first_name, last_name) full_name,
round(months_between(current_date, hire_date)/12,1) years_worked 
from employees;
--
select concat(first_name, last_name) full_name,
extract(year from sysdate) - extract(year from hire_date) 
from employees;

--select orders placed in last 6 months
select * from orders;
select * from orders where months_between(date '2019-12-18', order_date) <30;


--product_name, warehouse_name, quantity, from inventories
select * from inventories;
--quantity, warehouseid, product_id
select * from products;
--product_name, category_id, product_id
select * from warehouses;
--warehouseid, warehoues_name, 
select * from product_categories;


-- get product_name, warehousename, qty from inventories where categoryid =1 and quantity > 150
select product_id, product_name, warehouse_name, quantity from inventories a
inner join products b USING(product_id)
inner join warehouses c USING(warehouse_id)
where quantity > 150 and category_id = 5 order by product_id;


--groupby product_id

--this creates view of above
create or replace view category5
as
select product_id, product_name, warehouse_name, quantity from inventories a
inner join products b USING(product_id)
inner join warehouses c USING(warehouse_id)
where category_id = 5 order by product_id;

--group by the new view we created
select product_id, product_name from category5
group by product_id, product_name;


--
select * from warehouses;
select * from inventories;

select warehouse_id, quantity from inventories
group by warehouse_id, quantity;

select warehouse_id, sum(quantity) from inventories
group by warehouse_id;

--customerid, name, orderid, status, pending
select * from customers;
select * from orders;
select * from employees;
select * from order_items;


select customer_id, name, order_id, status from orders a
inner join customers b USING(customer_id)
where status = 'Pending';

--orderid, status, date, empid, empname, mgr name

select e.employee_id, e.first_name,   
m.order_date, m.status, m.order_id 
from employees e
inner join orders m on e.employee_id = m.salesman_id
where e.manager_id = '46';


--how many orders are ordered in 2017 but not shipped for each customer

select * from orders;

select customer_id, name, count(order_id) from orders
inner join customers b USING(customer_id)
where order_date between '01-JAN-17' and '31-DEC-17' 
and status != 'Shipped'
group by customer_id, name ;


-- how mnay orders placed by each customer

select customer_id, name, count(order_id) from orders
inner join customers b USING(customer_id)
where status = 'Shipped'
group by customer_id, name;


--product_name category_name orderid and customer_name for all shipped orders

select * from orders;
--status, order_id, customer_id
select * from customers;
--customer_id, customer_name, 
select * from product_categories;
--category_name, category_id
select * from products;
--product_name, product_id, category_id
select * from order_items;


select name, product_name, category_name, order_id from order_items a
inner join products b USING(product_id)
inner join orders o USING(order_id)
inner join customers c USING(customer_id)
inner join product_categories d USING(category_id)
where status = 'Shipped';



--list of customers with no orders, customer_id, customer name, customer website
select * from customers;
select * from orders;
select * from employees;
select * from order_items;

select customer_id, name, website from customers 
where customer_id not in  
(select customer_id from orders);

--employee with no orders
select * from employees;
select employee_id, first_name from employees
where employee_id not in
(select salesman_id from orders where salesman_id is not null);



select * from products where product_id = &prod;
delete from employees where employee_id = :emp;
select * from employees;

select coalesce('', '', 'collabera') from dual; --
select nvl('a', sysdate) from dual;

create sequence countries_seq
minvalue 1 maxvalue 99999999999999999
increment by 1 start with 1;


select countries_seq.nextval from dual; -- run this first
select countries_seq.currval from dual; -- then this

select * from employees where rownum <=3;


select product_id from products 
minus 
select distinct product_id from order_items

---get employee name, employee_id, employees that are not managers
select * from employees;
select employee_id, concat(first_name, last_name) from employees  --gets all data
minus
select employee_id, concat(first_name, last_name) from employees --all data
where employee_id in (select manager_id from employees);    --select manager_id from employees in employee_id


--union, first_name, last_name, email for all employees and customer
select * from employees;
select * from customers;
select * from contacts;

select concat(first_name, last_name) full_name, email from employees
union 
select concat(first_name, last_name) full_name, email from contacts
order by full_name;




select last_name from employees
union all
select last_name from contacts
order by last_name; --425

select last_name from employees
union 
select last_name from contacts
order by last_name; --326


select last_name from employees
intersect
select last_name from contacts;


--contacts table minus employees

select last_name from contacts
minus
select distinct last_name from employees;


--
--minus get all products(produ_id) for which no inventories is present

select * from inventories;
select * from products;

select product_id from products
minus
select distinct product_id from inventories;

--get above + product_name
CREATE OR REPLACE VIEW prodminus
AS
select product_id from products
minus
select distinct product_id from inventories


select product_name, product_id from products a
inner join prodminus b USING(product_id);

--customerid, customer name who have order product from cpu category
select * from customers;
--customer name, customer id
select * from product_categories;
--categoryid, categoryname
select * from products;
--productid, categoryid
select * from order_items;
--customerid orderid
select * from orders;


select customer_id, name, category_id from customers a --gets everything
inner join orders c using(customer_id)
inner join order_items d using(order_id)
inner join products b using(product_id)
minus
                                                        --minus
select          
customer_id, name, category_id from customers           --removing from cpu 1

inner join orders c using(customer_id)
inner join order_items d using(order_id)
inner join products b using(product_id)
where category_id != '1'

--

select * from dictionary;
select * from all_tables;
select * from all_tables where tablespace_name = 'Users';
select * from all_constraints;
select * from all_cons_columns;

--if any customer went over credit limit print
select * from customers;
--customer_id, name
select * from order_items;
--order_id, quantity, unit_price
select * from orders;
--customer_id

select name, customer_id, credit_limit from customers a
inner join orders b using(customer_id)
inner join order_items c USING(order_id)
where (quantity * unit_price)  > credit_limit
group by name, customer_id, credit_limit;

select name, customer_id , sum(quantity * unit_price), credit_limit from customers a
inner join orders b using(customer_id)
inner join order_items c USING(order_id)
group by name, customer_id, credit_limit
having sum(quantity * unit_price)  > credit_limit;


--

select name, order_id, customer_id , sum(quantity * unit_price), credit_limit from customers a
inner join orders b using(customer_id)
inner join order_items c USING(order_id)
group by name, customer_id, credit_limit, order_id
having sum(quantity * unit_price)  > credit_limit;


--from order_items, how many quantity ordered from each product
select * from order_items;
--orderid,itemid,productid,quant,unitprice
select * from products;
--product_id,prodname,desc,standardcost,list_price,cateid
select * from inventories;
--prod_id, quantity



select * from inventories order by product_id;

select product_id, sum(quantity)
from order_items oi group by product_id
having sum(quantity) > 
(
select sum(quantity) from inventories where product_id = oi.product_id 
group by (product_id) 
) 
order by product_id;


select oi.product_id, sum(oi.quantity), sum(i.quantity) from order_items oi
inner join inventories i on oi.product_id  = i.product_id
group by (oi.product_id) having sum(oi.quantity) > sum(i.quantity)


--constraints create table, table name 
create table purchase_orders (
po_nr number not null,
vendor_id number not null,
po_status number not null,
create_at timestamp not null,
constraint pk_purchase_orders Primary key(po_nr)
);
desc purchase_orders;

create table purchase_order_items (
po_nr number not null,
item_nr number not null,
product_id number not null,
quantity number not null,
buy_price number(9,2) not null,
delivery_date date, 
PRIMARY KEY (po_nr, item_nr)
);
desc purchase_order_items;


create table vendors (
vendor_id number,
vendor_name varchar2(255) not null,
address varchar2 (255) not null
);
desc vendors;
alter table vendors 
add constraint pk_vendors PRIMARY KEY(vendor_id);

alter table vendors
drop constraint pk_vendors;
--drop primary key; also drops constraint from above

alter table vendors
disable constraint pk_vendors;

alter table vendors
enable constraint pk_vendors;

create table supplier_groups (
group_id number,
group_name varchar(255) not null,
primary key (group_id)
);
desc supplier_groups;
select * from supplier_Groups;

insert into supplier_groups (group_id, group_name)
values ('1','ji')



--
create table suppliers (
supplier_id number,
supplier_name varchar2(255),
group_id number not null,
primary key (supplier_id),
foreign key(group_id) references supplier_groups(group_id)
);
desc suppliers;

select * from suppliers;
insert into suppliers 
values (1, 'jihun', '1')


--check constraint
create table parts (
part_id number not null, --unique,
part_name varchar2 (255) not null,
buy_price number (9,2) constraint check_positive_buy_price
check(buy_price > 0),
primary key(part_id)
);
desc parts;
select * from parts;

insert into parts(part_id, part_name, buy_price)
values (1,1,1)

alter table purchase_order_items add constraint 
check_positive_qty CHECK(quantity>0);

--
insert into parts(part_id, part_name, buy_price)
values (3,2,-1)


--
create table new_orders (
id number not null,
order_no number not null,
order_date date default sysdate
);
desc new_orders;
select * from new_orders

insert into new_orders (id, order_no)
values(1,10);

--
alter table persons
modify phone default 999;

select * from persons;
alter table persons 
add constraint dp_phone 
default '999' for phone;


--all employees which are sales manager also manager of other employees


select employee_id, first_name, last_name, oi.manager_id,
(select first_name||' '||last_name "Name" from employees where employee_id = oi.manager_id)
from employees oi
where job_title = 'Sales Manager';

select * from employees e where job_title = 'Sales Manager' --this is correct
and employee_id in (SELECT manager_id from employees);


--
select * from employees where first_name = 'Alex';

select employee_id, first_name, hire_date from employees
where hire_date between '18-MAY-16' and current_date;

--
select distinct salesman_id from orders
where salesman_id in
(select employee_id from employees 
where hire_date between '18-MAY-16' and current_date);

--
select * from orders where salesman_id in 
(select employee_id from employees 
where hire_date between '18-MAY-16' and current_date);


--prod-id 160-170
--what all customers
--what all employees placed orders
--what all warehouses contains products 
--how many orders will these products are shpped, are pending, are canceled
select * from products where product_id between 160 and 170;

--wht all customers
select * from customers;
select * from order_items;
select * from employees;

select distinct customer_id from customers
where customer_id in
(select product_id from products 
where product_id between 160 and 170);

select name from customers c
inner join orders o using(customer_id)
inner join order_items oi using(order_id)
where product_id between 160 and 170 
group by name;

select name, customer_id  from customers c
inner join orders o using(customer_id)
inner join order_items oi using(order_id)
where product_id between 160 and 170 
group by name, customer_id;



--what all employees placed
select * from inventories;

select * from employees a
where employee_id in (select salesman_id from orders);

--what all warehouse contain these products.
select distinct(warehouse_id) from inventories
where product_id between 160 and 170




--how many orders with these products
--are shipped, pending, are canceled
select * from orders;
select distinct(order_id) from orders a
inner join order_items b using(order_id)
where product_id between 160 and 170 and 
status = 'Pending';

select distinct(order_id) from orders a
inner join order_items b using(order_id)
where product_id between 160 and 170 and 
status = 'Canceled';

select distinct(order_id) from orders a
inner join order_items b using(order_id)
where product_id between 160 and 170 and 
status = 'Shipped';


--customer 300-320
select * from customers where customer_id between 1 and 50;

--^ their contacts details -> not null email
select * from contacts where customer_id between 1 and 50;

--^credit limit > 500
select * from customers where customer_id between 1 and 50
and
credit_limit < 500;

--^ how many orders are placed

select * from orders where customer_id between 1 and 50;

-- how many diff products are ordered

select * from products;
select * from order_items;

select distinct(product_id) from orders
inner join order_items oi using(order_id)
where customer_id between 1 and 50;

-- how many employees have placed orders
select * from employees;
select * from orders;
select * from customers;

select * from employees a
where employee_id in (select salesman_id from orders);

-- how many of these orders shipped, cancelled, pen
select * from orders;

select * from orders 
where customer_id between 1 and 50
and status = 'Pending';

select * from orders 
where customer_id between 1 and 50
and status = 'Shipped';

select * from orders 
where customer_id between 1 and 50
and status = 'Canceled';

--what allwarehouse, have these products;
select distinct(warehouse_id) from prodcuts;

select * from products;
select * from warehouses;



--total amount(quantity * unit price) for each customers

select * from customers;
--customer_id 
select * from order_items;
--order_id, item_id, product_id, quantity, unit_price
select * from orders;
--customer_id, order_id

select customer_id, sum(quantity*unit_price) from order_items a
inner join orders b using(order_id)
inner join customers c using(customer_id)
where customer_id between 1 and 50
group by customer_id;

--How many employees report to each manager employee id, manager, id mgr name,
select * from employees;

select count(employee_id), oi.manager_id,
(select first_name||' '||last_name "Name" from employees where employee_id = oi.manager_id)
from employees oi
group by manager_id;

--print employee name, employee id, managerid, mgr name

select concat(first_name, last_name),employee_id, oi.manager_id,
(select first_name||' '||last_name "Name" from employees where employee_id = oi.manager_id)
from employees oi
group by concat(first_name, last_name),employee_id, manager_id
order by manager_id;


--how many employees are each job title

select count(job_title), job_title from employees
group by job_title;

--orders placed by employees hired 2016

select * from orders;
--orderid, customerid salesmanid
select * from employees;
--employeeid hiredate

select * from employees a
where employee_id in (select salesman_id from orders) and
hire_date between '01-JAN-16' and '31-DEC-16'; --wrong


select * from orders where salesman_id in 
(select employee_id from employees where hire_date 
between '01-JAN-16' and '31-DEC-16');


--write a query to list all the employees that join in 2016?

select * from employees
where hire_date between '01-JAN-16' and '31-DEC-16';

--add another column to test

select * from test;

ALTER TABLE test
ADD address varchar(255)

--write a script to create a table - 
--student with student_id <number> as primary key , 
--first_name <varchar> not null, last_name<varchar> , 
--date_of_birth<date> not null.

create table studentss (
student_id NUMBER NOT NULL,
FIRST_NAME  VARCHAR(50) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
date_of_birth date not null,
PRIMARY KEY(student_id)
);
select * from studentss;



--Write a query to get employee with second highest salary from the employees table.


select max(credit_limit) from customers
where
credit_limit not in 
(select max(credit_limit) from customers);

--Write a script to add a check constraint to Student table to check the length of address is greater than 10.
alter table studentss
add constraint 
check_addresss CHECK(len(address)>10);

--Write a script to make the first name of Student table as nullable.
alter table studentss
MODIFY first_name VARCHAR(50) NULL

--
select SUBSTR('Collabera', 2, 6) from dual;

--email from employees with only 'example.com

select * from employees
where email like '%example.com'

--email that starts with elli

select * from employees
where email like 'elli%';

--contains word son email from employees
select * from employees
where email like '%son%'

--how many email @ sign.

select * from employees
where email like '%@%'

--how many emails end with rgv.com

select * from contacts
where email like '%rgy.com';


--Customers who placed more than ten orders
select * from customers;
select * from orders;
select * from order_items;

select customer_id, count(customer_id) from orders
group by customer_id
having count(customer_id) = 5;

--Write a script to insert data in student table.

insert into studentsss (student_id, first_name, last_name, date_of_birth)
values ('5', 'jihun','park','06-MAR-92')

--Write a query to get the list of employees that are not managers of any employees in employees table?
select employee_id, concat(first_name, last_name) from employees  --gets all data
minus
select employee_id, concat(first_name, last_name) from employees --all data
where employee_id in (select manager_id from employees);   


--Write  a query to update manager_id to 99 in employee table where hire_date is before 1st jan 2016

update employees set manager_id = 99
where hire_Date < to_date('01-JAN-16','DD-MON-YY')
 


--write a query to find the sum of amount (quantity * unit_price) for each order_id in order_items table.
select * from order_items;

select sum(quantity * unit_price), order_id from order_items
group by order_id;


--Write a query to get the amount of all orders group by product_id along with product name?
--using order_items, orders and products table.

select * from order_items;
--order_id, item_id, product_id, unit_price, quantity
select * from orders;
--order_id, customer_id, salesman_id
select * from products;
--product_id

select product_id, product_name, order_id, (quantity * unit_price)  from order_items
inner join orders b using(order_id)
inner join products c using(product_id)
group by product_id, product_name;


--Write a query to select distinct last name from contacts tables and  order by first name.
select Distinct last_name, first_name from contacts
order by first_name;


--Write a query to get  the date of the next friday?

SELECT NEXT_DAY('20-DEC-19','FRIDAY') from dual; 
--NEXT_DAY returns the date of the first weekday named by char that is later than the date date


--Write a script to create a view with column as 
--order_id, order_date, item_id, product_name, 
--Quantity, Unit_price, customer_id, 
--customer_name, email, address for the data where product_id is between 1 to 10

create or replace view assessment
as
select order_id, order_date, item_id, product_name, quantity, unit_price, customer_id
customer_name, email, address from orders a
inner join customers b using(customer_id)
inner join order_items c using(order_id)
inner join products d using(product_id)
inner join contacts e using(customer_id)

where product_id between 1 and 10;

select * from assessment;

--Write a query to get the amount of all orders group by product_id along with product name?
--using order_items, orders and products table.


--how many products are ordered but dont have inventories

select * from products;

select * from inventories;
--qty, prodid
select * from order_items;
--qty, productid, itemid, orderid
select * from orders;


select product_id from order_items
minus
select product_id from inventories;

--orders that are ordered before the employee joined
select * from order_items;

select order_id from employees a
inner join orders b on b.salesman_id = a.employee_id
where hire_date > order_date;


--shipped order placed by employee higher than nov 2016
select * from employees;
select * from orders;

select * from orders a
inner join employees b on b.employee_id = a.salesman_id
where
hire_date between '01-NOV-16' and '30-NOV-16'
and status = 'Shipped'





