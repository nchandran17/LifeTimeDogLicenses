WITH monthly_registrations AS
(SELECT DATE_TRUNC('month', valid_date) as reg_month, COUNT(*) AS num_regs
FROM lifetime_dog_licenses
GROUP BY reg_month
ORDER BY reg_month ASC),

first_derivative AS(
SELECT reg_month AS month, ROUND(COALESCE((num_regs::DECIMAL) - (LAG(num_regs) OVER(ORDER BY reg_month)), 1), 3)
AS growth_rate
FROM monthly_registrations)

SELECT month, ROUND(COALESCE((growth_rate::DECIMAL) - (LAG(growth_rate) OVER(ORDER BY month)), 1), 3)
AS momentum
FROM first_derivative

/*
Using the same concept for the first derivative to take the derivative of 
that and get the second derivative
*/