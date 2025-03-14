CREATE SCHEMA netflix_data;

USE netflix_data;

CREATE TABLE netflix_titles
(
	show_id VARCHAR(20),
    type VARCHAR(255),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(255),
    date_added DATE,
    release_year INT,
    rating VARCHAR(50),
    duration VARCHAR(255),
    listed_in TEXT,
    description TEXT
);


-- Calls the data to ensure proper importation
SELECT *
FROM netflix_titles
LIMIT 10;


-- FINDING MISSING VALUES
SELECT 
    COUNT(*) AS missing_directors 
FROM netflix_titles 
WHERE director IS NULL OR director = '';

SELECT 
    COUNT(*) AS missing_cast 
FROM netflix_titles 
WHERE cast IS NULL OR cast = '';

SELECT 
    COUNT(*) AS missing_countries 
FROM netflix_titles 
WHERE country IS NULL OR country = '';


-- FILLING MISSING VALUES
UPDATE netflix_titles 
SET director = 'Unknown' 
WHERE director IS NULL AND show_id IS NOT NULL;

UPDATE netflix_titles 
SET cast = 'Unknown' 
WHERE cast IS NULL AND show_id IS NOT NULL;

UPDATE netflix_titles 
SET country = 'Unknown' 
WHERE country IS NULL AND show_id IS NOT NULL;


-- REMOVING DUPLICATES
SELECT title, type, release_year, COUNT(*)
FROM netflix_titles
GROUP BY title, type, release_year
HAVING COUNT(*) > 1;


-- STANDARDIZING THE DATA
UPDATE netflix_titles 
SET title = TRIM(title);

UPDATE netflix_titles
SET date_added = STR_TO_DATE(date_added, '%M %d, %Y');


-- FIXING DATA TYPES
DESCRIBE netflix_titles;

ALTER TABLE netflix_titles 
MODIFY COLUMN release_year INT;

ALTER TABLE netflix_titles 
MODIFY COLUMN date_added DATE;


-- DROPPING UNNECESSARY DATA
ALTER TABLE netflix_titles 
DROP COLUMN description;


