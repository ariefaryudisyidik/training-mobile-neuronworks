-- a. Insert untuk 5 record & commited.
START TRANSACTION;
INSERT INTO employees VALUES
(1703, 'Nguyen', 'Michelle', 'x103', 'mgunyen@classicmodelcars.com', '3', 1621, 'Sales Rep'),
(1704, 'Taylor', 'Anthony', 'x104', 'tanthony@classicmodelcars.com', '4', 1621, 'Sales Rep'),
(1705, 'Patel', 'Rachel', 'x105', 'prachel@classicmodelcars.com', '5', 1621, 'Sales Rep'),
(1706, 'Lee', 'Joshua', 'x106', 'ljoshua@classicmodelcars.com', '6', 1621, 'Sales Rep'),
(1707, 'Davis', 'Lauren', 'x107', 'dlauren@classicmodelcars.com', '7', 1621, 'Sales Rep');
SELECT * FROM employees;

-- b. Insert/update/delete di 1 sesi dan read table di sesi yg berbeda. 
INSERT INTO employees VALUES
(1708, 'Raynolds', 'Jackson', 'x108', 'rjackson@classicmodelcars.com', '3', 1621, 'Sales Rep');
UPDATE employees SET jobTitle = 'VP Sales' 
WHERE employeeNumber = 1703;
SAVEPOINT savepoint_one;
DELETE FROM employees 
WHERE employeeNumber = 1707;

-- c. Rollback ke savepoint.
ROLLBACK TO SAVEPOINT savepoint_one;
COMMIT;
SELECT * FROM employees;

-- Eksekusi script sql subquery pada modul training:
-- a. SELECT statement
SELECT productName, buyPrice FROM products 
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products) ORDER BY buyPrice ASC;

-- b. INSERT statement
INSERT INTO employees(firstName, lastName, jobTitle, officeCode)
VALUES('John', 'Doe', 'Sales Manager', (SELECT officeCode FROM offices WHERE city = 'San Francisco'));

-- c. UPDATE statement
UPDATE employees SET jobTitle = 'Senior Sales Manager', 
officeCode = (SELECT officeCode FROM offices WHERE city = 'San Francisco')
WHERE employeeNumber = 1188;

-- d. DELETE statemnt
DELETE FROM orderdetails 
WHERE orderNumber IN 
(SELECT orderNumber FROM orders WHERE orderDate < '2004-01-01');

-- e. Filter dari column dengan agregasi nilai paling besar
SELECT productName, buyPrice FROM products 
WHERE buyPrice = (SELECT MAX(buyPrice) FROM products);

-- f. Query dari Subquery sebagai source data
SELECT c.customerName, COUNT(o.orderNumber) AS numOrders
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber
HAVING COUNT(o.orderNumber) = (
    SELECT MAX(numOrders)
    FROM (
        SELECT COUNT(orderNumber) AS numOrders
        FROM orders
        GROUP BY customerNumber
    ) AS orderCounts
);

-- g. Combine query UNION 
SELECT productName, productDescription FROM products
WHERE productDescription LIKE '%red%'
UNION
SELECT productName, productDescription FROM products
WHERE productDescription LIKE '%green%';

-- h. Combine query INTERSECT
SELECT DISTINCT c.customerNumber, c.customerName
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN payments p ON c.customerNumber = p.customerNumber;

-- Membuat table struktur dari form yang disediakan
CREATE DATABASE gocar;
USE gocar;

CREATE TABLE customers (
customerId INT PRIMARY KEY,
customerName VARCHAR(50),
customerPhone VARCHAR(20),
customerEmail VARCHAR(50),
customerAddress VARCHAR(100)
);

CREATE TABLE drivers(
driverId INT PRIMARY KEY,
driverName VARCHAR(50),
driverPhone VARCHAR(20),
driverEmail VARCHAR(50),
plateNumber VARCHAR(20),
carModel VARCHAR(50),
carYear INT
);

CREATE TABLE orders(
orderId CHAR(17) PRIMARY KEY,
customerId INT,
driverId INT,
orderDate DATE,
pickupAddress VARCHAR(100),
destinationAddress VARCHAR(100),
distance INT,
travelTime TIME,
pickupTime TIME,
timeArrived TIME,
paymentMethod VARCHAR(20),
travelExpense INT,
applicationServiceFee INT,
totalPayment INT,
FOREIGN KEY (customerId) REFERENCES customers(customerId),
FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);