-- CREATE INDEX idx_year ON lifetime_dog_licenses (DATE_TRUNC('Year', valid_date));


SELECT breed, DATE_TRUNC('Year', valid_date) as year, COUNT(*) 
as num_breed_in_year
FROM lifetime_dog_licenses
GROUP BY breed, year
ORDER BY breed, year ASC


/*
Here we are grouping by both breed and year. SQL knows to create a bucket for
each unique combination of this group by and has a counter for it in memory
which is why COUNT(*) works here. We order by breed and year so we dont have 
a jumble of different breeds and years when we look at our data. the index is 
for the run time of the group by.
*/