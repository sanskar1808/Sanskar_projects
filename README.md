This project is a Bookstore Management System created using SQL (PostgreSQL).
It simulates a real-world bookstore environment, managing details of books, customers, and their orders, while performing data analysis to extract meaningful business insights.
 
 The purpose of this project is to:
 Understand how relational databases work
 Practice data querying, aggregation, and reporting
 Learn how SQL is used in real-world business problems like sales analysis, customer insights, and inventory management

The database consists of three main tables:

1) Books – stores details of all available books

2) Customers – contains customer information

3) Orders – stores transactions of book purchases

The Orders table connects both Books and Customers using Foreign Keys, representing a realistic relationship between buyers and items.

#) Books Table Columns Explanation:

Book_ID: Unique identifier for each book (Primary Key)
Title: Name of the book
Author: Author of the book
Genre: Type of book (Fiction, Fantasy, Thriller, etc.)
Published_Year: Year of publication
Price: Selling price
Stock: Quantity available in store

#) Customers Table Columns Explanation:

Customer_ID: Unique ID for every customer (Primary Key)
Name: Customer’s full name
Email: Contact email
Phone: Contact number
City / Country: Customer location details

#) Orders Table Columns Explanation:

Order_ID: Unique order number (Primary Key)
Customer_ID: Links to the Customers table (Foreign Key)
Book_ID: Links to the Books table (Foreign Key)
Order_Date: Date of order placed
Quantity: Number of books ordered
Total_Amount: Final bill amount (Quantity × Price)
