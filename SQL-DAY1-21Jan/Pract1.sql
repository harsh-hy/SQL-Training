use PracticeDatabase;


IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.DeliveredOrders', 'U') IS NOT NULL DROP TABLE dbo.DeliveredOrders;

-- Customers table
CREATE TABLE dbo.Customers
(
    CustomerId INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    City VARCHAR(50)  NOT NULL,
    Segment VARCHAR(20)  NOT NULL,   
    IsActive BIT NOT NULL,
    CreatedOn DATE NOT NULL
);

-- Orders table
CREATE TABLE dbo.Orders
(
    OrderId INT PRIMARY KEY,
    CustomerId INT NOT NULL,
    OrderDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL,    
    PaymentMode VARCHAR(20) NOT NULL,    
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerId) REFERENCES dbo.Customers(CustomerId)
);

-- Insert Customers
INSERT INTO dbo.Customers (CustomerId, FullName, City, Segment, IsActive, CreatedOn) VALUES
(101, 'Harsh Yadav',   'Kanpur', 'Retail',    1, '2025-10-12'),
(102, 'Yash',    'Kanpur',    'Corporate', 1, '2025-10-09'),
(103, 'John Lennon', 'Liverpool',  'Retail',    0, '2026-09-15'),
(104, 'Ringo Starr',   'Liverpool',    'Retail',    0, '2022-12-20'),
(105, 'Elvis',   'Las Vegas',  'Corporate', 0, '2025-11-10'),
(106, 'Paul Maccartney',   'Liverpool',  'Corporate', 1, '2020-01-01');

-- Insert Orders
INSERT INTO dbo.Orders (OrderId, CustomerId, OrderDate, Amount, Status, PaymentMode) VALUES
(5001, 101, '2026-01-10', 1200.00, 'Delivered', 'UPI'),
(5002, 101, '2026-01-15',  850.00, 'Pending',   'Card'),
(5003, 102, '2026-01-05', 5000.00, 'Delivered', 'Card'),
(5004, 103, '2025-12-30',  300.00, 'Cancelled', 'Cash'),
(5005, 105, '2026-01-18', 2500.00, 'Delivered', 'UPI'),
(5006, 102, '2026-01-20', 1500.00, 'Pending',   'UPI');



SELECT *
FROM dbo.Customers;


SELECT CustomerId, FullName, City
FROM dbo.Customers;


SELECT DISTINCT City
FROM dbo.Customers;


SELECT FullName AS CustomerName, City AS CustomerCity
FROM dbo.Customers;


SELECT *
FROM dbo.Customers
WHERE City = 'Liverpool';


SELECT *
FROM dbo.Orders
WHERE Status = 'Delivered' AND PaymentMode = 'UPI';

SELECT *
FROM dbo.Customers
WHERE City IN ('Kanpur', 'Vegas');


SELECT *
FROM dbo.Orders
WHERE Amount BETWEEN 800 AND 3000;

-- find name or string starting from CHARACTER%   and ending CHARACTER%
SELECT *
FROM dbo.Customers
WHERE FullName LIKE 'H%';

SELECT * from dbo.Customers
WHERE FullName LIKE 'E%s';

--order by descending
SELECT *
FROM dbo.Orders
ORDER BY Amount DESC;

--order by ascending
SELECT *
FROM dbo.Orders
ORDER BY Amount ;

--top 1
SELECT TOP 1 *
FROM dbo.Orders
ORDER BY Amount DESC

--second top
SELECT TOP 1 * FROM
(
SELECT TOP 2 *
FROM dbo.Orders
ORDER BY Amount DESC
) TT ORDER BY TT.Amount

