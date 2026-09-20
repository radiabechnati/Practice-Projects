CREATE TABLE IF NOT EXISTS product (
    product_code INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price        DECIMAL(10,2) NOT NULL,
    stock        INT NOT NULL,
    category     VARCHAR(50) NOT NULL
);
 
CREATE TABLE IF NOT EXISTS customer (
    customer_id       INT PRIMARY KEY,
    customer_name     VARCHAR(50) NOT NULL,
    customer_location VARCHAR(50),
    customer_phone    VARCHAR(20)
);
 
CREATE TABLE IF NOT EXISTS  sales (
    order_id     VARCHAR(10) PRIMARY KEY,
    order_date   DATE NOT NULL,
    customer_id  INT NOT NULL,
    product_code INT NOT NULL,
    product_name VARCHAR(50),
    quantity     INT NOT NULL,
    price        DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id)  REFERENCES customer(customer_id),
    FOREIGN KEY (product_code) REFERENCES product(product_code)
);
 



INSERT INTO customer (customer_id, customer_name, customer_location, customer_phone) VALUES
(1111, 'Nisha',     'kerala',       '8392320'),
(1212, 'Oliver',     'kerala',      '4353891'),
(1216, 'Nila',       'delhi',       '3323242'),
(1246, 'Vignesh',    'chennai',     '1111212'),
(1313, 'shiny',      'Maharastra',  '5454543'),
(1910, 'Mohan',      'mumbai',      '9023941'),
(2123, 'Biyush',     'Bombay',      '1253358'),
(3452, 'Alexander',  'West Bengal', '1212134'),
(3921, 'Mukesh',     'Manipur',     '4232321'),
(5334, 'Christy',    'pakistan',    '2311111'),
(9021, 'Rithika',    'Kashmir',     '1121344'),
(9212, 'Jessica',    'banglore',    '1233435'),
(9875, 'Stephen',    'chennai',     '1212133');


SELECT order_id, customer_id, order_date, price, quantity
FROM sales;


SELECT *
FROM product
WHERE category = 'Stationary';


SELECT DISTINCT category
FROM product;


SELECT *
FROM product
ORDER BY price DESC;










