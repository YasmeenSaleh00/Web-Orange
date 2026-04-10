--   E-Commerce Database
CREATE DATABASE e_commerce;
Use e_commerce;
-- Create Tables
-- lookups tables 
CREATE TABLE LookupTypes
(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(20) NOT NULL,
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL
);
CREATE TABLE LookupItems 
(
Id INT PRIMARY KEY IDENTITY,
[Value] VARCHAR(20) NOT NULL,
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
LookupTypeId INT NOT NULL,
FOREIGN KEY (LookupTypeId) REFERENCES LookupTypes (Id)
);
--SEED DATA IN LOOKUPTYPE TABLE
INSERT INTO LookupTypes ([Name])
VALUES('Gender'),
('CustomerStatus'),
('ProductStatus'),
('OrderStatus'),
('PaymentMethods'),
('PaymentStatus');
--SEED DATA IN LOOKUP ITEMS TABLE
INSERT INTO LookupItems ([Value], [LookupTypeId])
VALUES 
('Male', 1), 
('Female', 1),
('Active', 2), 
('Blocked', 2),
('Available', 3), 
('Out of Stock', 3), 
('Pending', 4), 
('Processing', 4),
('Shipped', 4), 
('Delivered', 4), 
('Cancelled', 4),
('Cash', 5), 
('Credit Card', 5), 
('PayPal', 5),
('Pending', 6),
('Paid', 6), 
('Failed', 6);
--CREATE ROLE TABLE 
CREATE TABLE Roles
(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(20) NOT NULL UNIQUE ,
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL
);
--ADD DATA
INSERT INTO Roles([Name])
VALUES ('Super Admin'),
('Store Manager'),
('Content Manager'),
('Order Manager');
--CREATE Permissions TABLE
CREATE TABLE [Permissions] (
 Id INT PRIMARY KEY IDENTITY(1,1),
 [Name] NVARCHAR(100) NOT NULL UNIQUE, 
 [Description] NVARCHAR(255),
 IsDeleted BIT DEFAULT 0,
 CreationDate DATE DEFAULT GETDATE(),
 ModificationDate DATE DEFAULT NULL,
);
--APLLIED MANY TO MANY REALTION
CREATE TABLE RolePermissions (
Id INT PRIMARY KEY IDENTITY,
RoleId INT NOT NULL,
PermissionId INT NOT NULL,
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
FOREIGN KEY (RoleId) REFERENCES Roles(Id),
FOREIGN KEY (PermissionId) REFERENCES Permissions(Id)
);

--CREATE USERS TABLE (STAFF)
CREATE TABLE Users 
(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL UNIQUE CHECK (Email LIKE '%_@_%._%'),
Phone VARCHAR(14) NOT NULL UNIQUE CHECK (Phone LIKE '07[789][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
OR Phone LIKE '+9627[789][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
[Password] VARCHAR(10) NOT NULL CHECK (LEN([Password]) BETWEEN 8 AND 10),
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
RoleId INT NOT NULL,
GenderId INT NOT NULL,
FOREIGN KEY (RoleId) REFERENCES Roles(Id),
FOREIGN KEY (GenderId) REFERENCES LookupItems(Id),
);
--CREATE TABLE CATEGORIES 
CREATE TABLE Categories (
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL UNIQUE ,
[Description] VARCHAR(200) ,
[Image] VARCHAR(max)  DEFAULT NULL,
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
UserId INT NOT NULL,
FOREIGN KEY (UserId)  REFERENCES Users (Id)
);
--CREATE TABLE BRANDS
CREATE TABLE Brands (
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL UNIQUE ,
[Image] VARCHAR(max)  DEFAULT NULL,
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
UserId INT NOT NULL,
FOREIGN KEY (UserId)REFERENCES Users (Id)
);
--CREATE TABLE PRODUCT
CREATE TABLE Products 
(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL UNIQUE ,
[Image] VARCHAR(max)  DEFAULT NULL,
Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
Quantity  INT NOT NULL CHECK( Quantity >0),
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
ProductStatusId INT NOT NULL,
UserId INT NOT NULL,
BrandId INT NOT NULL,
CategoryId INT NOT NULL,
FOREIGN KEY (ProductStatusId) REFERENCES LookupItems (Id),
FOREIGN KEY (UserId)REFERENCES Users (Id),
FOREIGN KEY (BrandId) REFERENCES Brands (Id),
FOREIGN KEY (CategoryId) REFERENCES Categories (Id)
);
--CREATE TABLE Customers
CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE CHECK (Email LIKE '%_@_%._%'),
Phone VARCHAR(14) NOT NULL UNIQUE CHECK (Phone LIKE '07[789][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
OR Phone LIKE '+9627[789][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
[Password] VARCHAR(10) NOT NULL CHECK (LEN([Password]) BETWEEN 8 AND 10),
IsDeleted BIT DEFAULT 0,
CreationDate DATE DEFAULT GETDATE(),
ModificationDate DATE DEFAULT NULL,
CustomerStatusId INT NOT NULL,
GenderId INT NOT NULL,
FOREIGN KEY (CustomerStatusId) REFERENCES LookupItems(Id),
FOREIGN KEY (GenderId) REFERENCES LookupItems(Id),
);
--CREATE TABLE CART
CREATE TABLE Cart (
 Id INT PRIMARY KEY IDENTITY,
 IsDeleted BIT DEFAULT 0,
 CreationDate DATE DEFAULT GETDATE(),
 ModificationDate DATE DEFAULT NULL,
 CustomerId INT NOT NULL UNIQUE,
  FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
);
CREATE TABLE CartItems (
    Id INT PRIMARY KEY IDENTITY,
    CartId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL, 
    IsDeleted BIT DEFAULT 0,
    CreationDate DATE DEFAULT GETDATE(),
    ModificationDate DATE DEFAULT NULL,
    FOREIGN KEY (CartId) REFERENCES Cart(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
--CREATE TABLE Orders
CREATE TABLE Orders (
 Id INT PRIMARY KEY IDENTITY,
 TotalPrice DECIMAL(18, 2) NOT NULL DEFAULT 0, 
 ShippingAddres VARCHAR(100) NOT NULL,
 Note VARCHAR(MAX) ,
 DeliveryDATE DATE ,
 IsDeleted BIT DEFAULT 0,
 CreationDate DATE DEFAULT GETDATE(),
 ModificationDate DATE DEFAULT NULL,
 OrderStatusId INT NOT NULL,
 PaymentMethodId INT NOT NULL,
 PaymentStatusId INT NOT NULL,
 CustomerId INT NOT NULL,
 FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
 FOREIGN KEY (OrderStatusId) REFERENCES LookupItems (Id),
 FOREIGN KEY (PaymentMethodId) REFERENCES LookupItems (Id),
 FOREIGN KEY (PaymentStatusId) REFERENCES LookupItems (Id)
);
--CREATE TABLE ORDERITEMS
CREATE TABLE OrderItems
(
 Id INT PRIMARY KEY IDENTITY,
 Quantity  INT NOT NULL ,
 ProductId INT NOT NULL,
 OrderId INT NOT NULL,
 IsDeleted BIT DEFAULT 0,
 CreationDate DATE DEFAULT GETDATE(),
 ModificationDate DATE DEFAULT NULL,
  FOREIGN KEY (ProductId) REFERENCES Products(Id),
 FOREIGN KEY (OrderId) REFERENCES Orders(Id)
 );
 --CREATE TABLE WISHLIST
 CREATE TABLE Wishlist
 (
  Id INT PRIMARY KEY IDENTITY,
   IsDeleted BIT DEFAULT 0,
 CreationDate DATE DEFAULT GETDATE(),
 ModificationDate DATE DEFAULT NULL,
  CustomerId INT NOT NULL UNIQUE,
 FOREIGN KEY (CustomerId) REFERENCES Customers (Id),

 );
 --applay m-m product - wishlist
 CREATE TABLE WishlistItems (
    Id INT PRIMARY KEY IDENTITY,
    IsDeleted BIT DEFAULT 0,
    CreationDate DATE DEFAULT GETDATE(),
    ModificationDate DATE DEFAULT NULL,
    WishlistId INT NOT NULL,
    ProductId INT NOT NULL,
    FOREIGN KEY (WishlistId) REFERENCES Wishlist(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
--CREATE TABLE REVIEW
CREATE TABLE Reviews
(
  Id INT PRIMARY KEY IDENTITY,
  Rating INT NOT NULL CHECK(Rating BETWEEN 1 AND 5),
  Comment VARCHAR(MAX) ,
  IsDeleted BIT DEFAULT 0,
    CreationDate DATE DEFAULT GETDATE(),
    ModificationDate DATE DEFAULT NULL,
    ProductId INT NOT NULL,
    CustomerId INT NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id)
);
--FUNCTIONS
-- 1 Function to Add roles
CREATE PROCEDURE AddRoles
@Name AS VARCHAR(100) 
AS
BEGIN
INSERT INTO Roles([Name])
VALUES (@Name) 
END;
EXEC AddRoles @Name='User Manager';
-- 2 Function to Add Permissions

CREATE PROCEDURE AddPermissions
@Name AS VARCHAR(100) , 
@Description AS VARCHAR(255) 
AS
BEGIN
INSERT INTO [Permissions] ([Name],[Description])
VALUES (@Name ,@Description) 
END;
EXEC AddPermissions @Name = 'Product_Create', @Description = 'Allows adding new products to the catalog';
EXEC AddPermissions @Name = 'Product_Edit', @Description = 'Allows modifying existing product details and prices';
EXEC AddPermissions @Name = 'Product_Delete', @Description = 'Allows soft-deleting products from the store';
EXEC AddPermissions @Name = 'Category_Manage', @Description = 'Allows creating and organizing product categories';
EXEC AddPermissions @Name = 'Order_Manage', @Description = 'Allows creating and organizing product categories';

-- 3 Function To Add Permession to Roles
CREATE PROCEDURE AddPermissionsToRole
@RoleId AS INT , 
@PermissionId AS INT 
AS
BEGIN
INSERT INTO RolePermissions(RoleId,PermissionId)
VALUES (@RoleId ,@PermissionId) 
END;
EXEC AddPermissionsToRole @RoleId = 1, @PermissionId = 1; 
EXEC AddPermissionsToRole @RoleId = 1, @PermissionId = 2; 
EXEC AddPermissionsToRole @RoleId = 1, @PermissionId = 3; 
EXEC AddPermissionsToRole @RoleId = 2, @PermissionId = 4; 
EXEC AddPermissionsToRole @RoleId = 4,@PermissionId = 1;
-- 4 Function to Add new User
CREATE PROCEDURE AddNewUser
    @FirstName VARCHAR(20),
    @LastName VARCHAR(20),
    @Email VARCHAR(30),
    @Phone VARCHAR(14),
    @Password VARCHAR(10),
    @RoleId INT,
    @GenderId INT
AS
BEGIN
    INSERT INTO Users (
        FirstName, 
        LastName, 
        Email, 
        Phone, 
        [Password], 
        RoleId, 
        GenderId
    )
    VALUES (
        @FirstName, 
        @LastName, 
        @Email, 
        @Phone, 
        @Password, 
        @RoleId, 
        @GenderId
    );
END;

EXEC AddNewUser 
    @FirstName = 'Yasmeen', 
    @LastName = 'Saleh', 
    @Email = 'yasmeen@gmail.com', 
    @Phone = '0790000000', 
    @Password = 'Pass1234', 
    @RoleId = 1,    
    @GenderId = 2;  
--5- function to update user
CREATE PROCEDURE UpdateUserProfile
    @UserId INT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @Phone NVARCHAR(20) = NULL,
    @Email NVARCHAR(100) = NULL,
    @Password NVARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE Users
    SET 
        FirstName = ISNULL(@FirstName, FirstName),
        LastName = ISNULL(@LastName, LastName),
        Phone = ISNULL(@Phone, Phone),
        Email = ISNULL(@Email, Email),
        Password = ISNULL(@Password, Password),
        ModificationDate = GETDATE() 
    WHERE Id = @UserId AND IsDeleted = 0; 
END;
EXEC UpdateUserProfile @UserId = 1, @FirstName = 'Yasmeen', @Email = 'yasmeen@gmail.com' ,@Password='yasmeen147';
-- 6 -Applay softDelet on User
CREATE PROCEDURE UpdateUserStatus
    @UserId INT
    AS
    BEGIN
    UPDATE Users
    SET IsDeleted = 1
    WHERE Id = @UserId;
    END;
EXEC UpdateUserStatus @UserId = 1;
-- 7 -- GET ALL USERS 
CREATE PROCEDURE GetAllUsers
As
BEGIN
SELECT U.Id, U.FirstName + ' '+ U.LastName AS 'FullName' ,U.Email ,U.Phone, L.Value AS 'Gender',R.Name AS 'RoleName'
FROM Users U 
JOIN LookupItems L ON U.GenderId = L.Id
JOIN Roles R ON U.RoleId = R.Id;
END;
EXEC GetAllUsers;
-- 8- Get User by Id
CREATE PROCEDURE GetUserById
@UserId INT
As
BEGIN
SELECT U.Id, U.FirstName + ' '+ U.LastName AS 'FullName' ,U.Email ,U.Phone, L.Value AS 'Gender',R.Name AS 'RoleName'
FROM Users U 
JOIN LookupItems L ON U.GenderId = L.Id
JOIN Roles R ON U.RoleId = R.Id
WHERE U.Id = @UserId;
END;
EXEC GetUserById @UserId = 4;
-- 9 - Add category 
CREATE PROCEDURE AddNewCategory
    @Name VARCHAR(50),
    @Description VARCHAR(200),
    @Image VARCHAR(MAX) =NULL,
    @UserId INT
AS
BEGIN
    INSERT INTO Categories (
        [Name],
        [Description],
        [Image] ,
        UserId
    )
    VALUES (
        @Name,
        @Description,
        @Image,
        @UserId
    );
END;

EXEC AddNewCategory 
    @Name = 'Electronics', 
    @Description = 'Laptops, Smartphones, and Gadgets', 
    @Image = 'https://thumbs.dreamstime.com/b/electronics-store-flat-design-long-shadow-glyph-icon-household-equipment-online-shop-category-small-major-domestic-appliance-187368856.jpg', 
    @UserId = 1; 
-- 10 - UPDATE CATEGORY
CREATE PROCEDURE UpdateCategory 
@CategoryId INT ,
@Name VARCHAR(20) =NULL,
@Image VARCHAR(MAX)=NULL ,
@Description VARCHAR(200)=NULL
AS
BEGIN
 UPDATE Categories
    SET 
        Name = ISNULL(@Name, Name),
        Image = ISNULL(@Image, Image),
        Description = ISNULL(@Description, Description),
        ModificationDate = GETDATE() 
        WHERE Id = @CategoryId;
END;
EXEC UpdateCategory 
    @CategoryId = 1, 
    @Description = 'Updated description for electronic devices...';
-- 11 - Apply soft delete on category
CREATE PROCEDURE UpdateCategoryStatus
    @CategoryId INT
    AS
    BEGIN
    UPDATE Categories
    SET IsDeleted = 1
    WHERE Id = @CategoryId;
    END;
    EXEC UpdateCategoryStatus @CategoryId = 1;
 -- 12 - Get ALL CATEGORY
 CREATE PROCEDURE GetAllCategory
    AS
    BEGIN
    SELECT C.Name , C.Description ,C.Image , U.FirstName + ' ' + U.LastName AS 'Created By' 
    FROM Categories C JOIN Users U ON C.UserId = U.Id 
     
    END;
    EXEC GetAllCategory;
-- 13 - Get Category by Id
 CREATE PROCEDURE GetCategoryById
 @CategoryId INT 
    AS
    BEGIN
   SELECT C.Name , C.Description ,C.Image , U.FirstName + ' ' + U.LastName AS 'Created By' 
    FROM Categories C JOIN Users U ON C.UserId = U.Id 
    WHERE C.Id = @CategoryId;
    END;
    EXEC GetCategoryById @CategoryId =1;
-- 14 - ADD BRAND FUNCTION
CREATE PROCEDURE AddNewBrand 
    @Name VARCHAR(50),
    @Image VARCHAR(MAX) = NULL,
    @UserId INT
AS
BEGIN
    INSERT INTO [dbo].[Brands] (
        [Name],
        [Image],
        [UserId]
    )
    VALUES (
        @Name,
        @Image,
        @UserId
    );
END;
EXEC AddNewBrand @Name = 'Nike', @Image = 'https://media.about.nike.com/img/cf68f541-fc92-4373-91cb-086ae0fe2f88/001-nike-logos-swoosh-black.jpg?m=eyJlZGl0cyI6eyJqcGVnIjp7InF1YWxpdHkiOjEwMH0sIndlYnAiOnsicXVhbGl0eSI6MTAwfSwiZXh0cmFjdCI6eyJsZWZ0IjowLCJ0b3AiOjAsIndpZHRoIjo1MDAwLCJoZWlnaHQiOjI4MTN9LCJyZXNpemUiOnsid2lkdGgiOjM4NDB9fX0%3D&s=2ccf91fbf92029b15e52269b857b133aa9a16181d261328f88d034bde75fa23f', @UserId = 1;
EXEC AddNewBrand @Name = 'Samsung', @UserId = 4;
-- 15 - Update Brand function
CREATE PROCEDURE UpdateBrand 
@BrandId INT ,
@Name VARCHAR(20) =NULL,
@Image VARCHAR(MAX)=NULL 
AS
BEGIN
 UPDATE Brands
    SET 
        Name = ISNULL(@Name, Name),
        Image = ISNULL(@Image, Image),
        ModificationDate = GETDATE() 
        WHERE Id = @BrandId;
END;
EXEC UpdateBrand 
    @BrandId = 1, 
    @Name = 'Nike Premium';
--16 - UPDATE Brand Status
CREATE PROCEDURE UpdateBrandStatus
    @BrandId INT
    AS
    BEGIN
    UPDATE Brands
    SET IsDeleted = 1
    WHERE Id = @BrandId;
    END;
    EXEC UpdateBrandStatus @BrandId = 1;
--17 - Get ALL Brands
--18 - Get Brand By Id 