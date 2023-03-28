-- Here is an Event that increases the price of each subscription every year due to inflation.
CREATE EVENT inflation
ON SCHEDULE EVERY 1 YEAR
STARTS '2023-01-01 00:00:00'
DO
 UPDATE SubscriptionType SET Price = Price * 1.05;



-- Another UPDATE statement that switches the subscription of a user to YOUNG if he is between 18 and 25 years old. It does it only if the user has not already the Young subscription (3) or the Family subscription (2).
UPDATE User SET SubID = 3
WHERE AGE(UBirthDate) BETWEEN 18 AND 25
AND (SubID != 2 AND SubID != 3);


-- Also here is the opposite command that downgrade the subscription back to the free subscription (0) if the user is not between 18 and 25 years old anymore and had the Young subscription (3):
UPDATE User SET SubID = 0
WHERE AGE(UBirthDate) NOT BETWEEN 18 AND 25
AND (SubId = 3);


-- Finally, here is an event with an update statement that gives a 1 month free premium subscription for all free users accounts when it's their birthday.
CREATE EVENT IF NOT EXISTS event_subscription_promotion ON SCHEDULE EVERY 1 DAY STARTS CURRENT_TIMESTAMP
   DO
   BEGIN

       DECLARE birthday DATE;
       DECLARE pUserID VARCHAR(5);
       DECLARE oldSubID VARCHAR(1);

       SET birthday = CURDATE();

       -- Find users whose birthday is today and who have a free subscription
       SELECT UserID, SubID
       INTO pUserID, oldSubID
       FROM User
       WHERE DAY(UBirthDate) = DAY(birthday)
         AND MONTH(UBirthDate) = MONTH(birthday)
         AND SubID = '0';

       IF pUserID IS NOT NULL THEN
           -- Give user a free Premium subscription for one month
           UPDATE User SET SubID = '1' WHERE UserID = pUserID;

           -- Schedule a job to run in 1 month that will update the subscription back to the old subscription
           SET @sql = CONCAT('CREATE EVENT IF NOT EXISTS event_', pUserID, ' ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MONTH DO UPDATE User SET SubID = ''', oldSubID, ''' WHERE UserID = ''', pUserID, '''');
           PREPARE stmt FROM @sql; -- stmt is variable used in prepared statements
           EXECUTE stmt;
           DEALLOCATE PREPARE stmt;
       END IF;
   END;










