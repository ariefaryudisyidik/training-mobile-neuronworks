-- 1. Sample Database (classicmodels)
SHOW TABLES;
SELECT firstName, lastName FROM employees;

-- 2. Querying Data
SELECT * FROM employees;
UPDATE employees SET firstName = 'John' WHERE employeeNumber = 1002;
SELECT employeeNumber, firstName, lastName FROM employees;

-- 3. Sorting Data
SELECT employeeNumber, firstName, lastName FROM employees ORDER BY firstName;
SELECT productCode, productName, productLine, buyPrice FROM products ORDER BY buyPrice DESC;
SELECT employeeNumber, firstName, lastName FROM employees ORDER BY firstName;

-- 4. Filtering Data
SELECT employeeNumber, firstName, lastName FROM employees LIMIT 5;
SELECT employeeNumber, firstName, lastName, officeCode FROM employees WHERE officeCode = 5 ORDER BY firstName;
SELECT firstName, lastName, officeCode FROM employees WHERE officeCode IN(5,6) ORDER BY officeCode;
SELECT employeeNumber, firstName, lastName FROM employees WHERE firstName LIKE 'ma%' ORDER BY firstName;
SELECT employeeNumber, firstName, lastName FROM employees WHERE firstName LIKE 'ma__' ORDER BY firstName;

-- 5. Join
SELECT officeCode, COUNT(employeeNumber) headcount FROM employees GROUP BY officeCode HAVING headcount >= 5;
SELECT o.city FROM offices as o;
SELECT employeeNumber, firstName, lastName, city FROM employees INNER JOIN offices ON offices.officeCode = employees.officeCode ORDER BY firstName;

-- 6. Agregate
SELECT AVG(creditLimit) FROM customers;
SELECT ROUND(AVG(DISTINCT creditLimit), 2)  FROM customers;
SELECT officeCode, COUNT(*) as 'Number of Employees' FROM employees GROUP BY officeCode;

-- 7. Cursor
DELIMITER $$
CREATE PROCEDURE ShowAvgCreditLimit()
    BEGIN
	    DECLARE avgCreditLimit DECIMAL;
        DECLARE curAvgCreditLimit CURSOR FOR SELECT AVG(creditLimit) FROM customers;
        OPEN curAvgCreditLimit;
        FETCH curAvgCreditLimit INTO avgCreditLimit;
        SELECT avgCreditLimit;	
      CLOSE curAvgCreditLimit;
    END$$
DELIMITER ;

CALL ShowAvgCreditLimit;

