-- This function can be used to retrieve the number of artists that have produced songs in a given genre.


DELIMITER //
CREATE FUNCTION Artists_by_genre(genre_name VARCHAR(30)) RETURNS INT
BEGIN
          	DECLARE   genre_id INT;
          	DECLARE num_artists INT;
          	SELECT genreId INTO genre_id FROM Genre WHERE genreName = genre_name;
          	SELECT COUNT(distinct artistId) into num_artists FROM PRODUCE
          	WHERE songId IN (SELECT songId FROM Song where genreId = genre_id);
          	RETURN num_artists;
END;


DELIMITER ;

SELECT GenreName, Artists_by_genre(GenreName) AS Count From genre;


-- this function returns an age from a date
CREATE FUNCTION AGE ( vDate DATE) RETURNS INTEGER
   RETURN TIMESTAMPDIFF(YEAR, vDate, CURDATE());

