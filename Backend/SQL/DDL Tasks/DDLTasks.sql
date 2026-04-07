--Task 1
--Create a database for an online store, then start working inside it.
create database online_store;
use online_store;
--Task 2
--You need a table to store users. Each user must have an ID that identifies them uniquely, and a name.
create Table Users (
id int  primary Key identity ,
  [name] NVARCHAR(50),
);
--Task 3 
--Extend the users table so that each user has an email. This email should not be repeated between users.
Alter Table Users 
ADD  email NVARCHAR(50) unique ;
--Task 4
--Make sure that the email in the users table cannot be left empty.
--هون في constraint  بمنع خذفته بعدين عدلت على العامود
ALTER TABLE Users DROP CONSTRAINT UQ__Users__AB6E6164F8FB7D15;
Alter Table Users 
alter column email NVARCHAR(50)  not null ;
--Task 5 
--Create a table for products. Each product should have a name and a price. Choose a suitable data type 
--for storing money values.
Create  table  Products(
id int primary key identity,
[name] varchar(20) ,
price DECIMAL(18, 2) 
);
--Task 6
--Ensure that every product must have a price (it cannot be missing).
ALTER TABLE Products
ALTER COLUMN price DECIMAL(18,2) NOT NULL;
--Task 7
--Create a table for orders. Each order must belong to a user. Think about how to enforce this relationship.
--one - many 
create table orders (
id int primary key identity,
userId int NOT NULL,
FOREIGN KEY (userId) REFERENCES Users (id)
);
--Task 8 , TASK 9
--Add a column to store the date of the order.
--Make the order date automatically filled if no value is provided.
Alter Table orders 
ADD orderDate date DEFAULT GETDATE() ;
--Task 10
--Create a table to represent products inside orders. Each product should not appear twice in the same order.
CREATE TABLE OrderItems (
id int primary key identity ,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(18, 2) NOT NULL, 
    CONSTRAINT FK_OrderItems_orders FOREIGN KEY (OrderId) REFERENCES orders(id),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductId) REFERENCES Products(id)
); 
--Task 11
--Create a table for categories, then link products to categories so that each product belongs to one category.
create TABLE categories (
id int primary key ,
[name] varchar(20) not null
);
Alter Table Products
ADD categoryId int not null ;
ALTER TABLE Products 
ADD CONSTRAINT FK_Products_Categories 
FOREIGN KEY (categoryId) REFERENCES categories(id);
--Task 12
--Create a table for employees where an employee can have a manager from the same table.
--Self-Referencing Relationship
CREATE TABLE Employees (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    ManagerId INT NULL, 
    CONSTRAINT FK_Employee_Manager FOREIGN KEY (ManagerId) 
    REFERENCES Employees(Id)
);
--Task 13
--Add a phone column to the users table, then remove it again.
--ADD
ALTER TABLE Users 
ADD phone varchar(10) ;
--REMOVE
ALTER TABLE Users 
DROP column phone ;
--task 14
--Increase the size of the name column in the users table.
Alter Table Users 
Alter column [name] NVARCHAR(100)
--Task 15
--Create a table for customers where the name is required but the phone is optional.
create table Customers (
id int primary key identity,
[name] varchar(30) not null,
phone nvarchar(13) );
--Task 16
--Create a table for payments where each payment must be linked to an order.
create table Payments 
(id int primary key identity ,
PaymentMethod NVARCHAR(50) NOT NULL,
OrderId INT NOT NULL,
CONSTRAINT FK_Payments_Orders FOREIGN KEY (OrderId) REFERENCES orders(id)
);
--task 17
--Create a table for students where each student must have a unique identifier and a name.
create table students (
id int primary key identity,
[name] varchar(30));
--task 18
--Create a table for courses with a title.
create table courses (
id int primary key identity,
title varchar(30));
--task 19
--Students can take multiple courses. Design a table to represent this relationship.
create table StudentCourses 
(
id int primary key identity,
studentId int not null,
courseId int not null,
constraint student_course_fk  foreign key (studentId)
references Students (id),
constraint student_course_fk1  foreign key (courseId)
references courses (id));
--TASK 20
--Create a table to store logs with a message and a timestamp.
CREATE TABLE SystemLogs (
    id INT PRIMARY KEY IDENTITY(1,1),
    [Message] NVARCHAR(MAX) NOT NULL, 
    LogTimestamp DATETIME NOT NULL DEFAULT GETDATE() 
);
--Task 21
--Remove all data from the logs table in a fast way without deleting the table.
TRUNCATE TABLE SystemLogs;
--task 22
--You need to completely remove a column from an existing table because it is no longer needed.
Alter Table Products
Drop column price;
--task 23
--Completely delete a table from the database.
DROP TABLE Customers;
--TASK 24
--Create a table where the ID is automatically generated.
create table Customers (
id int primary key identity,
 );
 --TASK 25
 --Create a table with two columns: one must always have a value, and the other can be empty.
 CREATE TABLE Books (
 id int primary key identity ,
 creationDate date default GetDate() ,
 author varchar(20));
 --task 26
 --Create a simple table for books with title and price.
  CREATE TABLE Book (
 id int primary key identity ,
 title nvarchar(20) ,
 price decimal(10,2),
 creationDate date default GetDate() ,
);
--task 27
--Create a table for authors and link it with books.
  CREATE TABLE authors (
 id int primary key identity ,
 fullname nvarchar(30) not null,

);
--many to many
CREATE TABLE AuthorBooks (
id int primary key identity,
AuthorId INT NOT NULL,
 BookId INT NOT NULL,
 FOREIGN KEY (AuthorId) REFERENCES authors(id),
 FOREIGN KEY (BookId) REFERENCES Book(id)
);
--task 28
--Create a table that only stores IDs.
CREATE TABLE IDS (
    id INT PRIMARY KEY
);
--task 29
--Create a table that includes number, text, and date columns.
CREATE TABLE DemoTable (
    ID INT PRIMARY KEY IDENTITY(1,1), 
    CodeNumber INT NOT NULL,          
    DescriptionText NVARCHAR(255),   
    CreationDate DATETIME DEFAULT GETDATE() ,
    ISACTIVE BIT DEFAULT 1
);
--TASK 30
--Create a table first, then later make one of its columns unique.
CREATE TABLE Inventory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductCode NVARCHAR(20) NOT NULL, 
    ProductName NVARCHAR(100),
    Quantity INT DEFAULT 0
);
--ADD CONSTRAINT
ALTER TABLE Inventory
ADD CONSTRAINT UQ_ProductCode UNIQUE (ProductCode);

--OPTINAL TASKS
--TASK 1
--Create a new database for testing, then delete it.
CREATE database Test ;
DROP DATABASE Test;
--TASK 2
--Create a table for products with name and price.
CREATE database Test_1 ;
use Test_1;
Create  table  Products(
id int primary key identity,
[name] varchar(20) ,
price DECIMAL(18, 2) 
);
--task 3
--Add a new column for description to the products table.
Alter table Products
ADD description VARCHAR(150) ;
--TASK 4
--Delete the products table.
DROP TABLE Products;
--TASK 5
--Create a table with only one column.
Create  table  Products(
id int primary key identity,
);
--TASK 6
--Create a temporary table and delete it immediately.
CREATE TABLE #TempProducts (
    id INT PRIMARY KEY,
    [name] NVARCHAR(50)
);
DROP TABLE #TempProducts;
--TASK 7
--Create a table, then remove all its data but keep its structure.
CREATE TABLE TempData (
    id INT PRIMARY KEY IDENTITY(1,1),
    info NVARCHAR(100),
    createdAt DATETIME DEFAULT GETDATE()
);
--بتمر عليهم مره وحدة 
TRUNCATE TABLE TempData;
--TASK 8
--Create a table where email must be unique and not empty.
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
);
--TASK 9
--Create a table where price must always exist.
Create  table  Books(
id int primary key identity,
price decimal(10,2) not null
);
--task 10
--Create a table that includes: unique ID, required field, and a field that must not be duplicated.
CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1), 
    FullName NVARCHAR(100) NOT NULL, 
    NationalID NVARCHAR(20) NOT NULL UNIQUE, 
    HireDate DATE NOT NULL DEFAULT GETDATE()
);