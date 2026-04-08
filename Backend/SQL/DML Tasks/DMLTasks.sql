--DML TASKS

--Step 1 — Database Setup
CREATE DATABASE StoreDB;

USE StoreDB;

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Age INT
);

CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY,
    UserId INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);
--TASK 1
INSERT INTO Users 
VALUES ('Ahmad','ahmad@gmail.com',25),
('Ali','ali@gmail.com',30),
('Sara','sara@gmail.com',22);
--TASK 2
ALTER TABLE Orders 
ADD CONSTRAINT Users_orders_fk foreign key  (UserId)
references Users (Id);

INSERT INTO Orders 
VALUES(1,'Laptop',800),
(2,'Phone',500),
(1,'Mouse',20),
(3,'Keyboard',50);
--Task 3
insert into Users (Name , Age )
values ('Omar',28);
--Task 4
 update Users 
 set Email ='sara_new@gmail.com'
 where Id =3;
 --Task 5
 update Orders
 set Price += 10;
 --Task 6
 update Users
 set Name='Ali Ahmad'
 where Id = 2;
 --Task 7
   
 delete from Users
 where Id = 4;
 --task 8
 delete from Orders 
 where Price < 50 ;
 --task 9
 delete from Orders 
 where UserId = 3 ;
 --task 10
 select * from Users;
 --task 11
 select Name ,Email from Users;
 --task 12
 select * from Users
 where Age > 25;
 --task 13
  select * from Users
 where Name like 'A%';
 --TASK 14
  select * from Users
 where Email = null;
 --Task 15
   select * from Orders
 where Price  between 50 and 800;
 --task 16
 select * from Orders
 where ProductName = 'Phone';
 --task 17
 select * from Orders
 order by Price Desc;
 --task 18
   select * from Users
 where Age < 30 order by Name;
 --task 19
 select * from Orders
 where UserId=1 and price > 100;
 --task 20
  select * from Users
 where Age between  20 and 30  and Name like '%a%';