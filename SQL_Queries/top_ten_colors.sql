-- CREATE INDEX color_lower_idx ON lifetime_dog_licenses (LOWER(color));

SELECT LOWER(color) as color, COUNT(*) as num_of_color
FROM lifetime_dog_licenses
WHERE color IS NOT NULL
GROUP BY LOWER(color)
ORDER BY num_of_color DESC
LIMIT 10


-- We need to do the same index and Lower function trick to keep things
-- quick and accurate here. We are only getting the top 10 because instead
-- of trying to find each color, we want to know in general what 
-- colors people prefer
