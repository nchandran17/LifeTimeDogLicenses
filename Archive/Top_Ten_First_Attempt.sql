SELECT breed, COUNT(*) as num_of_breed
FROM lifetime_dog_licenses
GROUP BY breed
ORDER BY num_of_breed DESC
LIMIT 10
-- Why are we doing things this way?
-- We want to group by, because in memory that 
-- creates a counter for each bucket
-- this significantly reduces the amount of work we have to do