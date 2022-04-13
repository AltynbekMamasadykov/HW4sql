CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    productName VARCHAR(30) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    productCount INTEGER DEFAULT 0,
    price NUMERIC);

INSERT INTO products  (productName, manufacturer, productCount, price)
VALUES ('iPhone X', 'Apple', 2, 71000),
       ('iPhone 8', 'Apple', 3, 56000),
       ('Galaxy S9', 'Samsung', 6, 56000),
       ('Galaxy S8 Plus', 'Samsung', 2, 46000),
       ('Desire 12', 'HTC', 3, 26000);

SELECT * FROM products;

SELECT * FROM products WHERE manufacturer ='Apple';
SELECT * FROM products WHERE price = 56000;
SELECT * FROM products WHERE manufacturer = 'Samsung' AND price > 50000;
SELECT * FROM products WHERE productName LIKE '_Phone%';
SELECT DISTINCT manufacturer FROM products;
SELECT * FROM products ORDER BY productCount;
SELECT productName, manufacturer FROM products ORDER BY manufacturer DESC;
SELECT productName, price, manufacturer FROM products ORDER BY manufacturer, productName;
SELECT productName, price, manufacturer FROM products ORDER BY manufacturer ASC, productName DESC;
SELECT * FROM products ORDER BY productName LIMIT 4;
SELECT * FROM Products ORDER BY ProductName LIMIT ALL OFFSET 2;
SELECT * FROM products WHERE manufacturer IN ('Samsung', 'HTC', 'Huawei');
SELECT * FROM products WHERE price BETWEEN 20000 AND 50000;
SELECT SUM(productCount) FROM products;
SELECT AVG(price) AS average_price FROM products;
SELECT COUNT(*) FROM products;
SELECT MIN(price) FROM products;
SELECT MAX(price) FROM products;
SELECT COUNT(*) AS prodCount,
       SUM(productCount) AS totalCount,
       MIN(price) AS minPrice,
       MAX(price) AS maxPrice,
       AVG(price) AS avgPrice
        FROM products;
SELECT manufacturer, COUNT(*) AS modelsCount FROM products GROUP BY manufacturer;
SELECT manufacturer, COUNT(*) AS modelsCount FROM products GROUP BY manufacturer HAVING COUNT(*) > 1;





