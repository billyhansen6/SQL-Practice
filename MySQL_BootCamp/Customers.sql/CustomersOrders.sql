CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
-- Joins

-- IMPLICT INNER JOIN
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;


SELECT first_name, last_name, order_date, amount
FROM customers, orders
    WHERE custoemrs.id = orders.custoemr.id;
    
-- EXPLICT INNER JOIN
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;


-- Fancy

SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY order_date;

SELECT 
    first_name, 
    last_name, 
    SUM(amount) as Total_Spent 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY Total_Spent DESC;

-- LEFT JOIN

SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS Swaggggggg
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY Swaggggggg;


-- RIGHT JOIN

SELECT * FROM customers
RIGHT JOIN ordrs
    ON customers.id = orders.customer_id;

-- My Turn

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(100)
);

CREATE TABLE papers(
    title VARCHAR(200),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade FROM students
JOIN papers
ON students.id = papers.student_id
ORDER BY papers.grade DESC;

SELECT first_name, title, grade FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

SELECT 
    first_name, 
    IFNULL(title, 'Missing'),
    IFNULL(grade, 0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

select 
    first_name, 
    IFNULL(AVG(grade), 0) as average,
Case
    WHEN AVG(grade) > 69.99 then 'PASSING'
    else 'FAILING'
END as Pass_fail
from students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;






