-- SQLite
-- SELECT name FROM artists


----------------------------------------------
-- COUNT the number of tracks in the database
-- that last less than 2 minutes

-- Hint (1 min = 60_000 milliseconds)
-- SELECT COUNT(*) FROM tracks WHERE tracks.milliseconds < 2 * 60000

----------------------------------------------
-- Let's get the first ten albums of the database, sorted alphabetically
-- LIMIT
-- SELECT title FROM albums ORDER BY title ASC LIMIT 30

----------------------------------------------

-- Fetch track and album information for tracks which contain ("love")
-- SELECT tracks.name, albums.title FROM  tracks
-- JOIN albums ON tracks.album_id = albums.id
-- WHERE tracks.name LIKE "%love%"


--Finally, let’s use what we’ve learned to do something a bit more advanced.
--In this assignment, we want to find the top five artists with the most tracks within the Rock genre.

SELECT artists.name, COUNT(*) AS track_count FROM artists
JOIN albums ON albums.artist_id = artists.id
JOIN tracks ON tracks.album_id = albums.id
JOIN genres ON tracks.genre_id = genres.id
WHERE genres.name = "Rock"
GROUP BY artists.name
ORDER BY track_count DESC
LIMIT 5


-- tables go in plural and columns in singular
