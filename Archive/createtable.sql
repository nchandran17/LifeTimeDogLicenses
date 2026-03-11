CREATE TABLE lifetime_dog_licenses (
 id INT PRIMARY KEY,
 license_type VARCHAR(100),
 breed VARCHAR(100),
 color VARCHAR(100),
 dog_name VARCHAR(100),
 owner_zip VARCHAR(20),
 exp_year INT,
 valid_date TIMESTAMP
);