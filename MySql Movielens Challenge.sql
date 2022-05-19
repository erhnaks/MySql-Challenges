use movielens;

-- Q-1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.

SELECT title, release_date FROM movies WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01'ORDER BY release_date;

-- Q-2 Without using LIMIT, list the titles of the movies with the lowest average rating.

SELECT title, AVG(rating) AS `Average Rating` FROM movies
JOIN ratings ON movies.id = ratings.movie_id
GROUP BY movies.title
HAVING AVG(rating)= (
	SELECT MIN(avg_rating)
    FROM (
			SELECT avg(rating) AS avg_rating
            FROM ratings
            GROUP BY movie_id
            ) AS table1
		)
	ORDER BY AVG(rating);


-- Q-3 List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

SELECT DISTINCT *  FROM movies AS m
JOIN genres_movies AS g_m ON m.id = g_m.movie_id
JOIN ratings AS r ON m.id = r.movie_id
WHERE g_m.genre_id = (SELECT id FROM genres WHERE name = 'Sci-Fi')
AND r.user_id IN (
SELECT id FROM users WHERE gender = 'M' AND age = '24' AND occupation_id =(
SELECT id FROM occupations WHERE name = 'Student'))
AND r.rating = '5' order by title;

-- Q-4 List the unique titles of each of the movies released on the most popular release day.

-- SELECT DISTINCT title, release_date, COUNT(release_date) FROM movies GROUP BY title ORDER BY COUNT(release_date) DESC;

SELECT title FROM movies WHERE release_date = (
SELECT release_date FROM movies
GROUP BY release_date
ORDER BY COUNT(movies.id) DESC
LIMIT 1
);


-- Q-5  Find the total number of movies in each genre; list the results in ascending numeric order.

SELECT g.name, COUNT(m.title)
FROM genres AS g
JOIN genres_movies AS g_m ON g.id=g_m.genre_id
JOIN movies AS m ON g_m.movie_id=m.id
GROUP BY g.Name
ORDER BY COUNT(m.title) ASC
;



