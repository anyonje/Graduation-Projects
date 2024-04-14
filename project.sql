SELECT *
FROM PortfolioProject..customer_data$
ORDER BY 3,4

SELECT id, age, gender, income, education, region, purchase_frequency, purchase_amount, product_category
FROM PortfolioProject..customer_data$
ORDER BY 1,2

--Looking at income vs Purchase amount
SELECT income, purchase_amount
FROM PortfolioProject..customer_data$
ORDER BY 1,2

--Education level with highest income
SELECT education, SUM(income) AS total_income
FROM PortfolioProject..customer_data$
GROUP BY education
ORDER BY total_income DESC

--Most Purchases by education level
SELECT education, COUNT(purchase_amount) AS total_purchases
FROM PortfolioProject..customer_data$
GROUP BY education
ORDER BY total_purchases DESC

--Total Income and Purchase amount by region
SELECT 
    region,
    SUM(income) AS total_income,
    SUM(purchase_amount) AS total_purchase_amount
FROM 
    PortfolioProject..customer_data$
GROUP BY 
    region
ORDER BY total_purchase_amount DESC


--Purchases by Gender
SELECT gender, COUNT(purchase_amount) AS purchase_count
FROM PortfolioProject..customer_data$
WHERE purchase_amount IS NOT NULL
GROUP BY gender
ORDER BY purchase_count DESC


--Average Purchase Amount by Gender and Education
SELECT gender, education, AVG(purchase_amount) AS avg_purchase_amount
FROM PortfolioProject..customer_data$
WHERE purchase_amount IS NOT NULL
GROUP BY gender, education

--age distribution of customers
SELECT 
    FLOOR(age / 10) * 10 AS age_group,
    COUNT(*) AS customer_count
FROM 
    PortfolioProject..customer_data$
GROUP BY 
    FLOOR(age / 10) * 10
ORDER BY 
    age_group

--top selling products
SELECT product_category, COUNT(*) AS total_purchases
FROM PortfolioProject..customer_data$
WHERE product_category IS NOT NULL
GROUP BY product_category
ORDER BY total_purchases DESC


   


