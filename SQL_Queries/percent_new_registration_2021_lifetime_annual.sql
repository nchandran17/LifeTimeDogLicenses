WITH all_licenses_2021 AS
(SELECT breed, color, dog_name, owner_zip, 0 as annual_or_lifetime
FROM dog_licenses_2021
WHERE EXTRACT(YEAR FROM valid_date) = 2021
UNION ALL
SELECT breed, color, dog_name, owner_zip, 1 as annual_or_lifetime
FROM lifetime_dog_licenses
WHERE EXTRACT(YEAR FROM valid_date) = 2021)	


SELECT breed, ROUND((COUNT(*)::DECIMAL)/(SUM(COUNT(*)) OVER(PARTITION BY breed)), 2)
AS percent_val, (CASE WHEN annual_or_lifetime = 1 THEN 'lifetime percentage'
ELSE 'annual_percentage' END) as percent_type
FROM(
SELECT breed, color, dog_name, owner_zip, annual_or_lifetime
FROM all_licenses_2021
WHERE (breed, color, dog_name, owner_zip) NOT IN(
	SELECT breed, color, dog_name, owner_zip
	FROM dog_licenses_2020
)
)
GROUP BY breed, annual_or_lifetime



/*
Here i am using UNION ALL to merge two tables together and adding
a number to distinguish which table they are from in a cte, then using 
a subquery for WHERE NOT IN and a typical group by to get a counter value
and using sum as a window function in order to make the math work.
*/