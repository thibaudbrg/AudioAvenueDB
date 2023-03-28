-- User:
  SELECT * FROM User;
--    Country
  SELECT * FROM Country;
--    Artist
  SELECT * FROM Artist;
--    Genre
  SELECT * FROM Genre;
--    Song
  SELECT * FROM Song;
--    Album
  SELECT * FROM Album;
--    PlayList
  SELECT * FROM PlayList;
--    SubscriptionType;
  SELECT * FROM PlaylistContains;
--    PlaylistContains;
  SELECT * FROM PlaylistContains;
--    Produce
  SELECT * FROM Produce;



-- To show the description of the POP genre:
  SELECT GenreDesc FROM Genre
    WHERE genreName = "Pop";

-- To show the description of the artist with Billie as first name:
  SELECT artDesc FROM Artist
    WHERE artFirstName = "Billie";

-- To show the name and price of all subscription types where the price is between 50 and 80:
  SELECT SubName , price FROM SubscriptionType
    WHERE Price > 50 AND Price > 80;

-- To show each artistID, artist first and second names and the number of songs produced by each of these artists:
  SELECT ArtistID, artfirstname, artlastname, COUNT(songID) AS SongCount
  FROM Produce NATURAL JOIN Artist
  WHERE Artist.ArtistID = Produce.ArtistID
  GROUP BY ArtistID;

-- To show countryName , countryID and corresponding number of artists:
  SELECT CountryName, COUNT(artistID) AS ArtistCount
  FROM Artist NATURAL JOIN Country
  WHERE country.countryid = artist.countryid
  GROUP BY CountryName
   ORDER BY  ArtistCount;

-- To show subscription types and number of users of that type and money earned from each subscription type:
   SELECT SubName AS Sname, COUNT(userID),
      (SELECT CASE Sname
         WHEN "Free"
         THEN (SELECT PRICE FROM SubscriptionType WHERE SubName = sname)
         WHEN "Premium"
         THEN COUNT(userID)*(SELECT Price FROM SubscriptionType WHERE SubName
         = sname)
         ELSE count(userID)*(SELECT PRICE FROM SubscriptionType WHERE SubName =
         sname)
         END)
   FROM SubscriptionType NATURAL JOIN User
   WHERE user.subid = subscriptiontype.subid
      group by SubName;

-- To create function to calculate age from birth date in years:
   CREATE FUNCTION getAge ( vDate DATE) RETURNS INTEGER
   RETURN TIMESTAMPDIFF(YEAR, vDate, CURDATE());

-- To classify users with respect to their age:
   SELECT CASE
          WHEN GetAge(UBirthDate) BETWEEN 13 AND 20 THEN '13-20'
           WHEN GetAge(UBirthDate) BETWEEN 20 AND 30 THEN '20-30'
           WHEN GetAge(UBirthDate) BETWEEN 30 AND 40 THEN '30-50'
           ELSE '50+'
       END AS AgeRange,
       COUNT(userID) AS UserCount
    FROM User
    GROUP BY AgeRange;






