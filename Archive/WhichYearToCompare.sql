SELECT EXTRACT(YEAR FROM valid_date) as year, COUNT(*) as num_registrations
FROM lifetime_dog_licenses
GROUP BY year 
ORDER BY num_registrations DESC
LIMIT 1


/*
We are using extract here because this is just a query to figure out the
highest number of registrations in a single year. We dont use date trunc
because we are not going to use this query with python or anything where
the date format is important. 
I'm not doing any indexing because this is something we only run once to
figure out something we want to know.
*/