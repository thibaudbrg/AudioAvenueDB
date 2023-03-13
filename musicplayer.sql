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
DROP TABLE IF EXISTS SubscriptionType;
DROP TABLE IF EXISTS PlaylistContains;
DROP TABLE IF EXISTS Produce; 



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
    AlbumName   VARCHAR(75),
    ReleaseDate DATE,
    ArtistID    VARCHAR(5),
    PRIMARY KEY (AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID) ON DELETE SET NULL
);

CREATE TABLE Song
(
    SongID   VARCHAR(5),
    SongName VARCHAR(50),
    GenreID  VARCHAR(5),
    Duration TIME,
    AlbumID  VARCHAR(5),
    PRIMARY KEY (SongID),
    FOREIGN KEY (GenreID) REFERENCES Genre (GenreID) ON DELETE SET NULL,
    FOREIGN KEY (AlbumID) REFERENCES Album (AlbumID) ON DELETE SET NULL
);


CREATE TABLE Playlist
(
    PlaylistID   VARCHAR(5),
    PlaylistName VARCHAR(100),
    UserID       VARCHAR(5),
    PlaylistDesc TINYTEXT,
    PRIMARY KEY (PlaylistID),
    FOREIGN KEY (UserID) REFERENCES User (UserID) ON DELETE CASCADE
);

CREATE TABLE Produce
(
    ArtistID       VARCHAR(5),
    SongID         VARCHAR(5),
    PRIMARY KEY (ArtistID, SongID),
    FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID) ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song (SongID) ON DELETE CASCADE
);

CREATE TABLE PlaylistContains
(
    PlaylistID VARCHAR(5),
    SongID     VARCHAR(5),
    AddDate    DATE,
    PRIMARY KEY (PlaylistID, SongID),
    FOREIGN KEY (PlaylistID) REFERENCES Playlist (PlaylistID) ON DELETE CASCADE,
    FOREIGN KEY (SongID) REFERENCES Song (SongID) ON DELETE CASCADE
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


INSERT INTO Album
VALUES (78651, 'Imagine', '1971-09-09', 51060),
       (00790, 'Shaved Fish', '1975-10-24', 51060),
       (98787, 'John Lennon/Plastic Ono Band', '1970-12-11', 51060),
       (47987, 'Elton John', '1970-04-10', 33547),
       (23840, 'Honky Château', '1972-05-19', 33547),
       (32884, 'Madman Across the Water', '1971-11-05', 33547),
       (21615, 'Goodbye Yellow Brick Road', '1973-10-05', 33547),
       (60671, 'Caribou', '1974-06-28', 33547),
       (95749, 'I Am... Sasha Fierce', '2008-11-14', 42340),
       (28904, 'Dangerously in Love', '2003-06-23', 42340),
       (89321, 'B''Day', '2006-09-01', 42340),
       (16334, 'Lemonade', '2016-04-23', 42340),
       (36808, 'A Night at the Opera', '1975-11-21', 60085),
       (29977, 'News of the World', '1977-10-28', 60085),
       (75187, 'A Day at the Races', '1976-12-10', 60085),
       (23370, 'Sheer Heart Attack', '1974-11-08', 74677),
       (28452, 'Like a Virgin', '1984-11-12', 70862),
       (86090, 'I''m Breathless', '1990-05-22', 70862),
       (61094, 'Like a Prayer', '1989-03-21', 70862),
       (76404, 'Ray of Light', '1998-02-22', 70862),
       (87597, 'Are You Experienced', '1967-08-23', 51997),
       (39196, 'The Bodyguard Soundtrack', '1992-11-17', 56246),
       (58931, 'Purple Rain', '1984-06-25', 56246),
       (02053, 'Parade', '1986-03-31', 56246),
       (19488, 'Days of Wine and Roses', '1963-10-14', 35632),
       (38038, 'Kind of Blue', '1959-08-17', 73863),
       (74746, 'Talking Book', '1972-10-28', 07667),
       (45339, 'Songs in the Key of Life', '1976-09-28', 07667),
       (23359, 'Innervisions', '1973-08-03', 07667),
       (96522, '1999', '1982-10-27', 46035),
       (58136, 'Whitney Houston', '1985-02-14', 74540),
       (50852, 'Whitney', '1987-06-02', 74540),
       (63582, 'My Way', '1969-03-18', 28074),
       (86746, 'Trilogy: Past Present Future', '1980-10-01', 28074),
       (95244, 'It Might As Well Be Swing', '1964-07-27', 28074),
       (03709, 'Strangers in the Night', '1966-06-06', 28074),
       (47010, 'Blue', '1971-06-22', 39909),
       (34647, 'Court and Spark', '1974-01-01', 39909),
       (27425, 'good kid, m.A.A.d city', '2012-10-22', 46082),
       (35514, 'To Pimp a Butterfly', '2015-03-15', 46082),
       (57260, 'Back to Black', '2006-10-27', 77210),
       (77380, '21', '2011-01-24', 94854),
       (57182, '25', '2015-11-20', 94854),
       (89227, '+', '2011-09-09', 30349),
       (17826, 'x', '2014-06-20', 30349),
       (34814, '÷', '2017-03-03', 30349),
       (62560, 'I Am... Sasha Fierce', '2008-11-14', 42340),
       (04338, 'Songs in the Key of Life', '1976-09-28', 07667),
       (43506, 'Talking Book', '1972-10-28', 07667),
       (27740, 'Electric Ladyland', '1968-10-16', 51997),
       (98976, 'Axis: Bold as Love', '1967-12-01', 51997),
       (02693, 'David Bowie (a.k.a. Space Oddity)', '1969-11-14', 56246),
       (75849, 'Heroes', '1977-10-14', 56246),
       (00060, 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars', '1972-06-16', 56246),
       (14389, 'Let''s Dance', '1983-04-14', 56246),
       (80192, 'Hunky Dory', '1971-12-17', 56246),
       (59559, 'I Never Loved a Man the Way I Love You', '1967-03-10', 35632),
       (60065, 'Lady Soul', '1968-01-22', 35632),
       (99342, 'Aretha Now', '1968-06-14', 35632),
       (01335, 'Kind of Blue', '1959-08-17', 73863),
       (18861, 'Milestones', '1958-04-02', 73863),
       (86170, 'Both Sides Now', '2000-03-21', 39909),
       (84443, 'Ladies of the Canyon', '1970-03-01', 39909),
       (31558, 'Back to Black: B-Sides', '2012-11-12', 77210),
       (02828, 'Back to Black', '2006-10-27', 77210),
       (89352, 'DAMN.', '2017-04-14', 46082);


INSERT INTO Song
VALUES ('JL001', 'Imagine', 27867, '03:07', 78651),                          -- John Lennon
       ('JL002', 'Jealous Guy', 12356, '04:17', 78651),
       ('JL003', 'Instant Karma!', 12356, '03:20', 00790),
       ('JL004', 'Give Peace a Chance', 12356, '04:53', 00790),
       ('JL005', 'Working Class Hero', 12356, '03:48', 98787),
       ('EJ001', 'Your Song', 27867, '04:04', 47987),                        -- Elton John
       ('EJ002', 'Rocket Man', 12356, '04:43', 23840),
       ('EJ003', 'Tiny Dancer', 27867, '06:15', 32884),
       ('EJ004', 'Candle in the Wind', 27867, '03:50', 21615),
       ('EJ005', 'Don\'t Let the Sun Go Down on Me', 27867, '05:38', 60671),
       ('BY001', 'Single Ladies (Put a Ring on It)', 27867, '03:13', 95749), -- Beyoncé
       ('BY002', 'Crazy in Love', 27867, '03:56', 28904),
       ('BY003', 'Irreplaceable', 27867, '03:48', 89321),
       ('BY004', 'Halo', 27867, '04:21', 62560),
       ('BY005', 'Formation', 68971, '03:26', 16334),
       ('FM001', 'Bohemian Rhapsody', 12356, '05:55', 36808),                -- Freddy Mercury
       ('FM002', 'We Are the Champions', 12356, '03:00', 29977),
       ('FM003', 'Somebody to Love', 12356, '04:56', 75187),
       ('FM004', 'Killer Queen', 12356, '03:03', 23370),
       ('SW001', 'Superstition', 68971, '00:04:26', 74746),                  -- Stevie Wonder
       ('SW002', 'Sir Duke', 68971, '00:03:54', 45339),
       ('SW003', 'Higher Ground', 68971, '00:03:42', 23359),
       ('SW004', 'I Wish', 68971, '00:04:12', 04338),
       ('SW005', 'You Are the Sunshine of My Life', 68971, '00:02:58', 43506),
       ('PN001', 'Purple Rain', 68971, '00:08:41', 58931),                   -- Prince
       ('PN002', 'Kiss', 68971, '00:03:46', 02053),
       ('PN003', 'When Doves Cry', 68971, '00:05:52', 58931),
       ('PN004', '1999', 68971, '00:06:15', 96522),
       ('PN005', 'Little Red Corvette', 68971, '00:05:03', 96522),
       ('WH001', 'I Will Always Love You', 15985, '00:04:32', 39196),        -- Whitney Houston
       ('WH002', 'Greatest Love of All', 15985, '00:04:49', 58136),
       ('WH003', 'I Wanna Dance with Somebody', 15985, '00:04:51', 50852),
       ('WH004', 'How Will I Know', 15985, '00:04:32', 58136),
       ('WH005', 'So Emotional', 15985, '00:04:33', 50852),
       ('FS001', 'My Way', 82654, '00:04:36', 63582),                        -- Frank Sinatra
       ('FS002', 'New York, New York', 82654, '00:03:33', 86746),
       ('FS003', 'Fly Me to the Moon', 82654, '00:02:29', 95244),
       ('FS004', 'Strangers in the Night', 82654, '00:02:45', 03709),
       ('FS005', 'The Way You Look Tonight', 82654, '00:02:21', 19488),
       ('MAD01', 'Like a Virgin', 27867, '03:11', 28452),                    -- Madonna
       ('MAD02', 'Material Girl', 27867, '03:56', 28452),
       ('MAD03', 'Vogue', 27867, '05:16', 86090),
       ('MAD04', 'Like a Prayer', 27867, '05:38', 61094),
       ('MAD05', 'Ray of Light', 27867, '04:34', 76404),
       ('JIM01', 'Purple Haze', 12356, '02:51', 87597),                      -- Jimi Hendrix
       ('JIM02', 'Hey Joe', 12356, '03:30', 87597),
       ('JIM03', 'All Along the Watchtower', 12356, '04:00', 27740),
       ('JIM04', 'Little Wing', 12356, '02:24', 98976),
       ('JIM05', 'Voodoo Child (Slight Return)', 12356, '05:13', 27740),
       ('BOW01', 'Space Oddity', 12356, '05:16', 02693),                     -- David Bowie
       ('BOW02', 'Heroes', 12356, '03:37', 75849),
       ('BOW03', 'Starman', 12356, '04:14', 00060),
       ('BOW04', 'Let''s Dance', 27867, '04:10', 14389),
       ('BOW05', 'Life on Mars?', 12356, '03:53', 80192),
       ('ARE01', 'Respect', 68971, '02:29', 59559),                          -- Aretha Franklin
       ('ARE02', 'Chain of Fools', 68971, '02:46', 60065),
       ('ARE03', 'Think', 68971, '02:19', 99342),
       ('ARE04', 'A Natural Woman (You Make Me Feel Like)', 68971, '02:44', 60065),
       ('ARE05', 'I Say a Little Prayer', 68971, '03:32', 99342),
       ('MIL01', 'So What', 82654, '09:22', 01335),                          -- Miles Davis
       ('MIL02', 'Freddie Freeloader', 82654, '09:46', 38038),
       ('MIL03', 'All Blues', 82654, '11:34', 01335),
       ('MIL04', 'Milestones', 82654, '05:42', 18861),
       ('JMS01', 'Both Sides Now', 27867, '00:05:46', 86170),                -- Joni Mitchell
       ('JMS02', 'Big Yellow Taxi', 27867, '00:02:16', 84443),
       ('JMS03', 'Help Me', 12356, '00:03:22', 34647),
       ('JMS04', 'A Case of You', 10673, '00:04:20', 47010),
       ('JMS05', 'The Circle Game', 10673, '00:04:52', 84443),
       ('KDL01', 'HUMBLE.', 37898, '00:02:57', 89352),                       -- kendrick Lamar
       ('KDL02', 'Alright', 37898, '00:03:39', 35514),
       ('KDL03', 'King Kunta', 37898, '00:03:54', 35514),
       ('KDL04', 'Swimming Pools (Drank)', 37898, '00:03:40', 27425),
       ('KDL05', 'Money Trees', 37898, '00:06:27', 27425),
       ('AWH01', 'Rehab', 15985, '00:03:33', 57260),                         -- Amy Winehouse
       ('AWH02', 'Back to Black', 15985, '00:04:08', 57260),
       ('AWH03', 'Valerie', 15985, '00:03:53', 31558),
       ('AWH04', 'Tears Dry On Their Own', 15985, '00:03:07', 02828),
       ('AWH05', 'Love Is A Losing Game', 15985, '00:02:35', 02828),
       ('ADE01', 'Rolling in the Deep', 27867, '00:03:48', 77380),           -- Adele
       ('ADE02', 'Someone Like You', 27867, '00:04:45', 77380),
       ('ADE03', 'Set Fire to the Rain', 27867, '00:04:01', 77380),
       ('ADE04', 'Hello', 27867, '00:04:55', 57182),
       ('ADE05', 'When We Were Young', 27867, '00:04:50', 89227),
       ('ESH01', 'Shape of You', 27867, '00:03:53', 34814),                  -- Ed Sheeran
       ('ESH02', 'Thinking Out Loud', 27867, '00:04:41', 17826),
       ('ESH03', 'Photograph', 27867, '00:04:19', 17826),
       ('ESH04', 'Castle on the Hill', 27867, '00:04:21', 34814);

INSERT Playlist
VALUES (84356, 'Classic Pop Rock Anthems', 09645,
        'A playlist featuring timeless hits from the 60s, 70s, and 80s that are sure to get you singing and dancing along.'),
       (78513, 'Soothing Acoustic Melodies for Relaxation and Focus', 57053,
        'A collection of calm and peaceful acoustic songs perfect for unwinding and focusing.'),
       (12865, 'Upbeat and Energetic Pop Hits for Workouts and Dance Parties', 80235,
        'A playlist featuring high-energy and upbeat pop songs that will keep you motivated during your workouts and dance parties.'),
       (78911, 'Mellow Jazz and Blues for Cozy Nights In', 10660,
        'A selection of smooth and relaxing jazz and blues tracks to set the mood for a cozy night in.'),
       (11520, 'Eclectic Mix of Indie and Alternative Rock for Road Trips and Adventures', 26875,
        'A diverse mix of indie and alternative rock songs to accompany you on your road trips and adventures.');

INSERT INTO Produce
VALUES (51060, 'JL001'),
       (51060, 'JL002'),
       (51060, 'JL003'),
       (51060, 'JL004'),
       (51060, 'JL005'),
       (33547, 'EJ001'),
       (33547, 'EJ002'),
       (33547, 'EJ003'),
       (33547, 'EJ004'),
       (33547, 'EJ005'),
       (42340, 'BY001'),
       (42340, 'BY002'),
       (42340, 'BY003'),
       (42340, 'BY004'),
       (42340, 'BY005'),
       (60085, 'FM001'),
       (60085, 'FM002'),
       (60085, 'FM003'),
       (60085, 'FM004'),
       (07667, 'SW001'),
       (07667, 'SW002'),
       (07667, 'SW003'),
       (07667, 'SW004'),
       (07667, 'SW005'),
       (46035, 'PN001'),
       (46035, 'PN002'),
       (46035, 'PN003'),
       (46035, 'PN004'),
       (46035, 'PN005'),
       (74540, 'WH001'),
       (74540, 'WH002'),
       (74540, 'WH003'),
       (74540, 'WH004'),
       (74540, 'WH005'),
       (28074, 'FS001'),
       (28074, 'FS002'),
       (28074, 'FS003'),
       (28074, 'FS004'),
       (28074, 'FS005'),
       (70862, 'MAD01'),
       (70862, 'MAD02'),
       (70862, 'MAD03'),
       (70862, 'MAD04'),
       (70862, 'MAD05'),
       (51997, 'JIM01'),
       (51997, 'JIM02'),
       (51997, 'JIM03'),
       (51997, 'JIM04'),
       (51997, 'JIM05'),
       (56246, 'BOW01'),
       (56246, 'BOW02'),
       (56246, 'BOW03'),
       (56246, 'BOW04'),
       (56246, 'BOW05'),
       (35632, 'ARE01'),
       (35632, 'ARE02'),
       (35632, 'ARE03'),
       (35632, 'ARE04'),
       (35632, 'ARE05'),
       (73863, 'MIL01'),
       (73863, 'MIL02'),
       (73863, 'MIL03'),
       (73863, 'MIL04'),
       (39909, 'JMS01'),
       (39909, 'JMS02'),
       (39909, 'JMS03'),
       (39909, 'JMS04'),
       (39909, 'JMS05'),
       (46082, 'KDL01'),
       (46082, 'KDL02'),
       (46082, 'KDL03'),
       (46082, 'KDL04'),
       (46082, 'KDL05'),
       (77210, 'AWH01'),
       (77210, 'AWH02'),
       (77210, 'AWH03'),
       (77210, 'AWH04'),
       (77210, 'AWH05'),
       (94854, 'ADE01'),
       (94854, 'ADE02'),
       (94854, 'ADE03'),
       (94854, 'ADE04'),
       (94854, 'ADE05'),
       (30349, 'ESH01'),
       (30349, 'ESH02'),
       (30349, 'ESH03'),
       (30349, 'ESH04');



INSERT INTO PlaylistContains
VALUES (84356, 'SW003', '2020-12-13'),
       (84356, 'FM001', '2023-01-20'),
       (84356, 'PN001', '2018-01-01'),
       (84356, 'PN003', '2020-05-31'),
       (84356, 'EJ002', '2015-02-12'),
       (84356, 'JL004', '2023-10-26'),
       (84356, 'EJ005', '2023-01-03'),
       (84356, 'SW001', '2021-12-22'),
       (78513, 'WH004', '2018-01-07'),
       (78513, 'WH003', '2015-06-26'),
       (78513, 'JL002', '2020-01-13'),
       (78513, 'PN002', '2017-04-14'),
       (12865, 'JL005', '2016-11-04'),
       (12865, 'SW005', '2021-09-16'),
       (12865, 'FS005', '2017-11-02'),
       (12865, 'WH001', '2018-02-05'),
       (12865, 'EJ003', '2019-01-11'),
       (12865, 'BY005', '2017-05-27'),
       (12865, 'EJ004', '2019-06-27'),
       (12865, 'SW004', '2021-06-24'),
       (12865, 'WH002', '2022-01-04'),
       (78911, 'FS001', '2015-08-04'),
       (78911, 'JL003', '2017-02-12'),
       (78911, 'BY004', '2021-01-08'),
       (78911, 'FS004', '2020-12-02'),
       (78911, 'BY001', '2018-04-12'),
       (78911, 'FM002', '2016-10-09'),
       (11520, 'FS001', '2016-02-24'),
       (11520, 'PN001', '2022-12-03'),
       (11520, 'EJ002', '2015-06-16'),
       (11520, 'FM004', '2017-09-05'),
       (11520, 'WH003', '2021-01-18'),
       (11520, 'JL001', '2018-11-25'),
       (11520, 'SW001', '2021-06-17'),
       (11520, 'EJ003', '2022-08-07'),
       (11520, 'PN004', '2018-08-24'),
       (11520, 'PN003', '2023-04-17'),
       (11520, 'EJ005', '2022-06-25'),
       (11520, 'FM001', '2017-12-14'),
       (11520, 'SW005', '2018-06-30'),
       (11520, 'SW003', '2023-06-21'),
       (11520, 'FS003', '2019-05-13'),
       (11520, 'BY005', '2017-04-21');
       
       
# show all tables:
# User
SELECT * FROM User; 
# Country
SELECT * FROM Country;
# Artist
SELECT * FROM Artist;
# Genre
SELECT * FROM Genre;
# Song
SELECT * FROM Song;
# Album
SELECT * FROM Album;
# PlayList
SELECT * FROM PlayList;
# SubscriptionType;
SELECT * FROM PlaylistContains;
# PlaylistContains;
SELECT * FROM PlaylistContains;
# Produce
SELECT * FROM Produce;

# display the description of the POP genre:
SELECT GenreDesc FROM Genre 
WHERE genreName = "Pop";
# display the description of the artist with firstname Billie:
SELECT artDesc FROM Artist 
WHERE artFirstName = "Billie";
# show the name and price of all subscription types where the price is between 50 and 80:
SELECT SubName , price FROM SubscriptionType 
where Price > 50 AND Price > 80;

# show each artistID, artist first and second names and the number of songs produced by each of these artists:
SELECT ArtistID, artfirstname, artlastname, COUNT(songID) AS SongCount 
FROM Produce NATURAL JOIN Artist
WHERE ARTIST.ARTISTID = PRODUCE.ARTISTID 
GROUP BY ArtistID;

# show countryName , countryID and corresponding number of artists:
SELECT CountryName, Count(artistID) AS ArtistCount 
FROM Artist Natural JOIN Country 
WHERE country.countryid = artist.countryid 
GROUP BY CountryName
ORDER BY  ArtistCount;

# show subscription types and number of users of that type and money earned from each subscription type:
SELECT SubName AS Sname, count(userID), 
(SELECT CASE Sname WHEN "Free" THEN (SELECT PRICE FROM SubscriptionType WHERE SubName = sname) 
                       WHEN "Premium" THEN count(userID)*(SELECT PRICE FROM SubscriptionType WHERE SubName = sname) 
                                         ELSE count(userID)*(SELECT PRICE FROM SubscriptionType WHERE SubName = sname)  END)
FROM SubscriptionType NATURAL JOIN User
WHERE user.subid = subscriptiontype.subid
group by SubName;

#create function to calculate age from birth date in yeras:
CREATE FUNCTION getAge ( vDate DATE) RETURNS INTEGER
RETURN TIMESTAMPDIFF(YEAR, vDate, CURDATE());

# classify users with respect to their age ;
SELECT
    CASE
        WHEN GetAge(UBirthDate) BETWEEN 13 AND 20 THEN '13-20'
        WHEN GetAge(UBirthDate) BETWEEN 20 AND 30 THEN '20-30'
        WHEN GetAge(UBirthDate) BETWEEN 30 AND 40 THEN '30-50'
        ELSE '50+'
    END AS AgeRange,
    COUNT(userID) AS UserCount
FROM User
GROUP BY AgeRange;