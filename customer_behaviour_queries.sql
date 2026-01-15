use walmart_db;

-- Business Problems
-- Q1.Find the difference payment method of transactions, number of Quantity sold?

SELECT * FROM walmart;
SELECT payment_method,ROUND(SUM(total_amount),2) AS total_amount FROM walmart
GROUP BY payment_method;

-- Q2.Find the different payment method and number of transactions, number of quantity sold?

SELECT payment_method,count(total_amount) as no_of_transaction,
sum(quantity) as no_of_quantity from walmart group by payment_method;

-- Q3.Find the highesh-rated category in each branch, displaying the branch category AVG RATING

select * from 
(
select branch, category ,round(avg(rating),2) as avg_rating,
RANK() OVER( PARTITION BY branch order by round(avg(rating),2) DESC ) as branch_rank
from walmart 
group by branch,category 
) as t
Where branch_rank = 1;


-- Q4. Identity the busiest day of each branch based on the number of transactions?

SELECT *
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER (
            PARTITION BY branch 
            ORDER BY COUNT(*) DESC
        ) AS rank_order
    FROM walmart
    GROUP BY branch, day_name
) AS t
WHERE rank_order = 1;

-- Q5. Select total quantity sold by payment method?

select payment_method, sum(quantity) as total_quantity 
from walmart 
group by payment_method;

-- Q6. Analyze category avg ratings,min ratings,max ratings  by city?

select category, city , round(avg(rating),2) as avg_rating , Min(rating) as min_rating, Max(rating) as max_rating
from walmart 
group by category, city;

-- Q7.Calculate total profit by category?

select category, sum(total_amount* profit_margin) as profit,
sum(total_amount) as total_revenue
from walmart 
group by category;

-- Q8.Determine the most common payment method per branch ?

select * from walmart;
with cte as
(
select branch,payment_method,count(*) as total_transactions,
RANK() OVER(Partition by branch order by count(*) DESC) as rank_wise
from walmart group by branch,payment_method
)
select * from cte where rank_wise = 1;

-- Q9.  How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?

select branch,
case
when hour(time)< 12  then 'Morning Shift'
when hour(time) between  12 and 17 then 'afternoon Shift'
else 'evening shift'
END  Shift_type , count(*) as total_transaction 
from walmart 
group by  branch,shift_type
order by branch,total_transaction desc ;

-- Q10. Which five branches experienced the largest decrease in revenue compared to the previous year?

WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total_amount) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total_amount) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;
 
