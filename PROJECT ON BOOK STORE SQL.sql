--PROJECT ON BOOK STORE

create table books(
       Book_ID serial primary key,
	   Title varchar(100),
	   Author varchar(100),
	   Genre varchar(50),
	   Published_Year int,
	   Price numeric(10,2),
	   Stock int
);

-- create customers table
create table customers(
          Customer_ID serial primary key,
		  Name varchar(100),
		  Email varchar(100),
		  Phone varchar(15),
		  City Varchar(50),
		  Country varchar(150)
);

--Create table orders
create table orders(
           Order_id serial primary key,
		   Customer_ID int References customers(customer_id),
		   Book_ID int references Books(Book_ID),
		   Order_Date Date,
		   Quantity int,
		   Total_Amount Numeric(10,2)
);
--as we uses foreign key in order table so if we want to drop books table first we have to first drop order table

select * from Books;
select * from Customers;
select * from Orders;


--Import data into books table by using direct import

--1) Retrieve all books in "fiction" genre:
select *
from Books
where genre='Fiction';

--2)Find books published after the year 1950 :
select * from Books
where published_year>1950;

--3) List all customers from Canada :
select * from customers
where country='Canada';


--4) Show orders placed in november 2023:
select* from orders
where order_date between '2023-11-01' and '2023-11-30';


--5) Retrieve the total stock of books available:
select sum(stock)as total_stock
from Books;


--6)Find the most expensive book:
select *from Books
order by price desc
limit 1;


--7) Show all customers who ordered more or one quantity of book:
select * from orders
where quantity>1;


--8)Retrieve all orders where the total amount exceed $20 :
select * from orders
where total_amount>20;


--9)List all the genre available in the books table :
select distinct(genre)
from books;

--10) Find the book with the lowest stock;
select* from books
order by stock 
limit 1;


--11) Calculate the total revenue generated from all orders :
select sum(total_amount) as Revenue
from orders ;

--1)Retrieve the total numbers of books sold for each genre :
select b.genre,sum(o.quantity) as total_books_Sold
from orders o
join books b 
on o.book_id=b.book_id
group by b.genre;

--2)Find the average price of books in the "fantasy" genre:

select Avg(price) as avg_price
from Books
where genre='Fantasy';


--3)List customers who have placed atleast two orders :
select o.customer_id,c.name,count(o.order_id) As order_count
from orders o
join customers c
on o.customer_id=c.customer_id
group by o.customer_id,c.name
having count(order_id)>=2;

--4)Find the most frequently ordered book :

select b.title,o.book_id,count(o.order_id) as order_count
from orders o
join Books b
on o.book_id =b.book_id
group by o.book_id,b.title
order by order_count Desc
limit 1;

--5)Show the top 3 most expensive books by fantasy genre :
select* from Books
where genre='Fantasy' 
order by price desc
limit 3

--6)Retrieve the total quantity of books sold by easch author :

select b.author,sum(o.quantity) AS total_books_sold
from orders o
join Books b
on o.book_id=b.book_id
group by b.author;

--7)List the cities where customers who spent over $30 are located :
select distinct c.city,o.total_amount
from orders o
join customers c
on o.customer_id=c.customer_id
where o.total_amount>30;

--8) Find the customers who spent most on orders :
select c.customer_id ,c.name,sum(o.total_amount) AS Total_spent
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_id,c.name
order by Total_spent desc
limit 1;

--9) Calculate the stock remaining after fulfilling all orders :
select b.book_id,b.title,b.stock,coalesce(sum(quantity),0) AS order_quantity,
       b.stock-coalesce(sum(quantity),0) AS Remaining_quantity
from books b
left join orders o
on b.book_id=o.book_id
group by b.book_id
order by b.book_id;
