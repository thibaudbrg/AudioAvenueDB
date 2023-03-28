DELIMITER //
CREATE PROCEDURE getNumSongsByCountry(IN country VARCHAR(255), OUT numSongs INT)
BEGIN
	SELECT COUNT(*) INTO numSongs
	FROM Song s
       NATURAL JOIN Artist a
       NATURAL JOIN Country c
	WHERE c.countryName = country;
END;

DELIMITER ;

CALL getNumSongsByCountry('United Kingdom', @numSongs);
SELECT @numSongs;

