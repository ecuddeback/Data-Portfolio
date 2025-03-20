-- Exploratory Analysis of the Cleaned Netflix Data 
-- Query to determine the distribution between Movies and TV Shows
SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;


-- Query to analyze the distribution of content 
SELECT release_year, COUNT(*) AS count
FROM netflix_titles
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;


-- Query to evaluate the distribution of content ratings
SELECT rating, COUNT(*) AS count
FROM netflix_titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY count DESC;
