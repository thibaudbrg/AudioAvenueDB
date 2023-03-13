DROP DATABASE IF EXISTS AudioAvenue;
CREATE DATABASE AudioAvenue;
USE AudioAvenue;

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
    City       VARCHAR(30),
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
    ArtName   VARCHAR(30),
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
    SongName VARCHAR(100),
    GenreID  VARCHAR(5),
    Duration TIME,
    AlbumID  VARCHAR(5) NULL ,
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
        100),
       (3, 'Young',
        'A premium account but free for young between 18 and 25 years old.', 0);

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
VALUES (06505, 'MX', 'kmarielle0', 'Kale', 'Marielle', '1958-07-02', 'Revolucion Verde', '87445', 0),
       (97069, 'PT', 'tmartinec1', 'Tamarra', 'Martinec', '1953-09-15', 'Palhais', '4620-023', 0),
       (92936, 'BR', 'edenerley2', 'Erhart', 'Denerley', '1955-07-31', 'Registro', '11900-000', 1),
       (88883, 'SE', 'ebygrove6', 'Ezmeralda', 'Bygrove', '1962-09-09', 'Ängelholm', '262 65', 0),
       (52365, 'NO', 'cstapforth8', 'Chandra', 'Stapforth', '1953-04-27', 'Trondheim', '7026', 2),
       (48855, 'SE', 'dhenrionotb', 'Durand', 'Henrionot', '1964-12-01', 'Borås', '506 46', 0),
       (05476, 'PL', 'lgarbottc', 'Lenora', 'Garbott', '1986-12-29', 'Jastrowie', '64-915', 2),
       (27287, 'DK', 'tlarking', 'Teodorico', 'Larkin', '1952-04-15', 'København', '1457', 2),
       (66353, 'MX', 'kkobierah', 'Karalee', 'Kobiera', '1993-11-21', 'Miguel Hidalgo', '14260', 2),
       (46832, 'ES', 'mripsherj', 'Mitch', 'Ripsher', '1963-10-21', 'Malaga', '29071', 2),
       (12329, 'BR', 'flomasnym', 'Ferdinand', 'Lomasny', '1967-05-14', 'União dos Palmares', '57800-000', 2),
       (24127, 'PL', 'twetherickn', 'Torr', 'Wetherick', '1953-01-01', 'Bojadła', '66-130', 3),
       (10739, 'JP', 'fwillicotto', 'Frazer', 'Willicott', '2002-05-21', 'Shisui', '285-0927', 0),
       (75456, 'GB', 'wkewishp', 'Waldemar', 'Kewish', '1987-04-28', 'Belfast', 'BT2', 0),
       (63083, 'SE', 'mcheses', 'Maxine', 'Chese', '1973-03-05', 'Eskilstuna', '635 11', 1),
       (28343, 'HR', 'jbarnardt', 'Jaymee', 'Barnard', '1958-03-31', 'Turanj', '23207', 2),
       (36663, 'US', 'charmanu', 'Cross', 'Harman', '1977-07-11', 'Albuquerque', '87201', 2),
       (41981, 'BR', 'fflitcroftw', 'Fayth', 'Flitcroft', '2000-09-16', 'Várzea Paulista', '13220-000', 0),
       (74757, 'RU', 'ngirodinx', 'Nanice', 'Girodin', '2000-09-23', 'Pryamitsyno', '300040', 1),
       (95350, 'SI', 'dallainy', 'Doloritas', 'Allain', '1956-01-09', 'Kočevje', '1330', 3),
       (74704, 'SE', 'fcallaby11', 'Flory', 'Callaby', '1951-06-25', 'Vikbolandet', '610 25', 1),
       (69274, 'RU', 'tyouhill12', 'Tabatha', 'Youhill', '1967-06-17', 'Katyr-Yurt', '366609', 0),
       (92014, 'RU', 'sbaud13', 'Stephen', 'Baud', '1979-12-06', 'Pamyat’ Parizhskoy Kommuny', '606488', 0),
       (80583, 'US', 'uchoupin15', 'Ursulina', 'Choupin', '2003-04-20', 'Fullerton', '92640', 2),
       (00867, 'CZ', 'jishaki17', 'Jean', 'Ishaki', '1977-12-06', 'Borovany', '348 02', 2),
       (54116, 'BR', 'dleyman19', 'Dionne', 'Leyman', '1962-05-15', 'Mococa', '13730-000', 1),
       (27275, 'BR', 'iblumson1b', 'Ilysa', 'Blumson', '1991-10-23', 'Belém', '58255-000', 3),
       (69958, 'RU', 'gglayzer1d', 'Garwin', 'Glayzer', '1973-10-04', 'Krasnaya Polyana', '352947', 0),
       (75901, 'RU', 'mloachhead1e', 'Merrill', 'Loachhead', '1954-09-29', 'Orekhovo-Zuyevo', '142609', 3),
       (97061, 'RU', 'wtoon1g', 'Willie', 'Toon', '1998-02-12', 'Monino', '142450', 2),
       (83366, 'AR', 'lgair1h', 'Lamar', 'Gair', '2007-01-23', 'Las Toscas', '3586', 1),
       (00688, 'NL', 'mvandenhof1i', 'Mitch', 'Van den Hof', '2007-11-16', 'Leiden', '2334', 0),
       (53163, 'PL', 'cleaman1k', 'Carlye', 'Leaman', '1960-03-10', 'Krasiczyn', '37-741', 3),
       (65875, 'BR', 'ktredinnick1m', 'Kelwin', 'Tredinnick', '1956-02-12', 'Presidente Bernardes', '19300-000', 3),
       (75317, 'RU', 'lcansdale1n', 'Lethia', 'Cansdale', '1989-03-23', 'Nekrasovka', '140074', 2),
       (86571, 'PL', 'wsamber1o', 'Wyn', 'Samber', '1995-09-30', 'Żarnów', '26-330', 0),
       (75879, 'BR', 'wborit1q', 'Worthington', 'Borit', '2001-06-05', 'Marapanim', '68760-000', 2),
       (60725, 'RU', 'phuburn1s', 'Pierrette', 'Huburn', '1993-08-27', 'Odesskoye', '646860', 0),
       (14689, 'RU', 'rmorilla1t', 'Rosalie', 'Morilla', '1978-07-21', 'Severodvinsk', '164509', 2),
       (17694, 'BR', 'blyburn1u', 'Bronny', 'Lyburn', '1973-10-20', 'Poá', '08550-000', 2),
       (39753, 'BR', 'fmeasor1v', 'Fritz', 'Measor', '1950-07-10', 'Itororó', '45710-000', 1),
       (99849, 'BG', 'ekellet1w', 'Erna', 'Kellet', '1950-03-04', 'Smolyan', '4754', 1),
       (04868, 'GB', 'ysmouten1x', 'Yanaton', 'Smouten', '1965-01-28', 'Bradford', 'BD7', 3),
       (71827, 'BR', 'plonglands1y', 'Pietrek', 'Longlands', '1996-06-05', 'Porto Seguro', '45810-000', 1),
       (64741, 'PT', 'ltithecote20', 'Lainey', 'Tithecote', '2008-12-24', 'Casais Brancos', '2525-234', 3),
       (43719, 'JP', 'mcantos21', 'Miran', 'Cantos', '1950-07-07', 'Toyama-shi', '939-8282', 3),
       (18066, 'JP', 'eshatliff23', 'Elmira', 'Shatliff', '1955-04-26', 'Fujioka', '999-7638', 1),
       (50579, 'PL', 'kkelshaw24', 'Kelley', 'Kelshaw', '1966-08-09', 'Mokotów', '05-090', 0),
       (19316, 'PL', 'jwedmore27', 'Justen', 'Wedmore.', '1966-05-02', 'Pruszków', '05-804', 2),
       (04747, 'RU', 'mirnis28', 'Meryl', 'Irnis', '1955-10-16', 'Staroyur’yevo', '442050', 0),
       (97487, 'SE', 'akealy29', 'Aaren', 'Kealy', '1964-05-14', 'Gävle', '801 74', 2),
       (89293, 'BR', 'drubinfajn2b', 'Darrel', 'Rubinfajn', '1991-09-03', 'Navegantes', '88375-000', 3),
       (51630, 'US', 'ssteptow2c', 'Shandra', 'Steptow', '1971-04-08', 'Hagerstown', '21747', 3),
       (48257, 'SE', 'balekseicik2d', 'Brew', 'Alekseicik', '1961-08-02', 'Ödeshög', '599 92', 1),
       (19382, 'SE', 'hbrayshay2f', 'Harlin', 'Brayshay', '1974-06-08', 'Arvidsjaur', '933 82', 2),
       (80574, 'CZ', 'tannon2g', 'Timmy', 'Annon', '1973-03-10', 'Herálec', '592 01', 1),
       (83007, 'AR', 'lledstone2h', 'Leupold', 'Ledstone', '1973-08-11', 'Libertad', '3374', 1),
       (60296, 'PT', 'jlamas2k', 'Jae', 'Lamas', '1979-04-01', 'Fornos', '4550-356', 0),
       (57827, 'AR', 'cquarmby2l', 'Colene', 'Quarmby', '1998-07-02', 'Chimbas', '5413', 3),
       (79188, 'ES', 'ipelcheur2n', 'Ivonne', 'Pelcheur', '1974-08-30', 'Vigo', '36215', 2),
       (43919, 'JP', 'mstreat2r', 'Melicent', 'Streat', '1995-01-23', 'Tanushimarumachi-toyoki', '839-1344', 1),
       (96792, 'NL', 'gcaw2s', 'Gayle', 'Caw', '1950-09-29', 'Amersfoort', '3805', 1),
       (50754, 'BR', 'btock2t', 'Bradan', 'Tock', '1988-10-05', 'Colorado', '99460-000', 3),
       (77177, 'DK', 'rslite2u', 'Rab', 'Slite', '1978-07-03', 'Frederiksberg', '1802', 1),
       (58573, 'PL', 'ogaskal2w', 'Ogdon', 'Gaskal', '1996-05-05', 'Kawęczyn', '62-704', 2),
       (52363, 'PL', 'rtolossi2x', 'Rudyard', 'Tolossi', '1950-10-31', 'Iwonicz-Zdrój', '38-440', 1),
       (58866, 'JP', 'bdenslow2y', 'Boot', 'Denslow', '1996-04-18', 'Akashi', '950-0084', 2),
       (54251, 'JP', 'snorwell2z', 'Sharyl', 'Norwell', '1955-08-18', 'Kashima', '927-0038', 0),
       (32263, 'BR', 'eselbie30', 'Evelina', 'Selbie', '1981-01-06', 'Coelho Neto', '65620-000', 2),
       (57585, 'AR', 'ahallyburton31', 'Aylmer', 'Hallyburton', '2009-03-02', 'Villa Atamisqui', '4317', 2),
       (04949, 'CZ', 'amatthius32', 'Aile', 'Matthius', '1951-12-26', 'Mýto', '347 01', 1),
       (14086, 'ES', 'adrees33', 'Amye', 'Drees', '1974-10-07', 'Pontevedra', '36005', 1),
       (05564, 'RU', 'pbaistow34', 'Pollyanna', 'Baistow', '2007-01-28', 'Solnechnogorsk', '141508', 0),
       (26580, 'PT', 'aglayzer35', 'Arlen', 'Glayzer', '1996-10-11', 'Duas Igrejas', '5210-046', 0),
       (16474, 'SE', 'bkersley39', 'Byrom', 'Kersley', '1975-08-13', 'Ljungsbro', '590 73', 0),
       (62113, 'AU', 'cdivver3b', 'Catlin', 'Divver', '1955-07-23', 'Adelaide Mail Centre', '5874', 2),
       (07064, 'PT', 'cslessar3m', 'Craig', 'Slessar', '1951-10-19', 'Porta', '4940-352', 0),
       (65203, 'BR', 'emillwall3o', 'Elyse', 'Millwall', '1957-09-05', 'Mogi das Cruzes', '69110-000', 3),
       (31947, 'PL', 'echeake3p', 'Eliza', 'Cheake', '1952-08-04', 'Podebłocie', '04-622', 0),
       (95000, 'MX', 'hdorrian3s', 'Harley', 'Dorrian', '1969-09-12', 'Lindavista', '29557', 1),
       (64547, 'BR', 'vsprigging3t', 'Vernor', 'Sprigging', '1979-04-07', 'Vitória', '29000-000', 0),
       (42583, 'BR', 'mtrim3x', 'Man', 'Trim', '2004-07-12', 'Pinheiros', '29980-000', 3),
       (37072, 'SE', 'hrees3z', 'Hussein', 'Rees', '1976-10-07', 'Fristad', '513 91', 2),
       (49756, 'CH', 'ggaitskell41', 'Graehme', 'Gaitskell', '1990-09-22', 'Bern', '3030', 0),
       (17711, 'PL', 'theaslip45', 'Tomaso', 'Heaslip', '1992-12-22', 'Świnna', '34-331', 0),
       (77819, 'PL', 'tcarillo47', 'Terry', 'Carillo', '1952-01-18', 'Gilowice', '34-322', 3),
       (37321, 'SI', 'gmunsey48', 'Garner', 'Munsey', '1961-08-02', 'Nazarje', '3331', 3),
       (58314, 'US', 'vbagg49', 'Vivyan', 'Bagg', '1971-07-28', 'Norwalk', '06854', 1),
       (14571, 'SE', 'gfollows4b', 'Giustino', 'Follows', '1975-02-16', 'Dorotea', '917 32', 3),
       (64450, 'JP', 'dgladstone4c', 'Dallas', 'Gladstone', '1990-11-15', 'Ōzu', '869-1237', 3),
       (81919, 'AR', 'brupel4e', 'Base', 'Rupel', '1957-06-29', 'El Galpón', '4446', 1),
       (87308, 'CZ', 'ahaslehurst4g', 'Andy', 'Haslehurst', '1980-08-05', 'Karlovy Vary', '360 01', 2),
       (01812, 'JP', 'gmanuelli4h', 'Galven', 'Manuelli', '2004-11-26', 'Hanamaki', '936-0056', 1),
       (85089, 'BR', 'dmuat4k', 'Daniella', 'Muat', '1969-12-30', 'Limoeiro', '55700-000', 1),
       (24490, 'RU', 'kmcenhill4m', 'Kit', 'McEnhill', '1967-03-04', 'Sredniy', '141060', 0),
       (64089, 'FI', 'cbrunelli4n', 'Collete', 'Brunelli', '1956-10-09', 'Kempele', '90451', 0),
       (57610, 'CZ', 'poke4p', 'Paxton', 'Oke', '1994-05-23', 'Horní Jelení', '533 74', 3),
       (51073, 'BR', 'tdrewitt4r', 'Terry', 'Drewitt', '1992-09-23', 'Monte Azul Paulista', '14730-000', 1),
       (12876, 'JP', 'mgales4v', 'Melisent', 'Gales', '1993-05-26', 'Ube', '752-0923', 3),
       (39205, 'SI', 'fkitchenside4w', 'Farris', 'Kitchenside', '1973-02-20', 'Solkan', '5250', 3),
       (34533, 'RU', 'swedlock4x', 'Stacy', 'Wedlock', '1999-11-08', 'Novobiryusinskiy', '665061', 2),
       (45812, 'DK', 'smagwood4z', 'Sydelle', 'Magwood', '2005-01-05', 'København', '1567', 2),
       (39328, 'PL', 'benser52', 'Bryn', 'Enser', '1977-10-09', 'Ostrowsko', '34-432', 1),
       (42374, 'PL', 'kbrazier55', 'Koo', 'Brazier', '1962-07-03', 'Jeżów', '95-047', 1),
       (14649, 'US', 'hbenley56', 'Hilton', 'Benley', '1955-09-03', 'Columbus', '43215', 2),
       (81975, 'PL', 'aworsnup5b', 'Amandy', 'Worsnup', '1994-06-19', 'Opatów', '42-152', 2),
       (26230, 'PL', 'npetrasek5d', 'Niel', 'Petrasek', '1951-08-22', 'Kozy', '43-340', 0),
       (68401, 'CZ', 'krutter5i', 'Karoly', 'Rutter', '1952-12-28', 'Ostrožská Nová Ves', '687 22', 2),
       (31365, 'PT', 'jmcgow5j', 'Jenine', 'McGow', '1999-09-16', 'Zibreira', '2350-833', 3),
       (42715, 'JP', 'drotge5k', 'Derick', 'Rotge', '2006-08-27', 'Toyama-shi', '939-8282', 2),
       (40847, 'SE', 'gyashanov5l', 'Glyn', 'Yashanov', '2003-03-18', 'Strängnäs', '645 51', 0),
       (10238, 'PT', 'bwinkell5n', 'Bank', 'Winkell', '1995-03-20', 'Pegões', '2985-209', 1),
       (69296, 'PT', 'apashe5o', 'Adara', 'Pashe', '1978-09-22', 'Ribeira Seca', '9600-213', 1),
       (43955, 'PL', 'lpexton5p', 'Loni', 'Pexton', '1959-11-27', 'Rajsko', '32-626', 3),
       (93543, 'US', 'tjuschke5r', 'Tiena', 'Juschke', '2008-07-06', 'Jamaica', '11407', 2),
       (93966, 'MX', 'awimp5s', 'Alica', 'Wimp', '1957-11-28', 'San Jose', '26017', 2),
       (68874, 'US', 'sburkart5t', 'Skipp', 'Burkart', '1972-08-20', 'Pensacola', '32505', 3),
       (46884, 'PT', 'dansley5u', 'Domingo', 'Ansley', '1967-08-06', 'Venda', '4620-472', 0),
       (71162, 'US', 'chursthouse5w', 'Caressa', 'Hursthouse', '1954-01-03', 'Omaha', '68144', 3),
       (30808, 'PL', 'cbartaletti5x', 'Cherish', 'Bartaletti', '1954-06-14', 'Suchy Las', '62-002', 0),
       (01815, 'IT', 'cluciani5y', 'Crystal', 'Luciani', '1960-02-12', 'Reggio Calabria', '89129', 3),
       (94681, 'MX', 'cpeyto5z', 'Claire', 'Peyto', '1982-03-12', 'Fernando Gutierrez Barrios', '93420', 2),
       (62185, 'BR', 'gllewellin63', 'Ginni', 'Llewellin', '2005-10-14', 'Senador Pompeu', '63600-000', 0),
       (44322, 'BR', 'mumpleby65', 'Moses', 'Umpleby', '1956-08-12', 'Piraí do Sul', '84240-000', 2),
       (71199, 'JP', 'dspradbrow6c', 'Del', 'Spradbrow', '1985-09-30', 'Tarui', '590-0521', 1),
       (55362, 'RU', 'dpritchitt6d', 'Donny', 'Pritchitt', '1965-07-14', 'Zabaykal’sk', '665259', 2),
       (88222, 'RU', 'kaspall6f', 'Kort', 'Aspall', '1960-04-01', 'Pesochnoye', '662360', 0),
       (78901, 'RU', 'speret6g', 'Shannon', 'Peret', '1984-08-23', 'Staritsa', '171399', 0),
       (55051, 'RU', 'lskarman6i', 'Loraine', 'Skarman', '1976-07-01', 'Shchelkovo', '682482', 2),
       (70245, 'BR', 'sdugue6j', 'Shirl', 'Dugue', '1997-03-06', 'Quatro Barras', '83420-000', 0),
       (79041, 'MX', 'fblaszczynski6k', 'Free', 'Blaszczynski', '1965-08-31', 'San Pedro', '37861', 1),
       (05018, 'RU', 'lmatresse6m', 'Livy', 'Matresse', '2004-01-16', 'Kraskino', '692715', 1),
       (34566, 'US', 'akuhwald6o', 'Althea', 'Kuhwald', '1993-09-04', 'Atlanta', '30351', 2),
       (57510, 'SE', 'cgoudie6q', 'Carla', 'Goudie', '2009-01-26', 'Älvdalen', '796 25', 2),
       (66320, 'NO', 'hbreton6t', 'Hendrick', 'Breton', '2002-04-28', 'Drammen', '3037', 0),
       (12646, 'PT', 'dswyer6u', 'Donia', 'Swyer', '1992-05-08', 'Cruzeiro', '4640-324', 0),
       (19518, 'US', 'oblesing6x', 'Odele', 'Blesing', '1969-12-09', 'Punta Gorda', '33982', 0),
       (66710, 'SE', 'lknight72', 'Lorianna', 'Knight', '2000-11-07', 'Linköping', '589 41', 0),
       (43580, 'PL', 'dglowacha74', 'Dawna', 'Glowacha', '1985-03-15', 'Baruchowo', '87-821', 3),
       (93523, 'FI', 'pmulrean75', 'Pattie', 'Mulrean', '1971-12-13', 'Joutseno', '54101', 2),
       (33257, 'US', 'nomolan77', 'Nani', 'O'' Molan', '1984-08-06', 'Oklahoma City', '73179', 1),
       (86016, 'RU', 'ttroucher78', 'Tallou', 'Troucher', '1992-07-21', 'Shali', '366309', 2),
       (31428, 'AR', 'lbusby7a', 'Lotta', 'Busby', '1952-12-24', 'Santa Fe de la Vera Cruz', '3001', 2),
       (50155, 'PL', 'mcanny7b', 'Mano', 'Canny', '1965-08-12', 'Słupno', '09-472', 3),
       (79196, 'JP', 'jleguay7c', 'Joye', 'Leguay', '1964-08-01', 'Gōdo', '503-2429', 2),
       (38977, 'US', 'praithmill7d', 'Patience', 'Raithmill', '2007-05-27', 'Houston', '77045', 3),
       (59019, 'PT', 'achilvers7f', 'Aurlie', 'Chilvers', '1980-10-01', 'Odivelas', '7900-374', 1),
       (38778, 'SE', 'jantony7g', 'Jerrome', 'Antony', '1962-07-20', 'Stenungsund', '444 24', 1),
       (09023, 'SI', 'dluce7m', 'Dedra', 'Luce', '1958-04-11', 'Apače', '9253', 2),
       (19690, 'JP', 'vhands7n', 'Vachel', 'Hands', '1995-07-26', 'Shibukawa', '979-1451', 2),
       (56908, 'RU', 'vsowman7o', 'Valida', 'Sowman', '2002-10-08', 'Biskamzha', '655735', 3),
       (34948, 'PT', 'ljanczyk7q', 'Lydon', 'Janczyk', '1975-01-19', 'Cernache do Bonjardim', '6100-253', 3),
       (05799, 'PL', 'kpostlewhite7r', 'Karlis', 'Postlewhite', '1985-12-09', 'Miastko', '77-201', 3),
       (84675, 'JP', 'lphipardshears7t', 'Laurene', 'Phipard-Shears', '1979-05-16', 'Makabe', '901-0336', 1),
       (48856, 'RU', 'eloggie7x', 'Eudora', 'Loggie', '1954-08-26', 'Makar’yev', '157460', 0),
       (09009, 'US', 'bghioni7z', 'Bailey', 'Ghioni', '1982-08-21', 'Nashville', '37220', 0),
       (25410, 'CZ', 'lbawcock81', 'Levy', 'Bawcock', '1979-08-26', 'Stráž', '430 01', 1),
       (36134, 'CZ', 'dsmallbone82', 'Dorey', 'Smallbone', '1974-05-20', 'Sobotín', '788 16', 2),
       (86385, 'SE', 'eanniwell83', 'Eric', 'Anniwell', '1998-07-07', 'Växjö', '351 97', 3),
       (56985, 'BR', 'lmiko84', 'Lorrayne', 'Miko', '1966-10-28', 'Paracuru', '62680-000', 1),
       (00914, 'JP', 'irumsey85', 'Igor', 'Rumsey', '1967-07-16', 'Susaki', '987-0352', 2),
       (74000, 'CZ', 'dbockler86', 'Deonne', 'Bockler', '1964-12-22', 'Habry', '582 81', 0),
       (34714, 'SE', 'neitter88', 'Neils', 'Eitter', '1959-03-14', 'Kristianstad', '291 88', 0),
       (57641, 'BR', 'trump8b', 'Thibaud', 'Rump', '1958-05-09', 'Catalão', '75700-000', 0),
       (07008, 'LT', 'gvanichkov8d', 'Garner', 'Vanichkov', '1994-03-09', 'Vievis', '21058', 1),
       (74851, 'SE', 'iwynter8f', 'Inga', 'Wynter', '1981-02-21', 'Linköping', '584 22', 1),
       (55356, 'BR', 'dmoggle8j', 'Daryl', 'Moggle', '1956-07-28', 'Alenquer', '68200-000', 3),
       (80085, 'PT', 'klewens8l', 'Kahaleel', 'Lewens', '1970-11-29', 'Vila Viçosa', '7160-208', 2),
       (73925, 'NO', 'mbrasier8o', 'Martie', 'Brasier', '1963-10-10', 'Skien', '3716', 2),
       (45177, 'PL', 'gferbrache8p', 'Gregoor', 'Ferbrache', '1977-11-15', 'Konstantynów Łódzki', '95-050', 2),
       (09496, 'AR', 'nkleint8q', 'Nomi', 'Kleint', '1961-10-21', 'Concordia', '3200', 1),
       (97628, 'RU', 'emeron8s', 'Emmanuel', 'Meron', '1959-06-24', 'Kavalerovo', '692425', 3),
       (69940, 'JP', 'sflaunier8t', 'Susanna', 'Flaunier', '2002-09-26', 'Higashimurayama-shi', '359-1144', 0),
       (65518, 'PT', 'jbedwell8u', 'Jecho', 'Bedwell', '1971-04-24', 'Corujeira', '4580-630', 3),
       (19972, 'PL', 'jbedding8z', 'Jean', 'Bedding', '1990-05-06', 'Łubnice', '98-432', 0),
       (76796, 'BR', 'fmcminn90', 'Franky', 'McMinn', '1954-05-12', 'Mucuri', '45930-000', 3),
       (53938, 'HR', 'ejoney91', 'Erv', 'Joney', '2009-05-20', 'Vinež', '52220', 3),
       (16609, 'PL', 'mhew95', 'Monti', 'Hew', '1951-10-30', 'Mszana Dolna', '34-730', 0),
       (31231, 'SE', 'lsnoding96', 'Lisle', 'Snoding', '1980-12-23', 'Åhus', '296 81', 3),
       (97878, 'PL', 'lyashunin9a', 'Link', 'Yashunin', '1958-07-14', 'Stary Sącz', '33-340', 0),
       (45071, 'CZ', 'evoak9b', 'Elenore', 'Voak', '1957-07-21', 'Jablonec nad Jizerou', '512 43', 2),
       (36230, 'BR', 'tbrindle9c', 'Tedi', 'Brindle', '1955-11-09', 'Chapecó', '89800-000', 1),
       (73324, 'PL', 'kleathlay9d', 'Kynthia', 'Leathlay', '1977-10-08', 'Wińsko', '56-160', 2),
       (91038, 'RU', 'aimrie9e', 'Arleen', 'Imrie', '2007-03-31', 'Mayrtup', '366319', 0),
       (76775, 'US', 'tsimkins9f', 'Talya', 'Simkins', '1991-08-24', 'Washington', '20530', 3),
       (06191, 'PT', 'pbudd9g', 'Pincus', 'Budd', '2006-12-25', 'Ferreiras', '8200-567', 2),
       (61544, 'HR', 'ghornig9i', 'Gabby', 'Hornig', '1962-03-09', 'Bršadin', '32222', 3),
       (76923, 'RU', 'hbendle9k', 'Henrik', 'Bendle', '1980-10-09', 'Pushkino', '142139', 3),
       (34356, 'PL', 'slulham9n', 'Stanwood', 'Lulham', '1995-04-28', 'Rekowo Dolne', '84-240', 0),
       (95932, 'BR', 'bhanford9o', 'Bernadette', 'Hanford', '1994-04-15', 'Soure', '68870-000', 0),
       (55587, 'AR', 'kscarman9s', 'Kandace', 'Scarman', '1950-10-15', 'La Poma', '4415', 0),
       (86705, 'RU', 'bfelderer9t', 'Brendon', 'Felderer', '1951-05-13', 'Vypolzovo', '171053', 3),
       (89398, 'FI', 'ldurran9u', 'Lewes', 'Durran', '1963-08-25', 'Porvoo', '06500', 3),
       (68281, 'JP', 'jweavers9v', 'Jannel', 'Weavers', '2003-10-14', 'Ino', '911-0812', 1),
       (76455, 'CZ', 'pmcnirlan9x', 'Parker', 'McNirlan', '1976-05-13', 'Klášter', '582 83', 2),
       (21994, 'SE', 'cwrought9y', 'Caddric', 'Wrought', '1955-04-15', 'Söderhamn', '826 31', 2),
       (49014, 'NO', 'ehedge9z', 'Evin', 'Hedge', '1984-07-20', 'Oslo', '0760', 0),
       (91000, 'RU', 'gfoulstonea0', 'Germaine', 'Foulstone', '1967-03-05', 'Fershampenuaz', '457650', 2),
       (52106, 'MX', 'icraigheida1', 'Isidoro', 'Craigheid', '1994-08-27', 'Independencia', '56617', 2),
       (24773, 'RU', 'dhallatta2', 'Doro', 'Hallatt', '1971-09-12', 'Selikhino', '398032', 2),
       (94629, 'PL', 'mgatecliffa4', 'Martynne', 'Gatecliff', '1967-11-21', 'Raciążek', '87-721', 3),
       (83268, 'PL', 'mnoirela6', 'Mill', 'Noirel', '2004-12-13', 'Rzozów', '32-060', 0),
       (08006, 'HR', 'jwoodruffea9', 'Jeannine', 'Woodruffe', '1951-06-01', 'Tučepi', '21325', 0),
       (95897, 'US', 'whartleburyaa', 'Wendel', 'Hartlebury', '1973-04-16', 'Bryan', '77806', 3),
       (04733, 'AU', 'epossellab', 'Ellene', 'Possell', '1992-12-27', 'Eastern Suburbs Mc', '1315', 2),
       (15825, 'BR', 'bmyfordae', 'Banky', 'Myford', '2007-12-04', 'Ipiaú', '45570-000', 3),
       (14995, 'CZ', 'gwiganak', 'Georges', 'Wigan', '1980-02-22', 'Nový Bydžov', '504 01', 3),
       (00441, 'BG', 'gklainal', 'Gibby', 'Klain', '2000-07-06', 'Brusartsi', '3921', 3),
       (67743, 'AU', 'jkenanam', 'Janelle', 'Kenan', '1971-07-15', 'Eastern Suburbs Mc', '1325', 3),
       (52655, 'FI', 'ebondleyan', 'Eadie', 'Bondley', '1958-01-04', 'Kiiminki', '90901', 3),
       (46817, 'PL', 'cleiskau', 'Carole', 'Leisk', '1984-06-11', 'Ochojno', '60-222', 3),
       (58677, 'JP', 'dcullingtonav', 'Drake', 'Cullington', '1989-01-12', 'Sakaidechō', '769-0228', 3),
       (66652, 'RU', 'psturdyaw', 'Perry', 'Sturdy', '1979-09-01', 'Spas-Zaulok', '141667', 0),
       (69609, 'US', 'jticksallax', 'Jaimie', 'Ticksall', '1984-07-07', 'Albuquerque', '87201', 1),
       (48539, 'SE', 'jstatteraz', 'Jarrett', 'Statter', '1992-03-28', 'Lidingö', '181 85', 3),
       (70897, 'JP', 'dbenezeitb1', 'Duffy', 'Benezeit', '1968-12-25', 'Yamaguchi-shi', '754-0021', 3),
       (88079, 'PL', 'abrookerb2', 'Adena', 'Brooker', '1979-10-04', 'Wola Sernicka', '21-107', 1);

INSERT INTO Artist
VALUES (51060, 'John', 'Lennon', 'Singer, songwriter, and peace activist', '1940-10-09', 'GB','John Lennon'),
       (33547, 'Elton', 'John', 'Pianist and composer', '1947-03-25', 'GB','Elton John'),
       (42340, 'Beyoncé', 'Knowles', 'Singer, songwriter, and actress', '1981-09-04', 'US','Beyoncé'),
       (60085, 'Freddie', 'Mercury', 'Singer, songwriter, and record producer', '1946-09-05', 'TZ','Freddie Mercury (Queen)'),
       (74677, 'Bob', 'Dylan', 'Singer-songwriter, author, and visual artist', '1941-05-24', 'US','Bob Dylan'),
       (70862, 'Madonna', 'Ciccone', 'Singer, songwriter, actress, and businesswoman', '1958-08-16', 'US','Madonna'),
       (51997, 'Jimi', 'Hendrix', 'Singer, songwriter, and guitarist', '1942-11-27', 'US','Jimi Hendrix'),
       (56246, 'David', 'Bowie', 'Singer, songwriter, and actor', '1947-01-08', 'GB','David Bowie'),
       (35632, 'Aretha', 'Franklin', 'Singer, songwriter, and pianist', '1942-03-25', 'US','Aretha Franklin'),
       (73863, 'Miles', 'Davis', 'Trumpeter, bandleader, and composer', '1926-05-26', 'US','Miles Davis'),
       (20150, 'Ella', 'Fitzgerald', 'Singer', '1917-04-25', 'US','Ella Fitzgerald'),
       (07667, 'Stevie', 'Wonder', 'Singer, songwriter, and multi-instrumentalist', '1950-05-13', 'US','Stevie Wonder'),
       (46035, 'Prince', 'Nelson', 'Singer, songwriter, and musician', '1958-06-07', 'US','Prince'),
       (74540, 'Whitney', 'Houston', 'Singer and actress', '1963-08-09', 'US','Whitney Houston'),
       (28074, 'Frank', 'Sinatra', 'Singer and actor', '1915-12-12', 'US','Frank Sinatra'),
       (13944, 'Mariah', 'Carey', 'Singer, songwriter, and actress', '1970-03-27', 'US','Mariah Carey'),
       (49643, 'Ludwig', 'van Beethoven', 'Composer and pianist', '1770-12-16', 'AT','Beethoven'),
       (59126, 'Wolfgang', 'Amadeus Mozart', 'Composer', '1756-01-27', 'AT','Mozart'),
       (50798, 'Johann', 'Sebastian Bach', 'Composer and musician', '1685-03-21', 'DE','Johann Sebastian Bach'),
       (83473, 'Giuseppe', 'Verdi', 'Composer', '1813-10-10', 'IT','Giuseppe Verdi'),
       (11556, 'Janelle', 'Monáe', 'Singer-songwriter, actress, and producer', '1985-12-01', 'US','Janelle Monáe'),
       (64042, 'Leonard', 'Cohen', 'Singer-songwriter, poet, and novelist', '1934-09-21', 'CA','Leonard Cohen'),
       (24126, 'Nina', 'Simone', 'Singer, songwriter, and civil rights activist', '1933-02-21', 'US','Nina Simone'),
       (39909, 'Joni', 'Mitchell', 'Singer-songwriter and painter', '1943-11-07', 'CA','Joni Mitchell'),
       (46082, 'Kendrick', 'Lamar', 'Rapper, songwriter, and record producer', '1987-06-17', 'US','Kendrick Lamar'),
       (77210, 'Amy', 'Winehouse', 'Singer-songwriter', '1983-09-14', 'GB','Amy Winehouse'),
       (94854, 'Adele', 'Adkins', 'Singer-songwriter', '1988-05-05', 'GB','Adele'),
       (30349, 'Ed', 'Sheeran', 'Singer-songwriter and record producer', '1991-02-17', 'GB','Ed Sheeran'),
       (58841, 'Lana', 'Del Rey', 'Singer-songwriter and record producer', '1985-06-21', 'US','Lana Del Rey'),
       (48428, 'Billie', 'Eilish', 'Singer-songwriter', '2001-12-18', 'US','Billie Eilish'),
       (23992, 'Aubrey', 'Drake', 'Grammy award-winning Canadian rapper, singer, songwriter', '1986-10-24', 'US','Drake'),
       (45222, 'Kanye', 'West', 'American rapper, singer, songwriter, and record producer', '1977-06-08', 'US','Kanye West'),
       (98888, 'Shawn', 'Carter', 'American rapper, songwriter, and record executive', '1969-12-04', 'US','Jay Z'),
       (11444, 'Marshall', 'Mathers', 'American rapper, songwriter, and record producer', '1972-10-17', 'US','Eminem'),
       (56159, 'Jacques', 'Webster', 'American rapper, singer, songwriter, and record producer', '1992-04-30', 'US','Travis Scott');





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
        19th and early 20th centuries, characterized by its emotive vocals and Christian lyrics.'),
       (11111, ' Rap ',
        ' a popular musical genre characterized by its rhythmic spoken or chanted lyrics delivered over a beat or instrumental track');


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
       (92992, 'DAMN.', '2017-04-14', 46082), -- kendrick lamar
       (93455, 'Certified Lover Boy.', '2021-09-03', 45222), -- drake
       (45531, 'The Marshall Mathers LP.', '2000-05-23', 11444), -- eminem
       (33344, 'Astroworld', '2018-08-03', 56159), -- travis scott
       (33345, 'Birds in the Trap Sing McKnight', '2016-09-02', 56159), -- travis scott

       (99943, 'When We All Fall Asleep, Where Do We Go?', '2019-03-29', 48428), -- Billie Eilish


       (01010, 'The College Dropout', '2004-02-10', 45222), -- kanye west
       (01011, 'Yeezus', '2013-06-18', 45222); -- kanye west









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
       ('KDL01', 'HUMBLE.', 37898, '00:02:57', 92992),                       -- kendrick Lamar
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
       ('DRK01', 'Champagne Poetry', 11111, '00:05:36', 93455), -- drake
       ('DRK02', 'Papi''s Home', 11111, '00:03:35', 93455), -- drake
       ('DRK03', 'Fair Trade', 11111, '00:04:51', 93455), -- drake feat travis scott
       ('DRK04', 'Love All', 11111, '00:03:55', 93455), -- drake feat jayz
       ('EMI01', 'Stan', 11111, '00:06:44', 45531), -- eminem
       ('EMI02', 'The Real Slim Shady', 11111, '00:04:44', 45531),
       ('EMI03', 'Kill You', 11111, '00:04:24', 45531),
       ('EMI04', 'The Way I Am', 11111, '00:04:50', 45531),
       ('TRA01', 'Stargazing', 11111, '00:04:30', 33344), -- travis scott
       ('TRA02', 'Sicko Mode', 11111, '00:05:12', 33344), -- travis scott feat drake
       ('TRA03', 'Stop Trying to Be God', 11111, '00:05:38', 33344),
       ('TRA04', 'Carousel', 11111, '00:05:13', 33344),
       ('TRA05', 'Wake Up', 11111, '00:03:51', 33344),
       ('TRA06', 'goosebumps', 11111, '00:04:03', 33345), -- feat  kendrick lamar
       ('TRA07', 'pick up the phone', 11111, '00:04:12', 33345),
       ('TRA08', 'beibs in the trap', 11111, '00:03:33', 33345),
       ('BIL01', 'Bad Guy', 27867, '00:03:14', 99943), -- Billie Eilish
       ('BIL02', 'Xanny', 27867, '00:04:04', 99943), -- Billie Eilish
       ('BIL03', 'You Should See Me in a Crown', 27867, '00:03:01', 99943), -- Billie Eilish
       ('BIL04', 'All the Good Girls Go to Hell', 27867, '00:02:49', 99943), -- Billie Eilish
       ('BIL05', 'Wish You Were Gay', 27867, '00:03:42', 99943), -- Billie Eilish
       ('KAN01', 'Through the Wire', 11111, '00:03:41', 01010), -- kanye west 1
       ('KAN02', 'All Falls Down', 11111, '00:03:43', 01010), -- kanye west 1
       ('KAN03', 'Jesus Walks', 11111, '00:03:13', 01010), -- kanye west 1
       ('KAN04', 'Spaceship', 11111, '00:05:24', 01010), -- kanye west 1
       ('KAN05', 'Slow Jamz', 11111, '00:05:16', 01010), -- kanye west 1
       ('KAN06', 'The New Workout Plan', 11111, '00:05:22', 01010), -- kanye west 1
       ('KAN07', 'Black Skinhead', 11111, '00:03:08', 01011), -- kanye west 2
       ('KAN08', 'New Slaves', 11111, '00:04:16', 01011), -- kanye west 2
       ('KAN09', 'Hold My Liquor', 11111, '00:05:27', 01011), -- kanye west 2
       ('KAN10', 'Blood on the Leaves', 11111, '00:06:00', 01011), -- kanye west 2
       ('KAN11', 'Bound 2', 11111, '00:03:49', 01011), -- kanye west 2
       ('KAN12', 'I Am a God', 11111, '00:03:51', 01011), -- kanye west 2
       ('BETH1', 'Symphony No. 5 in C minor, Op. 67 (1st movement)', 92536, '00:07:30', null ), -- Beethoven
       ('BETH2', 'Moonlight Sonata, Op. 27, No. 2 (1st movement)', 92536, '00:06:30', null), -- Beethoven
       ('BETH3', 'Symphony No. 9 in D minor, Op. 125 (4th movement, "Ode to Joy")', 92536, '00:23:30', null), -- Beethoven
       ('BETH4', 'Für Elise, WoO 59', 92536, '00:03:20', null), -- Beethoven
       ('BETH5', 'Symphony No. 6 in F major, Op. 68 ("Pastoral") (1st movement)', 92536, '00:10:30', null), -- Beethoven
       ('BETH6', 'Piano Sonata No. 8 in C minor, Op. 13 ("Pathétique") (2nd movement)', 92536, '00:04:45', null), -- Beethoven
       ('BETH7', 'Symphony No. 7 in A major, Op. 92 (2nd movement)', 92536, '00:08:30', null), -- Beethoven
       ('BETH8', 'Violin Concerto in D major, Op. 61 (1st movement)', 92536, '00:24:00', null), -- Beethoven
       ('MOZ01', 'Symphony No. 40 in G minor, K. 550 (1st movement)', 92536, '00:07:45', null ), -- mozart
       ('MOZ02', 'Eine Kleine Nachtmusik, K. 525 (1st movement)', 92536, '00:05:50', null), -- mozart
       ('MOZ03', 'Piano Sonata No. 11 in A major, K. 331 (3rd movement, "Rondo alla turca")', 92536, '00:03:30', null), -- mozart
       ('MOZ04', 'Clarinet Concerto in A major, K. 622 (2nd movement)', 92536, '00:08:30', null), -- mozart
       ('MOZ05', 'Don Giovanni, K. 527 (overture)', 92536, '00:6:00', null), -- mozart
       ('MOZ06', 'Requiem in D minor, K. 626 (Dies irae)', 92536, '00:01:45', null), -- mozart
       ('MOZ07', 'Symphony No. 41 in C major, K. 551 ("Jupiter") (4th movement)', 92536, '00:08:45', null), -- mozart
       ('MOZ08', 'The Magic Flute, K. 620 (overture)', 92536, '00:07:00', null), -- mozart
       ('MOZ09', 'Piano Concerto No. 21 in C major, K. 467 (2nd movement)', 92536, '00:06:45', null), -- mozart
       ('MOZ10', 'Symphony No. 25 in G minor, K. 183 (1st movement)', 92536, '00:08:30', null); -- mozart


INSERT Playlist
VALUES (84356, 'Classic Pop Rock Anthems', 00441,
        'A playlist featuring timeless hits from the 60s, 70s, and 80s that are sure to get you singing and dancing along.'),
       (78513, 'Soothing Acoustic Melodies for Relaxation and Focus', 67743,
        'A collection of calm and peaceful acoustic songs perfect for unwinding and focusing.'),
       (12865, 'Upbeat and Energetic Pop Hits for Workouts and Dance Parties', 52655,
        'A playlist featuring high-energy and upbeat pop songs that will keep you motivated during your workouts and dance parties.'),
       (78911, 'Mellow Jazz and Blues for Cozy Nights In', 46817,
        'A selection of smooth and relaxing jazz and blues tracks to set the mood for a cozy night in.'),
       (11520, 'Eclectic Mix of Indie and Alternative Rock for Road Trips and Adventures', 58677,
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

       (23992, 'DRK01'),
       (23992, 'DRK02'),
       (23992, 'DRK03'),
       (23992, 'DRK04'),

       (56159, 'DRK03'), -- travis scott feat drake
       (98888, 'DRK04'), -- jay Z feat drake

       (11444, 'EMI01'),
       (11444, 'EMI02'),
       (11444, 'EMI03'),
       (11444, 'EMI04'),

       (56159, 'TRA01'),
       (56159, 'TRA02'),
       (56159, 'TRA03'),
       (56159, 'TRA04'),
       (56159, 'TRA05'),
       (56159, 'TRA06'),
       (56159, 'TRA07'),
       (56159, 'TRA08'),

       (23992, 'TRA02'), -- travis feat drake
       (46082, 'TRA06'), -- travis feat kendrick lamar

       (48428, 'BIL01'), -- Billie Eilish
       (48428, 'BIL02'), -- Billie Eilish
       (48428, 'BIL03'), -- Billie Eilish
       (48428, 'BIL04'), -- Billie Eilish
       (48428, 'BIL05'), -- Billie Eilish



       (45222, 'KAN01'), -- Kanye west
       (45222, 'KAN02'), -- Kanye west
       (45222, 'KAN03'), -- Kanye west
       (45222, 'KAN04'), -- Kanye west
       (45222, 'KAN05'), -- Kanye west
       (45222, 'KAN06'), -- Kanye west
       (45222, 'KAN07'), -- Kanye west
       (45222, 'KAN08'), -- Kanye west
       (45222, 'KAN09'), -- Kanye west
       (45222, 'KAN10'), -- Kanye west
       (45222, 'KAN11'), -- Kanye west
       (45222, 'KAN12'), -- Kanye west

       (49643, 'BETH1'),  -- Beethoven
       (49643, 'BETH2'),  -- Beethoven
       (49643, 'BETH3'),  -- Beethoven
       (49643, 'BETH4'),  -- Beethoven
       (49643, 'BETH5'),  -- Beethoven
       (49643, 'BETH6'),  -- Beethoven
       (49643, 'BETH7'),  -- Beethoven
       (49643, 'BETH8'),  -- Beethoven


       (59126, 'MOZ01'),  -- Mozart
       (59126, 'MOZ02'),  -- Mozart
       (59126, 'MOZ03'),  -- Mozart
       (59126, 'MOZ04'),  -- Mozart
       (59126, 'MOZ05'),  -- Mozart
       (59126, 'MOZ06'),  -- Mozart
       (59126, 'MOZ07'),  -- Mozart
       (59126, 'MOZ08'),  -- Mozart
       (59126, 'MOZ09'),  -- Mozart
       (59126, 'MOZ10');  -- Mozart


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