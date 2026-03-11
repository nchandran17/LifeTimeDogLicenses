-- CREATE INDEX date_idx ON lifetime_dog_licenses (DATE_TRUNC('month', valid_date));

SELECT DATE_TRUNC('month', valid_date) as reg_month, COUNT(*) AS num_regs
FROM lifetime_dog_licenses
GROUP BY reg_month
ORDER BY reg_month ASC
/*
We are using date_trunc to make every date essentially the first day of the month
so we can group them together, then just do a count based on the group by
We also use an index so the computer does not have to do any expensive sorting
algorithms during group by. As always its important to remember that 
once the index is created
it should be commented out because it will throw an error because the index 
is already created.
*/
