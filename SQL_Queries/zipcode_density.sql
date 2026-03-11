-- CREATE INDEX owner_zip_idx ON lifetime_dog_licenses (owner_zip);

SELECT owner_zip, COUNT(*) as num_licenses_in_zip
FROM lifetime_dog_licenses
WHERE owner_zip IS NOT NULL
GROUP BY owner_zip
ORDER BY num_licenses_in_zip DESC
-- Here we are doing someting very similar to the top 10 breeds
-- Why do we need an index here even though we are not running a function
-- on owner_index? Because if a column is not a primary key, then sql does
-- not automatically index it.