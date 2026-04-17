SELECT * FROM crime_data LIMIT 10;

--top crime states
SELECT state, SUM(crime_count) AS total_crime
FROM crime_data
GROUP BY state
ORDER BY total_crime DESC
LIMIT 5;

--yearwise trend
SELECT year, SUM(crime_count) AS total_crime
FROM crime_data
GROUP BY year
ORDER BY year;

--top districts
SELECT district, SUM(crime_count) AS total_crime
FROM crime_data
GROUP BY district
ORDER BY total_crime DESC
LIMIT 5;

--crime rate
SELECT state,
SUM(crime_count)/SUM(population) AS crime_rate
FROM crime_data
GROUP BY state
ORDER BY crime_rate DESC;

--filter latest year
SELECT * FROM crime_data
WHERE year = 2023;

--aggregation
SUM(crime_count)
AVG(crime_count)

--views
CREATE VIEW state_crime_summary AS
SELECT state, SUM(crime_count) AS total_crime
FROM crime_data
GROUP BY state;

SELECT * FROM state_crime_summary;

--window functions
SELECT state, crime_count,
RANK() OVER (ORDER BY crime_count DESC) AS rank
FROM crime_data;

--index
CREATE INDEX idx_state ON crime_data(state);