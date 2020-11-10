/* 1. Create a table in the database and load the data from the provided file into that table; 
use SQLite or any other relational DBMS of your choosing.
Turn in your create-table statement. The data import statements are optional (you don't need to include these)
*/ 

CREATE TABLE sales(
    name VARCHAR(256),
    discount varchar(256),
    month varchar(50),
    price int
); 

/*2 Please write a SQL query for each functional dependency you find along with a comment describing the 
functional dependency. Please also include a SQL query for at least one functional dependency 
that does not exist in the dataset along with a comment mentioning that the functional dependency 
does not exist. Remember, short queries are preferred. */

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.name = sales2.name AND sales1.discount != sales2.discount;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.name = sales2.name AND sales1.month != sales2.month;
-- returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.name = sales2.name AND sales1.price != sales2.price;
-- returns 0, name -> price is a FD

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.name != sales2.name AND sales1.discount = sales2.discount;
--returns 36 

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount = sales2.discount AND sales1.month != sales2.month;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount = sales2.discount AND sales1.price != sales2.price;
-- returns 36 

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.name != sales2.name AND sales1.month = sales2.month;
-- returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount != sales2.discount AND sales1.month = sales2.month;
-- returns 0 month -> discount is a FD

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price != sales2.price AND sales1.month = sales2.month;
-- returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price = sales2.price AND sales1.name != sales2.name;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price = sales2.price AND sales1.discount != sales2.discount;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price = sales2.price AND sales1.month != sales2.month;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price = sales2.price AND sales1.month = sales2.month AND sales1.name != sales2.name;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount != sales2.discount AND sales1.month = sales2.month AND sales1.name = sales2.name;
--returns 0 (name, month) -> discount This functional dependency does not exist 

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount = sales2.discount AND sales1.month != sales2.month AND sales1.name = sales2.name;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount = sales2.discount AND sales1.month != sales2.month AND sales1.price = sales2.price;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.discount = sales2.discount AND sales1.name != sales2.name AND sales1.price = sales2.price;
--returns 36

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price != sales2.price AND sales1.name = sales2.name AND sales1.month = sales2.month;
--returns 0 name,month -> price

SELECT COUNT (DISTINCT sales1.name)
FROM sales as sales1, sales as sales2
WHERE sales1.price != sales2.price AND sales1.name != sales2.name AND sales1.month = sales2.month AND sales1.discount != sales2.discount;
--returns 0 month -> name,price,discount

/* doing some FD tests I found out that the functional dependencies are 
    name -> price 
    month -> discount
 */

/*3) Decompose the table into Boyce-Codd Normal Form (BCNF), and create SQL tables for the decomposed schema. 
Create keys and foreign keys where appropriate.
For this question turn in the SQL commands for creating the tables.

    Decomposing the table into BCNF:
    FD: name -> price, month -> discount
    
    R(name,discount,month,price) name -> price
    {name}+ = {name, price}
    R1(name, price) R2(name,discount,month) month -> discount
    {month}+ = {month, discount}
    R1(name, price) R2(name, month) R3(month, discount) */
CREATE TABLE NamePrice(
    name VARCHAR(50) PRIMARY KEY,
    price INT
);

CREATE TABLE MonthDiscount(
    month VARCHAR(12) PRIMARY KEY,
    discount VARCHAR(50)
);

CREATE TABLE NameMonth(
    name VARCHAR(50) REFERENCES NamePrice(name),
    month VARCHAR(12) REFERENCES MonthDiscount(month)
);

/*Populate your BCNF tables from Mr. Frumble's data. For this you need to write SQL queries 
that load the tables you created in part 3. from the table you created in part 1.
Here, turn in the SQL queries that load the tables, and count the size of the tables after loading them 
(obtained by running SELECT COUNT(*) FROM Table). */
INSERT INTO NamePrice
SELECT DISTINCT name, price FROM sales;
SELECT COUNT(*) FROM NamePrice;
--Size of table 36

INSERT INTO MonthDiscount
SELECT DISTINCT month, discount FROM sales;
SELECT COUNT(*) FROM MonthDiscount;
-- Size of table 12

INSERT INTO NameMonth
SELECT name, month FROM sales;
SELECT COUNT(*) FROM NameMonth;
--Size of table 426

