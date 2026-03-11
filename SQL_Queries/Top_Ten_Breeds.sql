-- CREATE INDEX idx_breed_lower ON lifetime_dog_licenses (LOWER(breed));

SELECT LOWER(breed) as breed, COUNT(*) as num_of_breed
FROM lifetime_dog_licenses
WHERE breed IS NOT NULL
GROUP BY LOWER(breed)
ORDER BY num_of_breed DESC
LIMIT 10;

-- This is better because it accounts for two extraneous cases
-- It does not include null cases
-- it uses the lower function to deal with case issues
-- importantly, lower can significantly impact runtime because 
-- now the computer cannot just use the index of a breed, instead
-- it has to do an expensive sort
-- so we create an index for LOWER(breed) to reduce runtime
-- NOTE: If you run the create index once, it will throw an error if you
-- run it again. So just comment it out and the index is always there now
-- This is O(logN) because of the index, as we 
-- dont have to use a full table scan