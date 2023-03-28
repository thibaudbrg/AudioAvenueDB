-- This is a trigger that will run before each insert on the PlaylistContains table. It checks if the new row being inserted already exists in the table by checking if there is a row with the same playlistId and songId.
DELIMITER //
CREATE TRIGGER before_playlist_contains_insert
BEFORE INSERT ON PlaylistContains
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM PlaylistContains
           	WHERE playlistId = NEW.playlistId AND songId = NEW.songId) THEN
    	SIGNAL SQLSTATE 'HY000'
    	SET MYSQL_ERRNO = 1525,
    	MESSAGE_TEXT = 'Song already exists in playlist';
	END IF;
END;

DELIMITER ;



-- This is a trigger that will run before each insert on the User table. It checks that the new user is older than 13 years old .

DELIMITER //
CREATE TRIGGER before_user_insert
BEFORE INSERT ON User
FOR EACH ROW
BEGIN
   DECLARE age INT;
   SET age = TIMESTAMPDIFF(YEAR, NEW.UBirthDate, NOW());
   if age <13 then
       SIGNAL SQLSTATE 'HY000'
       SET MYSQL_ERRNO = 1525,
       MESSAGE_TEXT = 'You must be at least 13 years old to create an account';
   END IF;

   end ;
DELIMITER ;