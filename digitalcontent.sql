CREATE DATABASE DigitalContentDB;
USE DigitalContentDB;

CREATE TABLE Content_Performance (
    Article_ID INT PRIMARY KEY,
    Brand VARCHAR(100),
    Category VARCHAR(100),
    Publish_Date DATETIME,
    Views INT,
    Avg_Time_Spent FLOAT,
    Shares INT,
    Page_Revenue DECIMAL(10,2)
);

CREATE TABLE Subscription_Funnel (
    User_ID INT PRIMARY KEY,
    Brand VARCHAR(100),
    Country VARCHAR(100),
    Page_Visited VARCHAR(200),
    Subscribed CHAR(1),
    Subscription_Revenue DECIMAL(10,2)
);

CREATE TABLE Traffic_Source (
    Brand VARCHAR(100),
    Date DATE,
    Direct INT,
    Organic INT,
    Social INT,
    Referral INT,
    Email INT,
    Total_Traffic INT
);

SELECT * FROM digitalcontentdb.ba_200_row_dataset;
SELECT * FROM digitalcontentdb.content_performance;


UPDATE Content_Performance
SET Brand = TRIM(Brand), Category = TRIM(Category);

UPDATE Subscription_Funnel
SET Subscribed = UPPER(TRIM(Subscribed));

SELECT COUNT(*) FROM Content_Performance;

SELECT SUM(Views) AS Total_Views
FROM Content_Performance;

SELECT AVG(Avg_Time_Spent)
FROM Content_Performance;

SELECT *
FROM Content_Performance
ORDER BY Views DESC
LIMIT 10;

SELECT Category,
       AVG(Avg_Time_Spent) AS Avg_Engagement,
       SUM(Views) AS Total_Views
FROM Content_Performance
GROUP BY Category
ORDER BY Avg_Engagement DESC;

SELECT Article_ID, Views, Page_Revenue, Avg_Time_Spent
FROM Content_Performance;

SELECT 
    HOUR(Publish_Date) AS Publish_Hour,
    Category,
    SUM(Views) AS Total_Views
FROM Content_Performance
GROUP BY Publish_Hour, Category;


