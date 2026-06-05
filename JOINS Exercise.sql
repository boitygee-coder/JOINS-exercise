-- Databricks notebook source
  CREATE OR REPLACE TABLE users (
    user_id INT,
    user_name STRING,
    country STRING
);
INSERT INTO users VALUES
(1,'Nomvula','Johannesburg'),
(2,'David','Cape Town'),
(3,'Anele','Durban'),
(4,'Kabelo','Pretoria'),
(5,'Lerato','Port Elizabeth');
SELECT * FROM users;

CREATE OR REPLACE TABLE plans (
    plan_id INT,
    plan_name STRING,
    monthly_price INT
);
INSERT INTO plans VALUES
(10,'Basic',79),
(11,'Standard',129),
(12,'Premium',199),
(13,'Family',249),
(14,'Mobile',59);
SELECT * FROM plans;

CREATE OR REPLACE TABLE subscriptions (
    subscription_id INT,
    user_id INT,
    plan_id INT,
    start_date DATE
);
INSERT INTO subscriptions VALUES
(501,1,10,DATE'2026-01-15'),
(502,2,11,DATE'2026-02-01'),
(503,1,12,DATE'2026-03-10'),
(504,6,11,DATE'2026-03-20'),
(505,3,13,DATE'2026-04-05');
SELECT * FROM subscriptions;

CREATE OR REPLACE TABLE shows (
    show_id INT,
    show_title STRING,
    genre STRING
);
INSERT INTO shows VALUES
(701,'Comedy Hour','Comedy'),
(702,'Crime Time','Drama'),
(703,'Tech Tales','Documentary'),
(704,'Cooking Lab','Lifestyle'),
(706,'Wild Earth','Documentary');
SELECT * FROM shows;

CREATE OR REPLACE TABLE viewing_sessions (
    session_id INT,
    user_id INT,
    show_id INT,
    watch_minutes INT
);
INSERT INTO viewing_sessions VALUES
(901,1,701,45),
(902,2,703,30),
(903,1,702,60),
(904,7,701,20),
(905,3,705,90);
SELECT * FROM viewing_sessions;

SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM users AS A
INNER JOIN subscriptions AS B
ON A.user_id = B.user_id; 


SELECT A.subscription_id,
       A.user_id,
       B.plan_name,
       B.monthly_price
FROM subscriptions AS A
INNER JOIN plans AS B
ON A.plan_id = B.plan_id;

SELECT A.session_id,
       A.user_id,
       B.show_title,
       B.genre,
       A.watch_minutes
FROM viewing_sessions AS A
INNER JOIN shows AS B
ON A.show_id = B.show_id;

SELECT A.user_name,
       A.country,
       B.session_id,
       B.show_id,
       B.watch_minutes
FROM users AS A
INNER JOIN viewing_sessions AS B
ON A.user_id = B.user_id;

SELECT A.user_name,
       A.country,
       B.plan_name,
       B.monthly_price,
       C.start_date
FROM users AS A
INNER JOIN subscriptions AS C
ON A.user_id = C.user_id
INNER JOIN plans AS B
ON C.plan_id = B.plan_id;


SELECT A.plan_id,
       A.plan_name,
       B.subscription_id,
       B.user_id
FROM plans AS A
LEFT JOIN subscriptions AS B
ON A.plan_id = B.plan_id;

SELECT A.show_id,
       A.show_title,
       B.session_id,
       B.watch_minutes
FROM shows AS A
LEFT JOIN viewing_sessions AS B
ON A.show_id = B.show_id;

SELECT A.session_id,
       A.show_id,
       A.watch_minutes,
       B.user_id,
       B.user_name
FROM viewing_sessions AS A
LEFT JOIN users AS B
ON A.user_id = B.user_id;

SELECT A.user_name,
       A.country,
       B.plan_name,
       B.monthly_price
FROM users AS A
LEFT JOIN subscriptions AS C
ON A.user_id = C.user_id
LEFT JOIN plans AS B
ON C.plan_id = B.plan_id;

SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM users AS A
FULL OUTER JOIN subscriptions AS B
ON A.user_id = B.user_id;

SELECT A.plan_id,
       A.plan_name,
       B.subscription_id,
       B.user_id
FROM plans AS A
FULL OUTER JOIN subscriptions AS B
ON A.plan_id = B.plan_id;

SELECT A.show_id,
       A.show_title,
       B.session_id,
       B.watch_minutes
FROM shows AS A
FULL OUTER JOIN viewing_sessions AS B
ON A.show_id = B.show_id;

SELECT A.user_id,
       A.user_name,
       B.session_id,
       B.show_id,
       B.watch_minutes
FROM users AS A
FULL OUTER JOIN viewing_sessions AS B
ON A.user_id = B.user_id;

SELECT A.user_id,
       A.user_name,
       c.subscription_id,
       B.plan_id,
       B.plan_name
FROM users AS A
FULL OUTER JOIN subscriptions AS C
ON A.user_id = C.user_id
FULL OUTER JOIN plans AS B
ON C.plan_id = B.plan_id;

