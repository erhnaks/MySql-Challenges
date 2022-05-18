use movielens;

-- Q-1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.

SELECT title, release_date FROM movies WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01'ORDER BY release_date;

-- Q-2 Without using LIMIT, list the titles of the movies with the lowest average rating.

SELECT m.title, AVG(r.rating)
FROM movies AS m
JOIN ratings AS r ON m.id=r.movie_id
GROUP BY m.title
ORDER BY AVG(r.rating);

-- Q-3 List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

-- Passed This> Spent enough time without a solution, will come back to it later.

-- Q-4 List the unique titles of each of the movies released on the most popular release day.

SELECT DISTINCT title, release_date, COUNT(release_date) FROM movies GROUP BY title ORDER BY COUNT(release_date) DESC;

-- Q-5  Find the total number of movies in each genre; list the results in ascending numeric order.

SELECT g.name, COUNT(m.title)
FROM genres AS g
JOIN genres_movies AS g_m ON g.id=g_m.genre_id
JOIN movies AS m ON g_m.movie_id=m.id
GROUP BY g.Name
ORDER BY COUNT(m.title) ASC
;



