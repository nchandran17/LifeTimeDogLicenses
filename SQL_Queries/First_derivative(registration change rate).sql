
WITH monthly_registrations AS
(SELECT DATE_TRUNC('month', valid_date) as reg_month, COUNT(*) AS num_regs
FROM lifetime_dog_licenses
GROUP BY reg_month
ORDER BY reg_month ASC)

SELECT reg_month AS month, ROUND(COALESCE((num_regs::DECIMAL) - (LAG(num_regs) OVER(ORDER BY reg_month)), 1), 3)
AS growth_rate
FROM monthly_registrations

/*
Basically what I am doing here is I am taking my query to find 
the monthly registrations and finding the derivative. It's pretty simple,
do the current month number of registrations divided by the previous month
I force num_regs to be a decimal so i will get a decimal value when i divide
and i use lag to get the previous row. Because it is a window function, 
we just do the order by in the OVER clause. COALESCE is for the first month
because it will not have a previous month so we just start it at 1. we round 
to three decimals to maintain good precision while not making our data too 
large. Also since monthly registrations is already ordered by month, 
the order by outside the CTE is O(n). We also already created the index
for reg_month in the previous query, so that saves us compute power here
*/