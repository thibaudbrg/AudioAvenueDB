DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
USE music;

DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Playlist;


CREATE TABLE SubscriptionType
(
    SubID   VARCHAR(1),
    SubName VARCHAR(20),
    SubDesc TINYTEXT,
    Price   DOUBLE UNSIGNED,
    PRIMARY KEY (SubID)
);

CREATE TABLE Country
(
    CountryID   VARCHAR(2),
    CountryName VARCHAR(50),
    PRIMARY KEY (CountryID)
);

CREATE TABLE User
(
    UserID     VARCHAR(5),
    CountryID  VARCHAR(2),
    Username   VARCHAR(20),
    UFirstName VARCHAR(20),
    ULastName  VARCHAR(20),
    UBirthDate DATE,
    City       VARCHAR(20),
    ZipCode    VARCHAR(10),
    SubID      VARCHAR(1),
    PRIMARY KEY (UserID),
    FOREIGN KEY (CountryID) REFERENCES Country (CountryID) ON DELETE SET NULL,
    FOREIGN KEY (SubID) REFERENCES SubscriptionType (SubID) ON DELETE SET NULL
);

CREATE TABLE Artist
(
    ArtistID     VARCHAR(5),
    ArtFirstName VARCHAR(20),
    ArtLastName  VARCHAR(20),
    ArtDesc      TINYTEXT,
    ArtBirthDate DATE,
    CountryID    VARCHAR(2),
    PRIMARY KEY (ArtistID),
    FOREIGN KEY (CountryID) REFERENCES Country (CountryID) ON DELETE SET NULL
);

CREATE TABLE Genre
(
    GenreID   VARCHAR(5),
    GenreName VARCHAR(20),
    GenreDesc TEXT,
    PRIMARY KEY (GenreID)
);


CREATE TABLE Album
(
    AlbumID     VARCHAR(5),
    AlbumName   VARCHAR(20),
    ReleaseDate DATE,
    ArtistID    VARCHAR(5),
    PRIMARY KEY (AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID) ON DELETE SET NULL
);

CREATE TABLE Song
(
    SongID   VARCHAR(5),
    SongName VARCHAR(15),
    GenreID  VARCHAR(5),
    Duration TIME,
    AlbumID  VARCHAR(30), # TODO Remettre 5 car c'est censé être un ID pas la AlbumName
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID) REFERENCES Genre (GenreID) ON DELETE SET NULL,
    FOREIGN KEY (AlbumID) REFERENCES Album (AlbumID) ON DELETE SET NULL
);


CREATE TABLE Playlist
(
    PlaylistID   VARCHAR(5),
    PlaylistName VARCHAR(20),
    UserID       VARCHAR(5),
    PlaylistDesc TINYTEXT,
    PRIMARY KEY (PlaylistID),
    FOREIGN KEY (UserID) REFERENCES User (UserID) ON DELETE CASCADE
);

CREATE TABLE Produce
(
    ArtistID       VARCHAR(5),
    SongID         VARCHAR(5),
    ProductionDate DATE,
    PRIMARY KEY (ArtistID, SongID),
    FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID) ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song (SongID) ON DELETE CASCADE
);

CREATE TABLE PlaylistContains
(
    SongID     VARCHAR(5),
    PlaylistID VARCHAR(5),
    AddDate    DATE,
    PRIMARY KEY (SongID, PlaylistID),
    FOREIGN KEY (SongID) REFERENCES Song (SongID) ON DELETE CASCADE,
    FOREIGN KEY (PlaylistID) REFERENCES Playlist (PlaylistID) ON DELETE CASCADE
);



INSERT INTO SubscriptionType
VALUES (0, 'Free', 'A basic free subscription that allows you to play music but with ads', 0),
       (1, 'Premium', 'Premium account allows you to stream an unlimited time with an incredible quality and no ads',
        70),
       (2, 'Family',
        'A perfect combo if you need to have several premium accounts for all the members of your family. Up to 5 accounts',
        100);

INSERT INTO Country
VALUES ('AF', 'Afghanistan'),
       ('AX', 'Aland Islands'),
       ('AL', 'Albania'),
       ('DZ', 'Algeria'),
       ('AS', 'American Samoa'),
       ('AD', 'Andorra'),
       ('AO', 'Angola'),
       ('AI', 'Anguilla'),
       ('AQ', 'Antarctica'),
       ('AG', 'Antigua and Barbuda'),
       ('AR', 'Argentina'),
       ('AM', 'Armenia'),
       ('AW', 'Aruba'),
       ('AU', 'Australia'),
       ('AT', 'Austria'),
       ('AZ', 'Azerbaijan'),
       ('BS', 'Bahamas'),
       ('BH', 'Bahrain'),
       ('BD', 'Bangladesh'),
       ('BB', 'Barbados'),
       ('BY', 'Belarus'),
       ('BE', 'Belgium'),
       ('BZ', 'Belize'),
       ('BJ', 'Benin'),
       ('BM', 'Bermuda'),
       ('BT', 'Bhutan'),
       ('BO', 'Bolivia'),
       ('BQ', 'Bonaire, Sint Eustatius and Saba'),
       ('BA', 'Bosnia and Herzegovina'),
       ('BW', 'Botswana'),
       ('BV', 'Bouvet Island'),
       ('BR', 'Brazil'),
       ('IO', 'British Indian Ocean Territory'),
       ('BN', 'Brunei Darussalam'),
       ('BG', 'Bulgaria'),
       ('BF', 'Burkina Faso'),
       ('BI', 'Burundi'),
       ('KH', 'Cambodia'),
       ('CM', 'Cameroon'),
       ('CA', 'Canada'),
       ('CV', 'Cape Verde'),
       ('KY', 'Cayman Islands'),
       ('CF', 'Central African Republic'),
       ('TD', 'Chad'),
       ('CL', 'Chile'),
       ('CN', 'China'),
       ('CX', 'Christmas Island'),
       ('CC', 'Cocos (Keeling) Islands'),
       ('CO', 'Colombia'),
       ('KM', 'Comoros'),
       ('CG', 'Congo'),
       ('CD', 'Congo, the Democratic Republic of the'),
       ('CK', 'Cook Islands'),
       ('CR', 'Costa Rica'),
       ('CI', 'Cote dIvoire'),
       ('HR', 'Croatia'),
       ('CU', 'Cuba'),
       ('CW', 'Curacao'),
       ('CY', 'Cyprus'),
       ('CZ', 'Czech Republic'),
       ('DK', 'Denmark'),
       ('DJ', 'Djibouti'),
       ('DM', 'Dominica'),
       ('DO', 'Dominican Republic'),
       ('EC', 'Ecuador'),
       ('EG', 'Egypt'),
       ('SV', 'El Salvador'),
       ('GQ', 'Equatorial Guinea'),
       ('ER', 'Eritrea'),
       ('EE', 'Estonia'),
       ('ET', 'Ethiopia'),
       ('FK', 'Falkland Islands (Malvinas)'),
       ('FO', 'Faroe Islands'),
       ('FJ', 'Fiji'),
       ('FI', 'Finland'),
       ('FR', 'France'),
       ('GF', 'French Guiana'),
       ('PF', 'French Polynesia'),
       ('TF', 'French Southern Territories'),
       ('GA', 'Gabon'),
       ('GM', 'Gambia'),
       ('GE', 'Georgia'),
       ('DE', 'Germany'),
       ('GH', 'Ghana'),
       ('GI', 'Gibraltar'),
       ('GR', 'Greece'),
       ('GL', 'Greenland'),
       ('GD', 'Grenada'),
       ('GP', 'Guadeloupe'),
       ('GU', 'Guam'),
       ('GT', 'Guatemala'),
       ('GG', 'Guernsey'),
       ('GN', 'Guinea'),
       ('GW', 'Guinea-Bissau'),
       ('GY', 'Guyana'),
       ('HT', 'Haiti'),
       ('HM', 'Heard Island and McDonald Islands'),
       ('VA', 'Holy See (Vatican City State)'),
       ('HN', 'Honduras'),
       ('HK', 'Hong Kong'),
       ('HU', 'Hungary'),
       ('IS', 'Iceland'),
       ('IN', 'India'),
       ('ID', 'Indonesia'),
       ('IR', 'Iran, Islamic Republic of'),
       ('IQ', 'Iraq'),
       ('IE', 'Ireland'),
       ('IM', 'Isle of Man'),
       ('IL', 'Israel'),
       ('IT', 'Italy'),
       ('JM', 'Jamaica'),
       ('JP', 'Japan'),
       ('JE', 'Jersey'),
       ('JO', 'Jordan'),
       ('KZ', 'Kazakhstan'),
       ('KE', 'Kenya'),
       ('KI', 'Kiribati'),
       ('KP', 'Korea, Democratic Peoples Republic of'),
       ('KR', 'Korea, Republic of'),
       ('KW', 'Kuwait'),
       ('KG', 'Kyrgyzstan'),
       ('LA', 'Lao Peoples Democratic Republic'),
       ('LV', 'Latvia'),
       ('LB', 'Lebanon'),
       ('LS', 'Lesotho'),
       ('LR', 'Liberia'),
       ('LY', 'Libya'),
       ('LI', 'Liechtenstein'),
       ('LT', 'Lithuania'),
       ('LU', 'Luxembourg'),
       ('MO', 'Macao'),
       ('MK', 'Macedonia, the former Yugoslav Republic of'),
       ('MG', 'Madagascar'),
       ('MW', 'Malawi'),
       ('MY', 'Malaysia'),
       ('MV', 'Maldives'),
       ('ML', 'Mali'),
       ('MT', 'Malta'),
       ('MH', 'Marshall Islands'),
       ('MQ', 'Martinique'),
       ('MR', 'Mauritania'),
       ('MU', 'Mauritius'),
       ('YT', 'Mayotte'),
       ('MX', 'Mexico'),
       ('FM', 'Micronesia, Federated States of'),
       ('MD', 'Republic of Moldova'),
       ('MC', 'Monaco'),
       ('MN', 'Mongolia'),
       ('ME', 'Montenegro'),
       ('MS', 'Montserrat'),
       ('MA', 'Morocco'),
       ('MZ', 'Mozambique'),
       ('MM', 'Myanmar'),
       ('NA', 'Namibia'),
       ('NR', 'Nauru'),
       ('NP', 'Nepal'),
       ('NL', 'Netherlands'),
       ('NC', 'New Caledonia'),
       ('NZ', 'New Zealand'),
       ('NI', 'Nicaragua'),
       ('NE', 'Niger'),
       ('NG', 'Nigeria'),
       ('NU', 'Niue'),
       ('NF', 'Norfolk Island'),
       ('MP', 'Northern Mariana Islands'),
       ('NO', 'Norway'),
       ('OM', 'Oman'),
       ('PK', 'Pakistan'),
       ('PW', 'Palau'),
       ('PS', 'Palestine, State of'),
       ('PA', 'Panama'),
       ('PG', 'Papua New Guinea'),
       ('PY', 'Paraguay'),
       ('PE', 'Peru'),
       ('PH', 'Philippines'),
       ('PN', 'Pitcairn'),
       ('PL', 'Poland'),
       ('PT', 'Portugal'),
       ('PR', 'Puerto Rico'),
       ('QA', 'Qatar'),
       ('RE', 'Réunion'),
       ('RO', 'Romania'),
       ('RU', 'Russian Federation'),
       ('RW', 'Rwanda'),
       ('BL', 'Saint Barthélemy'),
       ('SH', 'Saint Helena, Ascension and Tristan da Cunha'),
       ('KN', 'Saint Kitts and Nevis'),
       ('LC', 'Saint Lucia'),
       ('MF', 'Saint Martin (French part)'),
       ('PM', 'Saint Pierre and Miquelon'),
       ('VC', 'Saint Vincent and the Grenadines'),
       ('WS', 'Samoa'),
       ('SM', 'San Marino'),
       ('ST', 'Sao Tome and Principe'),
       ('SA', 'Saudi Arabia'),
       ('SN', 'Senegal'),
       ('RS', 'Serbia'),
       ('SC', 'Seychelles'),
       ('SL', 'Sierra Leone'),
       ('SG', 'Singapore'),
       ('SX', 'Sint Maarten (Dutch part)'),
       ('SK', 'Slovakia'),
       ('SI', 'Slovenia'),
       ('SB', 'Solomon Islands'),
       ('SO', 'Somalia'),
       ('ZA', 'South Africa'),
       ('GS', 'South Georgia and the South Sandwich Islands'),
       ('SS', 'South Sudan'),
       ('ES', 'Spain'),
       ('LK', 'Sri Lanka'),
       ('SD', 'Sudan'),
       ('SR', 'Suriname'),
       ('SJ', 'Svalbard and Jan Mayen'),
       ('SZ', 'Swaziland'),
       ('SE', 'Sweden'),
       ('CH', 'Switzerland'),
       ('SY', 'Syrian Arab Republic'),
       ('TW', 'Taiwan, Province of China'),
       ('TJ', 'Tajikistan'),
       ('TZ', 'Tanzania, United Republic of'),
       ('TH', 'Thailand'),
       ('TL', 'Timor-Leste'),
       ('TG', 'Togo'),
       ('TK', 'Tokelau'),
       ('TO', 'Tonga'),
       ('TT', 'Trinidad and Tobago'),
       ('TN', 'Tunisia'),
       ('TR', 'Turkey'),
       ('TM', 'Turkmenistan'),
       ('TC', 'Turks and Caicos Islands'),
       ('TV', 'Tuvalu'),
       ('UG', 'Uganda'),
       ('UA', 'Ukraine'),
       ('AE', 'United Arab Emirates'),
       ('GB', 'United Kingdom'),
       ('US', 'United States'),
       ('UM', 'United States Minor Outlying Islands'),
       ('UY', 'Uruguay'),
       ('UZ', 'Uzbekistan'),
       ('VU', 'Vanuatu'),
       ('VE', 'Venezuela, Bolivarian Republic of'),
       ('VN', 'Viet Nam'),
       ('VG', 'Virgin Islands, British'),
       ('VI', 'Virgin Islands, U.S.'),
       ('WF', 'Wallis and Futuna'),
       ('EH', 'Western Sahara'),
       ('YE', 'Yemen'),
       ('ZM', 'Zambia'),
       ('ZW', 'Zimbabwe');

INSERT INTO User
VALUES (80235, 'FR', 'user1', 'John', 'Doe', '1990-01-01', 'Paris', '75001', 0),
       (69091, 'DE', 'user2', 'Jane', 'Smith', '1985-05-10', 'Berlin', '10115', 1),
       (50759, 'ES', 'user3', 'Bob', 'Johnson', '1995-08-15', 'Madrid', '28001', 2),
       (09645, 'IT', 'user4', 'Alice', 'Williams', '1992-03-20', 'Rome', '00118', 1),
       (96136, 'GB', 'user5', 'Tom', 'Brown', '1987-11-05', 'London', 'SW1A 0AA', 0),
       (17111, 'JP', 'user6', 'Linda', 'Davis', '1998-06-25', 'Tokyo', '100-0001', 2),
       (76095, 'CA', 'user7', 'David', 'Wilson', '1991-02-15', 'Toronto', 'M5G 1C7', 0),
       (12788, 'AU', 'user8', 'Sarah', 'Anderson', '1988-09-10', 'Sydney', '2000', 2),
       (60347, 'CN', 'user9', 'Peter', 'Lee', '1993-12-30', 'Shanghai', '200000', 0),
       (88395, 'BR', 'user10', 'Maria', 'Garcia', '1989-04-05', 'São Paulo', '01310-000', 1),
       (06235, 'MX', 'user11', 'Juan', 'Perez', '1997-07-20', 'Mexico City', '01000', 2),
       (69944, 'RU', 'user12', 'Anna', 'Kovaleva', '1994-02-28', 'Moscow', '109012', 1),
       (70585, 'CH', 'user13', 'Mark', 'Schmidt', '1996-10-15', 'Zürich', '8001', 0),
       (98193, 'FR', 'user14', 'Jean', 'Dupont', '1990-01-01', 'Paris', '75001', 1),
       (57053, 'DE', 'user15', 'Hans', 'Schmidt', '1992-02-02', 'Berlin', '10178', 0),
       (94161, 'ES', 'user16', 'Maria', 'Garcia', '1988-03-03', 'Madrid', '28001', 1),
       (78662, 'GB', 'user17', 'John', 'Smith', '1994-04-04', 'London', 'SW1A 1AA', 0),
       (82449, 'IT', 'user18', 'Marco', 'Rossi', '1996-05-05', 'Rome', '00118', 1),
       (41461, 'CN', 'user19', 'Li', 'Wang', '1998-06-06', 'Beijing', '100005', 0),
       (28077, 'JP', 'user20', 'Taro', 'Suzuki', '1993-07-07', 'Tokyo', '100-0005', 1),
       (26875, 'AU', 'user21', 'Emily', 'Brown', '1991-08-08', 'Sydney', '2000', 0),
       (18720, 'CA', 'user22', 'David', 'Lee', '1989-09-09', 'Toronto', 'M5V 1J2', 1),
       (10660, 'MX', 'user23', 'Juan', 'Gonzalez', '1995-10-10', 'Mexico City', '06010', 2),
       (90590, 'RU', 'user24', 'Ivan', 'Petrov', '1987-11-11', 'Moscow', '101000', 2),
       (91215, 'BR', 'user25', 'Ana', 'Silva', '1999-12-12', 'São Paulo', '01000-000', 0);


INSERT INTO Artist
VALUES (51060, 'John', 'Lennon', 'Singer, songwriter, and peace activist', '1940-10-09', 'GB'),
       (33547, 'Elton', 'John', 'Pianist and composer', '1947-03-25', 'GB'),
       (42340, 'Beyoncé', 'Knowles', 'Singer, songwriter, and actress', '1981-09-04', 'US'),
       (60085, 'Freddie', 'Mercury', 'Singer, songwriter, and record producer', '1946-09-05', 'TZ'),
       (74677, 'Bob', 'Dylan', 'Singer-songwriter, author, and visual artist', '1941-05-24', 'US'),
       (70862, 'Madonna', 'Ciccone', 'Singer, songwriter, actress, and businesswoman', '1958-08-16', 'US'),
       (51997, 'Jimi', 'Hendrix', 'Singer, songwriter, and guitarist', '1942-11-27', 'US'),
       (56246, 'David', 'Bowie', 'Singer, songwriter, and actor', '1947-01-08', 'GB'),
       (35632, 'Aretha', 'Franklin', 'Singer, songwriter, and pianist', '1942-03-25', 'US'),
       (73863, 'Miles', 'Davis', 'Trumpeter, bandleader, and composer', '1926-05-26', 'US'),
       (20150, 'Ella', 'Fitzgerald', 'Singer', '1917-04-25', 'US'),
       (07667, 'Stevie', 'Wonder', 'Singer, songwriter, and multi-instrumentalist', '1950-05-13', 'US'),
       (46035, 'Prince', 'Nelson', 'Singer, songwriter, and musician', '1958-06-07', 'US'),
       (74540, 'Whitney', 'Houston', 'Singer and actress', '1963-08-09', 'US'),
       (28074, 'Frank', 'Sinatra', 'Singer and actor', '1915-12-12', 'US'),
       (13944, 'Mariah', 'Carey', 'Singer, songwriter, and actress', '1970-03-27', 'US'),
       (49643, 'Ludwig', 'van Beethoven', 'Composer and pianist', '1770-12-16', 'AT'),
       (59126, 'Wolfgang', 'Amadeus Mozart', 'Composer', '1756-01-27', 'AT'),
       (50798, 'Johann', 'Sebastian Bach', 'Composer and musician', '1685-03-21', 'DE'),
       (83473, 'Giuseppe', 'Verdi', 'Composer', '1813-10-10', 'IT'),
       (11556, 'Janelle', 'Monáe', 'Singer-songwriter, actress, and producer', '1985-12-01', 'US'),
       (64042, 'Leonard', 'Cohen', 'Singer-songwriter, poet, and novelist', '1934-09-21', 'CA'),
       (24126, 'Nina', 'Simone', 'Singer, songwriter, and civil rights activist', '1933-02-21', 'US'),
       (39909, 'Joni', 'Mitchell', 'Singer-songwriter and painter', '1943-11-07', 'CA'),
       (46082, 'Kendrick', 'Lamar', 'Rapper, songwriter, and record producer', '1987-06-17', 'US'),
       (77210, 'Amy', 'Winehouse', 'Singer-songwriter', '1983-09-14', 'GB'),
       (94854, 'Adele', 'Adkins', 'Singer-songwriter', '1988-05-05', 'GB'),
       (30349, 'Ed', 'Sheeran', 'Singer-songwriter and record producer', '1991-02-17', 'GB'),
       (58841, 'Lana', 'Del Rey', 'Singer-songwriter and record producer', '1985-06-21', 'US'),
       (48428, 'Billie', 'Eilish', 'Singer-songwriter', '2001-12-18', 'US');


INSERT INTO Genre
VALUES (12356, 'Rock',
        'A genre of popular music that originated as "rock and roll" in the United States in the 1950s.'),
       (27867, 'Pop',
        'A genre of popular music that originated in the mid-1950s in the United States and the United Kingdom.'),
       (37898, 'Hip Hop',
        'A genre of popular music that originated in African American and Hispanic American communities in the United States during the 1970s.'),
       (43564, 'Electronic',
        'A genre of music that is produced using electronic devices such as synthesizers, drum machines, and computers.'),
       (55543, ' Country ',
        ' A genre of American popular music that originated in the Southern United States in the 1920s.'),
       (68971, ' R & B',
        ' A genre of popular music that originated in African American communities in the United States in the 1940s.'),
       (71453, ' Reggae ', ' A music genre that originated in Jamaica in the late 1960s.'),
       (82654, ' Jazz ',
        ' A music genre that originated in the African American communities of New Orleans, United States, in the late
        19th and early 20th centuries.'),
       (92536, ' Classical ',
        ' A genre of music that originated in Europe in the 18th century and is characterized by its complex forms,
        sophisticated harmony, and rich instrumentation.'),
       (10673, ' Folk ',
        ' A genre of traditional music that originated in rural communities and was passed down orally from generation
        to generation.'),
       (15985, ' Soul ',
        ' Soul music is a genre of popular music that originated in African American communities in the United States
        and combines elements of gospel, R&B, and jazz'),
       (11181, ' Blues ',
        ' A genre of African American music that originated in the Deep South of the United States around the end of the
        19th century.'),
       (12908, ' Metal ',
        ' A genre of rock music that developed in the late 1960s and early 1970s, with roots in blues rock and
        psychedelic rock.'),
       (13563, ' Punk ',
        ' A genre of rock music that emerged in the mid - 1970s, characterized by its fast tempos,
        hard - edged melodies, and often politically charged lyrics.'),
       (14765, ' World ',
        ' A genre of music that encompasses traditional music from around the world, as well as contemporary music that
        incorporates elements of traditional styles.'),
       (15342, ' Gospel ',
        ' A genre of Christian music that originated in African American communities in the United States in the late
        19th and early 20th centuries, characterized by its emotive vocals and Christian lyrics.');


##ALBUM


INSERT INTO Song
VALUES ('JL001', 'Imagine', 27867, '03:07', 'Imagine'),                                       -- John Lennon
       ('JL002', 'Jealous Guy', 12356, '04:17', 'Imagine'),
       ('JL003', 'Instant Karma!', 12356, '03:20', 'Shaved Fish'),
       ('JL004', 'Give Peace a Chance', 12356, '04:53', 'Shaved Fish'),
       ('JL005', 'Working Class Hero', 12356, '03:48', 'John Lennon/Plastic Ono Band'),
       ('EJ001', 'Your Song', 27867, '04:04', 'Elton John'),                                  -- Elton John
       ('EJ002', 'Rocket Man', 12356, '04:43', 'Honky Château'),
       ('EJ003', 'Tiny Dancer', 27867, '06:15', 'Madman Across the Water'),
       ('EJ004', 'Candle in the Wind', 27867, '03:50', 'Goodbye Yellow Brick Road'),
       ('EJ005', 'Don\'t Let the Sun Go Down on Me', 27867, '05:38', 'Caribou'),
       ('BY001', 'Single Ladies (Put a Ring on It)', 27867, '03:13', 'I Am... Sasha Fierce'), -- Beyoncé
       ('BY002', 'Crazy in Love', 27867, '03:56', 'Dangerously in Love'),
       ('BY003', 'Irreplaceable', 27867, '03:48', 'B\'Day'),
       ('BY004', 'Halo', 27867, '04:21', 'I Am... Sasha Fierce'),
       ('BY005', 'Formation', 68971, '03:26', 'Lemonade'),
       ('FM001', 'Bohemian Rhapsody', 12356, '05:55', 'A Night at the Opera'),               -- Freddy Mercury
       ('FM002', 'We Are the Champions', 12356, '03:00', 'News of the World'),
       ('FM003', 'Somebody to Love', 12356, '04:56', 'A Day at the Races'),
       ('FM004', 'Killer Queen', 12356, '03:03', 'Sheer Heart Attack'),
       ('SW001', 'Superstition', 68971, '00:04:26', 'Talking Book'),                         -- Stevie Wonder
       ('SW002', 'Sir Duke', 68971, '00:03:54', 'Songs in the Key of Life'),
       ('SW003', 'Higher Ground', 68971, '00:03:42', 'Innervisions'),
       ('SW004', 'I Wish', 68971, '00:04:12', 'Songs in the Key of Life'),
       ('SW005', 'You Are the Sunshine of My Life', 68971, '00:02:58', 'Talking Book'),
       ('PR001', 'Purple Rain', 68971, '00:08:41', 'Purple Rain'),                            -- Prince
       ('PR002', 'Kiss', 68971, '00:03:46', 'Parade'),
       ('PR003', 'When Doves Cry', 68971, '00:05:52', 'Purple Rain'),
       ('PR004', '1999', 68971, '00:06:15', '1999'),
       ('PR005', 'Little Red Corvette', 68971, '00:05:03', '1999'),
       ('WH001', 'I Will Always Love You', 15985, '00:04:32', 'The Bodyguard Soundtrack'),   -- Whitney Houston
       ('WH002', 'Greatest Love of All', 15985, '00:04:49', 'Whitney Houston'),
       ('WH003', 'I Wanna Dance with Somebody', 15985, '00:04:51', 'Whitney'),
       ('WH004', 'How Will I Know', 15985, '00:04:32', 'Whitney Houston'),
       ('WH005', 'So Emotional', 15985, '00:04:33', 'Whitney'),
       ('FS001', 'My Way', 82654, '00:04:36', 'My Way'),                                     -- Frank Sinatra
       ('FS002', 'New York, New York', 82654, '00:03:33', 'Trilogy: Past Present Future'),
       ('FS003', 'Fly Me to the Moon', 82654, '00:02:29', 'It Might As Well Be Swing'),
       ('FS004', 'Strangers in the Night', 82654, '00:02:45', 'Strangers in the Night'),
       ('FS005', 'The Way You Look Tonight', 82654, '00:02:21', 'Days of wine and roses'),
       ('MAD01', 'Like a Virgin', 27867, '03:11', 'Like a Virgin'),                           -- Madonna
       ('MAD02', 'Material Girl', 27867, '03:56', 'Like a Virgin'),
       ('MAD03', 'Vogue', 27867, '05:16', 'I''m Breathless'),
       ('MAD04', 'Like a Prayer', 27867, '05:38', 'Like a Prayer'),
       ('MAD05', 'Ray of Light', 27867, '04:34', 'Ray of Light'),
       ('JIM01', 'Purple Haze', 12356, '02:51', 'Are You Experienced'),                      -- Jimi Hendrix
       ('JIM02', 'Hey Joe', 12356, '03:30', 'Are You Experienced'),
       ('JIM03', 'All Along the Watchtower', 12356, '04:00', 'Electric Ladyland'),
       ('JIM04', 'Little Wing', 12356, '02:24', 'Axis: Bold as Love'),
       ('JIM05', 'Voodoo Child (Slight Return)', 12356, '05:13', 'Electric Ladyland'),
       ('BOW01', 'Space Oddity', 12356, '05:16', 'David Bowie (a.k.a. Space Oddity)'),       -- David Bowie
       ('BOW02', 'Heroes', 12356, '03:37', 'Heroes'),
       ('BOW03', 'Starman', 12356, '04:14', 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars'),
       ('BOW04', 'Let''s Dance', 27867, '04:10', 'Let''s Dance'),
       ('BOW05', 'Life on Mars?', 12356, '03:53', 'Hunky Dory'),
       ('ARE01', 'Respect', 68971, '02:29', 'I Never Loved a Man the Way I Love You'),        -- Aretha Franklin
       ('ARE02', 'Chain of Fools', 68971, '02:46', 'Lady Soul'),
       ('ARE03', 'Think', 68971, '02:19', 'Aretha Now'),
       ('ARE04', 'A Natural Woman (You Make Me Feel Like)', 68971, '02:44', 'Lady Soul'),
       ('ARE05', 'I Say a Little Prayer', 68971, '03:32', 'Aretha Now'),
       ('MIL01', 'So What', 82654, '09:22', 'Kind of Blue'),                                 -- Miles Davis
       ('MIL02', 'Freddie Freeloader', 82654, '09:46', 'Kind of Blue'),
       ('MIL03', 'All Blues', 82654, '11:34', 'Kind of Blue'),
       ('MIL04', 'Milestones', 82654, '05:42', 'Milestones'),
       ('JMS01', 'Both Sides Now', 27867, '00:05:46', 'Both Sides Now'),                     -- Joni Mitchell
       ('JMS02', 'Big Yellow Taxi', 27867, '00:02:16', 'Ladies of the Canyon'),
       ('JMS03', 'Help Me', 12356, '00:03:22', 'Court and Spark'),
       ('JMS04', 'A Case of You', 10673, '00:04:20', 'Blue'),
       ('JMS05', 'The Circle Game', 10673, '00:04:52', 'Ladies of the Canyon'),
       ('KDL01', 'HUMBLE.', 37898, '00:02:57', 'DAMN.'),                                  -- kendrick Lamar
       ('KDL02', 'Alright', 37898, '00:03:39', 'To Pimp a Butterfly'),
       ('KDL03', 'King Kunta', 37898, '00:03:54', 'To Pimp a Butterfly'),
       ('KDL04', 'Swimming Pools (Drank)', 37898, '00:03:40', 'good kid, m.A.A.d city'),
       ('KDL05', 'Money Trees', 37898, '00:06:27', 'good kid, m.A.A.d city'),
       ('AWH01', 'Rehab', 15985, '00:03:33', 'Back to Black'),                              -- Amy Winehouse
       ('AWH02', 'Back to Black', 15985, '00:04:08', 'Back to Black'),
       ('AWH03', 'Valerie', 15985, '00:03:53', 'Back to Black: B-Sides'),
       ('AWH04', 'Tears Dry On Their Own', 15985, '00:03:07', 'Back to Black'),
       ('AWH05', 'Love Is A Losing Game', 15985, '00:02:35', 'Back to Black'),
       ('ADE01', 'Rolling in the Deep', 27867, '00:03:48', '21'),                            -- Adele
       ('ADE02', 'Someone Like You', 27867, '00:04:45', '21'),
       ('ADE03', 'Set Fire to the Rain', 27867, '00:04:01', '21'),
       ('ADE04', 'Hello', 27867, '00:04:55', '25'),
       ('ADE05', 'When We Were Young', 27867, '00:04:50', '25'),
       ('ESH01', 'Shape of You', 27867, '00:03:53', '÷'),                                    -- Ed Sheeran
       ('ESH02', 'Thinking Out Loud', 27867, '00:04:41', 'x'),
       ('ESH03', 'Photograph', 27867, '00:04:19', 'x'),
       ('ESH04', 'Castle on the Hill', 27867, '00:04:21', '÷');





