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
CREATE PROCEDURE GetAllBrands
AS
BEGIN
SELECT B.Id , B.Name , B.CreationDate , B.Image , U.FirstName +' ' +U.LastName  AS 'Created By'
FROM Brands B JOIN Users U ON B.UserId = U.Id;
END;
EXEC GetAllBrands;
--18 - Get Brand By Id 
CREATE PROCEDURE GetBrandById
@BrandId INT
AS
BEGIN
SELECT B.Id , B.Name , B.CreationDate , B.Image , U.FirstName +' ' +U.LastName  AS 'Created By'
FROM Brands B JOIN Users U ON B.UserId = U.Id
WHERE B.Id = @BrandId;
END;
EXEC GetBrandById @BrandId = 1;
-- 19 - Add Product 
CREATE PROCEDURE AddProduct
    @Name VARCHAR(50),
    @Image VARCHAR(MAX),
    @Price DECIMAL(10,2),
    @Quantity INT,
    @UserId INT,
    @BrandId INT,
    @CategoryId INT,
    @ProductStatusId INT
AS
BEGIN
    INSERT INTO Products (
        [Name],
        [Image],
        [Price],
        [Quantity],
        [UserId],
        [BrandId],
        [CategoryId],
        [ProductStatusId]
    )
    VALUES (
        @Name,
        @Image,
        @Price,
        @Quantity,
        @UserId,
        @BrandId,
        @CategoryId,
        @ProductStatusId
    );
END;
EXEC AddProduct 
    @Name = 'Samsung Galaxy S24 Ultra', 
    @Image = 'https://example.com/images/s24-ultra.jpg', 
    @Price = 1199.99, 
    @Quantity = 25, 
    @UserId = 1,        
    @BrandId = 3,       
    @CategoryId = 1,   
    @ProductStatusId = 5; 
-- 20 - Update Products
CREATE PROCEDURE UpdateProduct
@ProductId INT,
@BrandId INT = NULL ,
@Name VARCHAR(20) =NULL,
@Image VARCHAR(MAX)=NULL ,
@Price DECIMAL(10,2)=NULL,
@Quantity INT = NULL,
@CategoryId INT = NULL,
@ProductStatusId INT = NULL
AS
BEGIN
 UPDATE Products
    SET 
       Name = ISNULL(@Name, Name),
        Image = ISNULL(@Image, Image),
        Price = ISNULL(@Price, Price),
        Quantity = ISNULL(@Quantity, Quantity),
        BrandId = ISNULL(@BrandId, BrandId),
        CategoryId = ISNULL(@CategoryId, CategoryId),
        ProductStatusId = ISNULL(@ProductStatusId, ProductStatusId),
        ModificationDate = GETDATE()
        WHERE Id = @ProductId;
END;
EXEC UpdateProduct @ProductId =1 , @Image='https://shophuna.com/cdn/shop/files/GalaxyS24Ultratitaniumgray_2_253590c1-26ac-4e70-8f1d-493c391fa4bf.jpg?v=1760999583&width=823';
--21 - GET ALL PRODUCT WITH CATEGORY AND BRAND AND WHO CREATED THEM
CREATE PROCEDURE GetAllProducts
AS
BEGIN
SELECT P.Id , P.Name AS 'Product Name' , P.Quantity , P.Image ,P.CreationDate , 
P.Price ,L.Value AS 'Product Status', C.Name AS 'Category',B.Name AS 'Brand'  , U.FirstName+' '+U.LastName 
AS 'Created By'  
FROM Products P JOIN Categories C  ON P.CategoryId = C.Id
JOIN Brands B ON B.Id = P.BrandId
JOIN Users U ON U.Id = P.UserId 
JOIN LookupItems L ON L.Id = P.ProductStatusId
END;
--22 - GET  PRODUCT BY ID WITH CATEGORY AND BRAND AND WHO CREATED THEM
CREATE PROCEDURE GetProductById
@ProductId INT
AS
BEGIN
SELECT P.Id , P.Name AS 'Product Name' , P.Quantity , P.Image ,P.CreationDate , 
P.Price ,L.Value AS 'Product Status', C.Name AS 'Category',B.Name AS 'Brand'  , U.FirstName+' '+U.LastName 
AS 'Created By'  
FROM Products P JOIN Categories C  ON P.CategoryId = C.Id
JOIN Brands B ON B.Id = P.BrandId
JOIN Users U ON U.Id = P.UserId 
JOIN LookupItems L ON L.Id = P.ProductStatusId
WHERE P.Id = @ProductId;
END;
EXEC GetProductById @ProductId =1;
-- 23 -APLAY SOFT DELET ON PRODUCT
CREATE PROCEDURE UpdateProductStatus
@ProductId INT
AS
BEGIN
UPDATE Products
SET IsDeleted = 1 , ProductStatusId=6,
ModificationDate =GETDATE()
WHERE Id = @ProductId;
END;
EXEC UpdateProductStatus @ProductId = 1;
-- 24 - CREATE ACCOUNT CUSTOMER
CREATE PROCEDURE RegisterCustomer
    @FirstName VARCHAR(20),
    @LastName VARCHAR(20),
    @Email VARCHAR(100),
    @Phone VARCHAR(14),
    @Password VARCHAR(10), 
    @GenderId INT
AS
BEGIN
    INSERT INTO Customers (
        [FirstName],
        [LastName],
        [Email],
        [Phone],
        [Password],
        [CustomerStatusId],
        [GenderId]
    )
    VALUES (
        @FirstName,
        @LastName,
        @Email,
        @Phone,
        @Password,
        3,
        @GenderId
    );
END;
EXEC RegisterCustomer 
    @FirstName = 'Ahmad', 
    @LastName = 'Hassan', 
    @Email = 'ahmad.h@gmail.com', 
    @Phone = '0795554433', 
    @Password = 'Ah33@123', 
    @GenderId = 1; 
EXEC RegisterCustomer 
    @FirstName = 'Omar', 
    @LastName = 'Zaid', 
    @Email = 'omar.zaid@outlook.com', 
    @Phone = '0780112233', 
    @Password = 'OmR#2026', 
    @GenderId = 1; 
EXEC RegisterCustomer 
    @FirstName = 'Sara', 
    @LastName = 'Mansour', 
    @Email = 'sara.m99@gmail.com', 
    @Phone = '0795566778', 
    @Password = 'Sara!8888', 
    @GenderId = 2; 
EXEC RegisterCustomer 
    @FirstName = 'Khaled', 
    @LastName = 'Salem', 
    @Email = 'khaled.dev@yahoo.com', 
    @Phone = '0770998877', 
    @Password = 'Khl@57772', 
    @GenderId = 1;
    --25 - GET ALL Users WHO IS ACTIVE
CREATE PROCEDURE GetAllCustomers
AS
BEGIN 
SELECT C.Id, C.FirstName + ' ' + C.LastName AS 'Full Name ', C.Email , C.Phone , LI.Value AS ' Gender' ,
L.Value AS 'Customer Status '
FROM Customers C 
JOIN LookupItems L ON C.CustomerStatusId = L.Id
JOIN LookupItems LI ON C.GenderId = LI.Id
END;
EXEC GetAllCustomers;
-- 26 - GET ALL CUSTOMERS WHO IS ACTIVE
CREATE PROCEDURE GetAllCustomersWhoIsActive 
AS
BEGIN 
SELECT C.Id, C.FirstName + ' ' + C.LastName AS 'Full Name ', C.Email , C.Phone , LI.Value AS ' Gender' ,
L.Value AS 'Customer Status '
FROM Customers C 
JOIN LookupItems L ON C.CustomerStatusId = L.Id
JOIN LookupItems LI ON C.GenderId = LI.Id
WHERE C.CustomerStatusId = 3 AND C.IsDeleted = 0;
END;
EXEC GetAllCustomersWhoIsActive ;
-- 27 - BAN CUSTOMERS
CREATE PROCEDURE BanCustomer
    @CustomerId INT
AS
BEGIN
    UPDATE Customers
    SET 
        CustomerStatusId = 4,   
        IsDeleted = 1,         
        ModificationDate = GETDATE() 
    WHERE Id = @CustomerId;
END;
EXEC BanCustomer @CustomerId = 2;
-- 28 - GET ALL CUSTOMERS WHO IS banned
CREATE PROCEDURE GetAllCustomersWhoIsBanned
AS
BEGIN 
SELECT C.Id, C.FirstName + ' ' + C.LastName AS 'Full Name ', C.Email , C.Phone , LI.Value AS ' Gender' ,
L.Value AS 'Customer Status '
FROM Customers C 
JOIN LookupItems L ON C.CustomerStatusId = L.Id
JOIN LookupItems LI ON C.GenderId = LI.Id
WHERE C.CustomerStatusId = 4 AND C.IsDeleted = 1;
END;
EXEC GetAllCustomersWhoIsBanned ;
-- 29 - Get Customer by id
CREATE PROCEDURE GetCustomerById
@CustomerId INT
AS
BEGIN 
SELECT C.Id, C.FirstName + ' ' + C.LastName AS 'Full Name ', C.Email , C.Phone , LI.Value AS ' Gender' ,
L.Value AS 'Customer Status '
FROM Customers C 
JOIN LookupItems L ON C.CustomerStatusId = L.Id
JOIN LookupItems LI ON C.GenderId = LI.Id
WHERE C.Id = @CustomerId;
END;
EXEC GetCustomerById @CustomerId = 3;
-- 30 - Update Customer Profile
CREATE PROCEDURE UpdateCustomerProfile
    @CustomerId INT,
    @FirstName VARCHAR(20) = NULL,
    @LastName VARCHAR(20) = NULL,
    @Phone VARCHAR(14) = NULL,
    @Password VARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE Customers
    SET 
        FirstName = ISNULL(@FirstName, FirstName),
        LastName = ISNULL(@LastName, LastName),
        Phone = ISNULL(@Phone, Phone),
        [Password] = ISNULL(@Password, [Password]),
        ModificationDate = GETDATE() 
    WHERE Id = @CustomerId 
    AND IsDeleted = 0;
END;
EXEC UpdateCustomerProfile @CustomerId = 3, @FirstName = ' New';
--31- Add product to CART
CREATE PROCEDURE AddToCart
    @CustomerId INT,
    @ProductId INT,
    @Quantity INT
AS
BEGIN
    DECLARE @CartId INT;
    SELECT @CartId = Id FROM Cart WHERE CustomerId = @CustomerId;
    IF @CartId IS NULL
    BEGIN
        INSERT INTO Cart (CustomerId) 
        VALUES (@CustomerId);
        
        SET @CartId = SCOPE_IDENTITY();
    END
    IF EXISTS (SELECT 1 FROM CartItems WHERE CartId = @CartId AND ProductId = @ProductId)
    BEGIN
        UPDATE CartItems 
        SET Quantity = Quantity + @Quantity 
        WHERE CartId = @CartId AND ProductId = @ProductId;
    END
    ELSE
    BEGIN
        INSERT INTO CartItems (CartId, ProductId, Quantity)
        VALUES (@CartId, @ProductId, @Quantity);
    END
END;
EXEC AddToCart @CustomerId = 3, @ProductId = 1, @Quantity = 1;
EXEC AddToCart @CustomerId = 3, @ProductId = 1, @Quantity = 2;
EXEC AddToCart @CustomerId = 4, @ProductId = 1, @Quantity = 2;
EXEC AddToCart @CustomerId = 4, @ProductId = 5, @Quantity = 4;

-- 32 - GET all PRODUCTs IN CARTITEMS
CREATE PROCEDURE GetAllProductsInCart
    @CartId INT 
AS
BEGIN
    SELECT 
        Cu.FirstName + ' ' + Cu.LastName AS 'Customer Name',
        Cu.Email, 
        Cu.Phone,
        P.Name AS 'Product Name', 
        P.Price AS 'Unit Price',
        CI.Quantity, 
        (CI.Quantity * P.Price) AS 'Total Price'
    FROM CartItems CI
    JOIN Cart C ON CI.CartId = C.Id            
    JOIN Customers Cu ON Cu.Id = C.CustomerId
    JOIN Products P ON P.Id = CI.ProductId
    WHERE C.Id = @CartId;                     
END;
EXEC GetAllProductsInCart @CartId =2;
-- 33- update Quantity in cartItem
CREATE PROCEDURE UpdateQuantityOfProductInCartItem
@CartId INT ,
@ProductId INT,
@Quantity INT
AS
BEGIN
IF @Quantity <= 0
BEGIN 
DELETE FROM CartItems
WHERE ProductId = @ProductId AND CartId = @CartId
END;
ELSE
BEGIN
UPDATE CartItems
SET Quantity = @Quantity
WHERE CartId = @CartId AND ProductId = @ProductId
END;
END;
EXEC UpdateQuantityOfProductInCartItem @CartId =1 , @ProductId=1 , @Quantity=0;
EXEC UpdateQuantityOfProductInCartItem @CartId =2 , @ProductId=1 , @Quantity=4;
--34 - delete product from cartitem
CREATE PROCEDURE DeleteProductFromCart
@CartId INT ,
@ProductId INT
AS
BEGIN
DELETE FROM CartItems 
WHERE CartId =@CartId AND ProductId = @ProductId 
END;
EXEC DeleteProductFromCart @CartId = 2 , @ProductId = 5;
-- 35 - Add to wishlist
CREATE PROCEDURE AddToWishList
    @ProductId INT,
    @CustomerId INT
AS
BEGIN
    DECLARE @WishlistId INT;
    SELECT @WishlistId = Id FROM Wishlist WHERE CustomerId = @CustomerId;
    IF @WishlistId IS NULL
    BEGIN
        INSERT INTO Wishlist(CustomerId) 
        VALUES (@CustomerId);
        
        SET @WishlistId = SCOPE_IDENTITY();
    END
    IF NOT EXISTS (SELECT 1 FROM WishlistItems WHERE WishlistId = @WishlistId AND ProductId = @ProductId)
    BEGIN
        INSERT INTO WishlistItems(WishlistId, ProductId)
        VALUES (@WishlistId, @ProductId);
    END
END;
EXEC AddToWishList @ProductId = 5,@CustomerId = 5;
-- 36 GetAllProductInWishlist
CREATE PROCEDURE GetAllProductInWishlist
@WishListId INT
AS 
BEGIN
SELECT C.Id , C.FirstName , C.Email , C.Phone , P.Name AS 'Product Name ' , P.Price
FROM Wishlist W 
JOIN WishlistItems WI on W.Id = WI.WishlistId
JOIN Products P ON WI.ProductId = P.Id
JOIN Customers C ON C.Id = W.CustomerId
WHERE W.Id = @WishListId
END;
EXEC GetAllProductInWishlist @WishListId = 1;
-- 37 CREATEOrder
CREATE PROCEDURE CreateOrder
    @ShippingAddress VARCHAR(100),
    @Note VARCHAR(MAX),
    @CustomerId INT,
    @PaymentMethodId INT
AS
BEGIN
    DECLARE @CalculatedTotal DECIMAL(18,2);
    DECLARE @CartId INT;
    DECLARE @OrderId INT;
    SELECT @CartId = Id FROM Cart WHERE CustomerId = @CustomerId;
    SELECT @CalculatedTotal = SUM(CI.Quantity * P.Price)
    FROM CartItems CI
    JOIN Products P ON CI.ProductId = P.Id
    WHERE CI.CartId = @CartId;
    INSERT INTO [Orders] 
    (TotalPrice, 
    ShippingAddres, 
    Note, 
    DeliveryDATE, 
    OrderStatusId, 
    PaymentMethodId, 
    PaymentStatusId, 
    CustomerId)
    VALUES (
    @CalculatedTotal,
    @ShippingAddress,
    @Note, DATEADD(DAY, 3, GETDATE()),
     7, 
     @PaymentMethodId,
     15, 
     @CustomerId);
    SET @OrderId = SCOPE_IDENTITY();
    INSERT INTO OrderItems (OrderId, ProductId, Quantity,UnitPrice )
    SELECT @OrderId, CI.ProductId, CI.Quantity, P.Price
    FROM CartItems CI
    JOIN Products P ON CI.ProductId = P.Id
    WHERE CI.CartId = @CartId;

    DELETE FROM CartItems WHERE CartId = @CartId;

END;
EXEC CreateOrder 
    @ShippingAddress = '123 Cyberpunk Blvd, Apartment 4B, Amman', 
    @Note = 'Please leave it at the reception, handle with care.', 
    @CustomerId = 4, 
    @PaymentMethodId = 12;
-- 38 GET ORDER DETIALS
CREATE PROCEDURE GetOrderDetailsById
@OrderId INT
AS
BEGIN
SELECT C.FirstName + ' ' + C.LastName AS 'Customer Name' , C.Phone , C.Email , O.ShippingAddres ,P.Name AS 'Product Name' ,
OI.Quantity , P.Price AS 'Price Per Items' ,L.Value AS 'Payment Method ' , LI.Value AS 'Order Status ',LIT.Value AS 'Payment Status ', O.TotalPrice 
FROM Customers C 
JOIN Orders O ON C.Id = O.CustomerId
JOIN OrderItems OI ON O.Id = OI.OrderId
JOIN Products P ON OI.ProductId = P.Id
JOIN LookupItems L ON O.PaymentMethodId = L.Id
JOIN LookupItems LI ON O.OrderStatusId = LI.Id
JOIN LookupItems LIT ON O.PaymentStatusId = LIT.Id
WHERE O.Id = @OrderId
END;
EXEC GetOrderDetailsById @OrderId = 1;
-- 39 -- update OrderStatus
CREATE PROCEDURE UpdateOrderStatus
    @OrderId INT,
    @NewStatusId INT
AS
BEGIN
        UPDATE Orders
        SET OrderStatusId = @NewStatusId,
            ModificationDate = GETDATE() 
        WHERE Id = @OrderId;    
END;
EXEC UpdateOrderStatus @OrderId = 1,@NewStatusId = 9; 
-- 40 - add review
CREATE PROCEDURE AddProductReview
    @Rating INT,
    @Comment VARCHAR(MAX),
    @ProductId INT,
    @CustomerId INT
AS
BEGIN
    

    INSERT INTO [dbo].[Reviews]
           ([Rating]
           ,[Comment]
           ,[ProductId]
           ,[CustomerId])
     VALUES
           (@Rating,
            @Comment,
            @ProductId,
            @CustomerId);

    
END;
EXEC AddProductReview 
    @Rating = 5, 
    @Comment = 'Amazing RGB lighting! Fits perfectly with my neon setup.', 
    @ProductId = 5, 
    @CustomerId = 5;
    -- 41 GETALL REVIEW
    CREATE PROCEDURE GetAllReviews
AS
BEGIN
    SELECT 
        R.Id AS ReviewId,
        P.Name AS ProductName,
        C.FirstName + ' ' + C.LastName AS CustomerName,
        R.Rating,
        R.Comment,
        R.CreationDate
    FROM Reviews R
    JOIN Products P ON R.ProductId = P.Id
    JOIN Customers C ON R.CustomerId = C.Id
    ORDER BY R.CreationDate DESC; 
END;
EXEC GetAllReviews;
-- 42 GET PRODUCT WITH PRICE RANGE
CREATE PROCEDURE GetProductWithinRange
@MinPrice DECIMAL ,
@MaxPrice DECIMAL 
AS
BEGIN
SELECT Name , Price  FROM Products  
WHERE Price BETWEEN @MinPrice AND @MaxPrice
ORDER BY Price ASC;
END;
EXEC GetProductWithinRange 1200 , 1500;

--43 GET RECENT 5 ORDER
CREATE PROCEDURE GetLastFiveOrder
AS
BEGIN
SELECT TOP 5 C.FirstName + ' ' + C.LastName AS 'Customer Name' , C.Phone , C.Email , O.ShippingAddres,
O.CreationDate,L.Value AS 'Payment Method ' , LI.Value AS 'Order Status ',LIT.Value AS 'Payment Status ', O.TotalPrice 
FROM Orders O
JOIN Customers C ON C.Id = O.CustomerId
JOIN LookupItems L ON O.PaymentMethodId = L.Id
JOIN LookupItems LI ON O.OrderStatusId = LI.Id
JOIN LookupItems LIT ON O.PaymentStatusId = LIT.Id
ORDER BY O.CreationDate DESC;
END;
EXEC GetLastFiveOrder;
-- 44 -GetTotalSalesPerCustomer
CREATE PROCEDURE GetTotalSalesPerCustomer
AS
BEGIN
SELECT 
    C.FirstName + ' ' + C.LastName AS [Customer Name],
    COUNT(O.Id) AS [Total Orders],        
    SUM(O.TotalPrice) AS [Total Spent]    
FROM Customers C
JOIN Orders O ON C.Id = O.CustomerId
GROUP BY C.Id, C.FirstName, C.LastName         
ORDER BY [Total Spent] DESC;        
END;

EXEC GetTotalSalesPerCustomer;
-- 45 GetAvailableProducts
CREATE PROCEDURE GetAvailableProducts
AS
BEGIN
    SELECT 
        Id, 
        Name, 
        Price, 
        Image
    FROM Products
    WHERE IsDeleted = 0
    ORDER BY Price ASC; 
END;
EXEC GetAvailableProducts;
-- 46 GetProductsWithAverageRating
CREATE PROCEDURE GetProductsWithAverageRating
AS
BEGIN
    SELECT 
        P.Id,
        P.Name,
        P.Price,
        AVG(R.Rating) AS [Average Rating], 
        COUNT(R.Id) AS [Reviews Count] 
    FROM Products P
    LEFT JOIN Reviews R ON P.Id = R.ProductId AND R.IsDeleted = 0
    WHERE P.IsDeleted = 0
    GROUP BY P.Id, P.Name, P.Price
    ORDER BY [Average Rating] DESC; 
END;
EXEC GetProductsWithAverageRating;

