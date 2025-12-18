CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50),
    registration_date DATE
);

INSERT INTO users (id, name, age, country, registration_date) VALUES
(1, 'Alice', 25, 'Poland', '2025-01-10'),
(2, 'Bob', 30, 'USA', '2025-02-15'),
(3, 'Charlie', 22, 'Poland', '2025-03-05'),
(4, 'David', 28, 'Germany', '2025-01-20'),
(5, 'Eva', 35, 'USA', '2025-02-28');


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO orders (order_id, user_id, amount, order_date, status) VALUES
(1, 1, 100.50, '2025-01-12', 'completed'),
(2, 2, 200.00, '2025-02-16', 'pending'),
(3, 1, 50.75, '2025-01-20', 'completed'),
(4, 3, 300.00, '2025-03-10', 'completed'),
(5, 5, 150.00, '2025-02-28', 'pending');

SELECT name, age, country
FROM users
WHERE age > 25
ORDER BY age DESC;

SELECT country, COUNT(*) AS user_count, AVG(age) AS avg_age
FROM users
GROUP BY country
HAVING COUNT(*) > 1;

SELECT u.name, u.country, o.amount, o.status
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE o.status = 'completed';


SELECT name, age
FROM users
WHERE id IN (
    SELECT user_id
    FROM orders
    WHERE amount > 150
);


SELECT name
FROM users
WHERE id IN (
    SELECT user_id
    FROM orders
    WHERE amount = (
        SELECT MAX(amount)
        FROM orders
    )
);


