SELECT breed, color, dog_name, owner_zip
FROM dog_licenses_2020
WHERE (breed, color, dog_name, owner_zip) IN(
	SELECT breed, color, dog_name, owner_zip
	FROM lifetime_dog_licenses
	WHERE EXTRACT(YEAR FROM valid_date) = 2021
)

/*
We are using essentially tuple comparison here. Important to note that in 
the subquery in the where in clause, we have to specifically select
the columns we want to compare to. Because if there is a variation between
the tables in terms of any column, the comparison wont work. 
*/


