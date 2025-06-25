/*
Используя сервисы для генерации данных, например http://filldb.info/ , сгенерируйте дамп для таблицы users (не менее 20 тестовых записей). И вставьте полученный код в textbox.

Не забудьте использовать именно пакетную вставку данных!

В поле можно вставить только 1 команду.

 

Вид таблицы users:
*/

CREATE TABLE users(
	id 			 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	birthday DATE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE, 
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

INSERT INTO `users` VALUES
(101,'Sandra','Weber',NULL,'miguel.wiza@example.com','1996-06-09','e6b42da6575a293025f31b584e3bc031a84e73e5',297),
(102,'Tyree','VonRueden',NULL,'willms.brisa@example.net','2015-01-26','9e67d11f93e05ec96ae1857d1868d47f8a37d07d',0),
(103,'Dolores','Dickens',NULL,'lisette23@example.net','1983-02-25','62d0afaee71949adc97dddce844101e069a71f5a',1576971057),
(104,'Madonna','Huels',NULL,'aurore51@example.org','1993-08-24','c367774e017ee5da1e20937ea7d6b6b82d261d09',924362),
(105,'Jordi','Treutel',NULL,'breanne.morar@example.org','1977-11-26','17cca95622bd99da9c3115e7fe01b84df04adade',973),
(109,'Paolo','Reilly',NULL,'alanna.mcclure@example.org','1977-08-12','6f217f75e2e041ec1e6cfc09bc50518135ee3dd7',613),
(110,'Katelynn','Berge',NULL,'thora.daniel@example.com','2013-01-31','71114baee58a78ea9de2898c1f50ea2b3b841fd6',447696),
(111,'Hilton','Harvey',NULL,'christophe.heller@example.net','1973-05-23','72185f0e64b57d6e5fcb1c2800878f6f870d2d80',1),
(112,'Gabe','Pfeffer',NULL,'rmccullough@example.com','1985-05-15','b139dfc0e5255568e491158cf0dfdd82120ad13d',1215514274),
(118,'Terrance','Sipes',NULL,'joe.dubuque@example.net','2025-02-09','7c708f0a357bee3e0fe000aff61f3a62c7ac62ad',4514278952),
(119,'Alva','Purdy',NULL,'dandre80@example.com','2000-09-03','8b6c39fff34e2af4bede2c86b4a047a6d96c5ec3',35),
(120,'Georgiana','Nader',NULL,'finn.abbott@example.com','2018-03-31','1dc9f71006632a09253ff728960b3206a65ecb02',344615),
(121,'Luigi','Olson',NULL,'bernier.porter@example.org','2002-03-06','ce7772ffe1579fab587c2b5312e058bdea7e28a3',16),
(123,'Matteo','Abshire',NULL,'vilma.nitzsche@example.com','1991-02-11','3ca0b41dbaa327afb14b23dc19f197afcf23bb7c',845783),
(125,'Cory','Cronin',NULL,'joshuah.cassin@example.net','2008-10-17','026084222df7cac46d73e1f75fe72a575bf2aff8',984498),
(126,'Judd','Walsh',NULL,'hbechtelar@example.com','2005-01-30','dbb0af5f11b5137280803cca5094c76ddb1a2875',115),
(130,'Berenice','Johnston',NULL,'caleigh83@example.net','1980-12-08','6c17b7cba55d5c8fdc779b7da0559dcea609f51f',5485689767),
(132,'Adan','Hermann',NULL,'khudson@example.org','1990-12-20','e4ea213d49ff880c4cc7309aed492cb3af1b5a80',821),
(134,'Orland','Greenholt',NULL,'alvena09@example.org','2012-12-27','d1541d8e4cb0ba204f173c6c2cf43b6cd03184c8',714759),
(135,'Laisha','Feeney',NULL,'kolby06@example.net','1979-05-02','e8a9d59a9ab588249b3c7d32d5a8c71b59068f43',383),
(138,'Krystel','Klein',NULL,'merle.williamson@example.org','1990-07-28','27c1d7d47fc579411ab880ce8aa672aba68db71f',4),
(140,'Roberta','Orn',NULL,'kevin.mccullough@example.net','1972-02-04','44323b0049efb7e7acd2457fc453b05075dcc889',328122),
(141,'Erin','Haley',NULL,'zwaelchi@example.com','1992-09-06','94360e448404e02b314fd331a9c9372ee97a0af6',70),
(145,'Luis','McDermott',NULL,'solon10@example.org','1975-11-23','2aa686b81e0fcc658e1b489770fd641b7d4f4a1d',702),
(146,'Adrienne','Buckridge',NULL,'eliane.quigley@example.net','1977-09-17','a261ce724212ebaaceb54f4b7c649e10a2862823',51),
(149,'Daren','Bosco',NULL,'jstroman@example.com','2013-07-04','d79c422bca382937705ff594e93172fe7f6d3771',265),
(153,'Chadd','Cremin',NULL,'jhomenick@example.net','1985-10-30','01debf6c2d0fb4ec1a1d7fc11829e4f21ce1ab38',5815426581),
(155,'Jovan','Mueller',NULL,'ustamm@example.org','1984-05-26','93c3c1a7e0f57558ab106d8fc3ddb01be4f0871e',661431),
(162,'Patrick','Herzog',NULL,'abatz@example.org','1983-06-01','a5a1d63a7b3e09e887b81ee5e894e3d49b398fcd',660),
(163,'Arely','Herzog',NULL,'ardella04@example.com','1994-02-14','84b8229c310a9d0aec93af6a6149ba4719b2c76a',954531),
(165,'Dora','Donnelly',NULL,'pouros.estrella@example.org','2023-06-19','be28b58ab5b193251c6eb8a91fffa2e4e32f7e4b',874),
(166,'Myrtie','Lind',NULL,'luettgen.shaylee@example.com','2002-01-13','26a91d5603976bdcc6ccc35a32e3e9a9908e6658',8),
(167,'Leif','Corwin',NULL,'fadel.shana@example.net','1976-04-17','b7e1131bbe1590825a279cc6f50d668967937f27',893403),
(169,'Elizabeth','Kihn',NULL,'bglover@example.com','1987-12-20','e298c8d79f28678b4a46d93e2840e9593604a39b',226),
(173,'Grayce','Pfeffer',NULL,'vincenzo99@example.com','1988-08-30','b0037cb7e8173e64617fd824181080498826a107',271657),
(174,'Gus','Goodwin',NULL,'ebony84@example.org','2015-01-18','898932c2f004842011d1b6c0c22ab43ed5bd221b',959555),
(175,'Guadalupe','O\'Connell',NULL,'eloisa.streich@example.net','2012-04-18','d311ef8b0939feb0eeefce16e0fdb2c0aa6124f9',2),
(176,'Winnifred','Fadel',NULL,'lavern.herzog@example.com','2024-08-22','8b53fb888cdb4f7d46beaa266389dcbb63d101d8',94),
(177,'Miller','Kirlin',NULL,'justine99@example.net','1994-07-24','ea55b1a6f997cd20986610947c12f01a286ae4cb',113),
(178,'Nyasia','Schroeder',NULL,'ashleigh.jacobson@example.com','2006-05-29','f1f0cd5044875a678ae5040471af3dd40382f545',361),
(179,'Raegan','Huels',NULL,'sauer.felicity@example.net','2018-06-09','347c328a15443785cc167d36c7d8bd22b2515f38',133),
(180,'Sophie','Bednar',NULL,'ohessel@example.org','1982-12-04','670aaee583f17a0d4ab293881c012d9bc3507349',6324029259),
(181,'Anissa','Schowalter',NULL,'jaida.wunsch@example.com','1970-06-24','daad6b2fc999669cc046dc18a1f0c49330a35919',669296),
(186,'Timothy','Harris',NULL,'derick.ullrich@example.com','1979-08-07','2c3017fa0cc1334146cad015a9c5d301a11ec959',878060),
(187,'Kirsten','Ferry',NULL,'garrison38@example.com','2014-07-08','7a20c5ac5a7ca0ebdf3bf5e98ea56c01791ed7da',32092),
(190,'Krystal','Bogan',NULL,'laverne80@example.com','1994-05-26','39b1f49d91292cf9f519692390da7f9e251e54b9',725),
(191,'Patience','Bechtelar',NULL,'kswaniawski@example.net','1996-07-31','a491a4a98ca02e0e66f5a326a6efe0dffc408cbb',618839),
(195,'Vincent','Barrows',NULL,'benedict35@example.com','2009-04-20','1e0b0bd9a03576c7a86ecb4ff4bc4e4a29cdce87',826),
(197,'Marjorie','Jenkins',NULL,'isaiah80@example.org','1985-04-18','dd941796eafffcd42bf6579ccc09cc301bb6de89',624933),
(198,'Aimee','Mohr',NULL,'kuhn.kadin@example.com','1992-09-18','21a89936c8ece9a640618353003bb67753df6569',421391),
(199,'Ariane','Huel',NULL,'kreynolds@example.org','2020-09-19','919fd7159676c38a3d70845525103a2ff1f5b4f2',89);