SELECT (CASE WHEN license_type LIKE '%Male%' THEN 'Male' 
WHEN license_type LIKE '%Female%' THEN 'Female' 
ELSE 'Unkown' END) AS gender, COUNT(*) num_gender
FROM lifetime_dog_licenses
GROUP BY gender;

-- in this case we are using a case when because we dont have a strict
-- gender column, so we have to pull it from license_type
-- we are not using an index here because we only have three buckets so it
-- is probably faster for the computer to just do an O(n) scan
-- IMPORTANT NOTE: We can do GROUP BY gender in this case because we are in
-- postgres. In SQL server and Oracle SQL we cannot and have to use the 
-- entire CASE WHEN statement in our group by to make this work. Postgres
-- is 'smart'.