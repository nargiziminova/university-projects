
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    signup_date DATE,
    country VARCHAR(50)
);


CREATE TABLE activity_log (
    log_id INT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(20),
    activity_date DATE,
    value INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users VALUES
(1, 'Alice', '2025-01-01', 'Poland'),
(2, 'Bob', '2025-01-05', 'USA'),
(3, 'Charlie', '2025-01-10', 'Germany'),
(4, 'David', '2025-01-15', 'Poland');

INSERT INTO activity_log VALUES
(1, 1, 'login', '2025-02-01', 1),
(2, 1, 'purchase', '2025-02-01', 120),
(3, 2, 'login', '2025-02-01', 1),
(4, 3, 'comment', '2025-02-02', 1),
(5, 4, 'login', '2025-02-03', 1),
(6, 2, 'purchase', '2025-02-04', 200),
(7, 3, 'purchase', '2025-02-05', 50),
(8, 1, 'comment', '2025-02-06', 1);


SELECT u.username, COUNT(*) AS total_activities
FROM activity_log a
JOIN users u ON a.user_id = u.user_id
GROUP BY u.username
ORDER BY total_activities DESC;


SELECT u.country, SUM(a.value) AS total_purchases
FROM activity_log a
JOIN users u ON a.user_id = u.user_id
WHERE a.activity_type = 'purchase'
GROUP BY u.country;


SELECT u.username, COUNT(*) AS activities_last_week
FROM activity_log a
JOIN users u ON a.user_id = u.user_id
WHERE a.activity_date BETWEEN '2025-02-01' AND '2025-02-07'
GROUP BY u.username
HAVING COUNT(*) > 1;

