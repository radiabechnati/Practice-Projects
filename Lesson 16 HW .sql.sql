

CREATE TABLE Products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    category     VARCHAR(50)
);


CREATE TABLE Sales (
    sale_id       INT PRIMARY KEY,
    product_id    INT REFERENCES Products(product_id),
    sale_date     DATE,
    quantity_sold INT
);

INSERT INTO Products (product_id, product_name, category)
VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Smartphone', 'Electronics'),
(3, 'Coffee Maker', 'Appliances'),
(4, 'Running Shoes', 'Apparel');


INSERT INTO Sales (sale_id, product_id, sale_date, quantity_sold)
VALUES
(1, 1, '2023-01-05', 10),
(2, 2, '2023-01-10', 15),
(3, 3, '2023-01-15', 8),
(4, 4, '2023-01-20', 12),
(5, 1, '2023-02-05', 14),
(6, 2, '2023-02-12', 18),
(7, 3, '2023-02-18', 9),
(8, 4, '2023-02-25', 16),
(9, 1, '2023-03-06', 20),
(10, 2, '2023-03-11', 22),
(11, 3, '2023-03-16', 13),
(12, 4, '2023-03-24', 18),
(13, 1, '2023-04-05', 16),
(14, 2, '2023-04-10', 24),
(15, 3, '2023-04-18', 11),
(16, 4, '2023-04-28', 19),
(17, 1, '2023-05-07', 21),
(18, 2, '2023-05-12', 28),
(19, 3, '2023-05-19', 15),
(20, 4, '2023-05-26', 22),
(21, 1, '2023-06-04', 18),
(22, 2, '2023-06-13', 26),
(23, 3, '2023-06-21', 14),
(24, 4, '2023-06-29', 20),
(25, 1, '2024-01-06', 24),
(26, 2, '2024-01-11', 30),
(27, 3, '2024-01-17', 16),
(28, 4, '2024-01-23', 25),
(29, 1, '2024-02-04', 26),
(30, 2, '2024-02-09', 32),
(31, 3, '2024-02-15', 18),
(32, 4, '2024-02-21', 27),
(33, 1, '2024-03-03', 28),
(34, 2, '2024-03-10', 35),
(35, 3, '2024-03-18', 20),
(36, 4, '2024-03-26', 29),
(37, 1, '2024-04-05', 25),
(38, 2, '2024-04-13', 34),
(39, 3, '2024-04-19', 19),
(40, 4, '2024-04-27', 31),
(41, 1, '2024-05-06', 30),
(42, 2, '2024-05-14', 38),
(43, 3, '2024-05-20', 22),
(44, 4, '2024-05-29', 33),
(45, 1, '2024-06-04', 27),
(46, 2, '2024-06-12', 36),
(47, 3, '2024-06-18', 21),
(48, 4, '2024-06-25', 32),
(49, 1, '2024-06-28', 29),
(50, 2, '2024-06-30', 40);

SELECT * FROM Products;
SELECT * FROM Sales;


SELECT DISTINCT
    p.product_id,
    p.product_name,
    SUM(s.quantity_sold) OVER (PARTITION BY p.product_id) AS total_sales
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
ORDER BY total_sales DESC;

SELECT
    sale_month,
    monthly_sales,
    SUM(monthly_sales) OVER (ORDER BY sale_month) AS running_total
FROM (
    SELECT
        strftime('%Y-%m', sale_date) AS sale_month,
        SUM(quantity_sold) AS monthly_sales
    FROM Sales
    GROUP BY strftime('%Y-%m', sale_date)
) m
ORDER BY sale_month;



SELECT product_id, product_name, total_sales, sales_rank
FROM (
    SELECT
        p.product_id,
        p.product_name,
        SUM(s.quantity_sold) AS total_sales,
        RANK() OVER (ORDER BY SUM(s.quantity_sold) DESC) AS sales_rank
    FROM Sales s
    JOIN Products p ON s.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
) ranked
WHERE sales_rank <= 3
ORDER BY sales_rank;


