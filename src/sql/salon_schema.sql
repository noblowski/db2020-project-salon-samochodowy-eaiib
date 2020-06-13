drop schema if exists salon;
create schema salon;
use salon;
-- tworzenie tabel


create table if not exists salon.klienci (
	idKlienta integer not null primary key auto_increment,
	Imie varchar(30),
	Nazwisko varchar(30)
);

create table if not exists salon.marki (
	idMarki integer not null primary key auto_increment,
	nazwa varchar(20) not null
);

create table if not exists salon.modele (
	idModelu integer not null primary key auto_increment,
	nazwa varchar(20) not null,
	idMarki integer not null,
    foreign key(idMarki) references salon.marki(idMarki)
);

create table if not exists salon.nadwozia (
	idNadwozia integer not null primary key auto_increment,
	nazwa varchar(30) not null
);


create table if not exists salon.silniki (
	idSilnika integer not null primary key auto_increment,
	rodzaj_paliwa varchar(20),
	pojemnosc numeric(2,1) not null,
	uklad varchar(30),
	moc integer,
	moment_obrotowy integer
);

create table if not exists salon.konfiguracje (
	idKonfiguracji integer not null primary key auto_increment,
	idNadwozia integer,
	idSilnika integer,
	kolor varchar(20),
	foreign key(idNadwozia) references salon.nadwozia(idNadwozia),
	foreign key(idSilnika) references salon.silniki(idSilnika)
);

create table if not exists salon.samochody (
	idSamochodu integer not null primary key auto_increment,
	idMarki integer not null,
	idModelu integer not null,
	idKonfiguracji integer not null,
	foreign key(idMarki) references salon.marki(idMarki),
	foreign key(idModelu) references salon.modele(idModelu),
	foreign key(idKonfiguracji) references salon.konfiguracje(idKonfiguracji)
);

create table if not exists salon.zamowienia (
	id_zamowienia integer not null primary key auto_increment,
	idKlienta integer not null,
	idSamochodu integer not null,
	data_zamowienia date not null,
	metoda_platnosci varchar(15) not null,
   	foreign key(idKlienta) references salon.klienci(idKlienta),
	foreign key(idSamochodu) references salon.samochody(idSamochodu)
);


-- dodawanie rekordów

-- dodawanie klientów
	
insert into klienci values (1, 'Hedda', 'Wallsworth');
insert into klienci values (2, 'Abagael', 'Lindmark');
insert into klienci values (3, 'Hanni', 'Rigate');
insert into klienci values (4, 'Giacopo', 'Boyington');
insert into klienci values (5, 'Carmita', 'Pockey');
insert into klienci values (6, 'Gnni', 'Shilladay');
insert into klienci values (7, 'Sasha', 'Mowsley');
insert into klienci values (8, 'Brooke', 'Fullilove');
insert into klienci values (9, 'Reece', 'Jumonet');
insert into klienci values (10, 'Emelita', 'Kevane');
insert into klienci values (11, 'Kacey', 'Terrazzo');
insert into klienci values (12, 'Britt', 'Dienes');
insert into klienci values (13, 'Winfield', 'Eykelbosch');
insert into klienci values (14, 'Nara', 'Churchouse');
insert into klienci values (15, 'Clari', 'Shackle');
insert into klienci values (16, 'Lucille', 'Cake');
insert into klienci values (17, 'Bil', 'Martinot');
insert into klienci values (18, 'Karleen', 'MacCulloch');
insert into klienci values (19, 'Lanie', 'Benzi');
insert into klienci values (20, 'Othilia', 'Perin');
insert into klienci values (21, 'Dory', 'Bernaldez');
insert into klienci values (22, 'Conan', 'Datte');
insert into klienci values (23, 'Ysabel', 'Holsall');
insert into klienci values (24, 'Ava', 'Hounsham');
insert into klienci values (25, 'Margy', 'Lacrouts');
insert into klienci values (26, 'Rustin', 'Rousell');
insert into klienci values (27, 'Franny', 'Swine');
insert into klienci values (28, 'Jeanne', 'Alcorn');
insert into klienci values (29, 'Georgy', 'Thwaites');
insert into klienci values (30, 'Georgi', 'Meins');
insert into klienci values (31, 'Lyndel', 'Wickmann');
insert into klienci values (32, 'Marlee', 'Barense');
insert into klienci values (33, 'Hurleigh', 'Justis');
insert into klienci values (34, 'Brynna', 'Brevitt');
insert into klienci values (35, 'Judd', 'Buckam');
insert into klienci values (36, 'Sunny', 'Liddy');
insert into klienci values (37, 'Ellen', 'Summerson');
insert into klienci values (38, 'Arleen', 'Le Lievre');
insert into klienci values (39, 'Mellicent', 'Witcher');
insert into klienci values (40, 'Grier', 'Wornum');
insert into klienci values (41, 'Andre', 'Licciardo');
insert into klienci values (42, 'Barbee', 'Laroux');
insert into klienci values (43, 'Doralynn', 'Clamp');
insert into klienci values (44, 'Thorsten', 'Chrisp');
insert into klienci values (45, 'Ad', 'Gillion');
insert into klienci values (46, 'Ernaline', 'Mebius');
insert into klienci values (47, 'Cecile', 'Taplin');
insert into klienci values (48, 'Billie', 'Gallehock');
insert into klienci values (49, 'Terrell', 'Spreull');
insert into klienci values (50, 'Theo', 'Seymark');
insert into klienci values (51, 'Libbey', 'Haggis');
insert into klienci values (52, 'Leila', 'Clancy');
insert into klienci values (53, 'Midge', 'Dreelan');
insert into klienci values (54, 'Devin', 'Kuhnwald');
insert into klienci values (55, 'Catlee', 'Tidgewell');
insert into klienci values (56, 'Milton', 'Longhirst');
insert into klienci values (57, 'Adi', 'Yackiminie');
insert into klienci values (58, 'Zacharia', 'Kreutzer');
insert into klienci values (59, 'Bliss', 'Haylett');
insert into klienci values (60, 'Legra', 'Ghirardi');
insert into klienci values (61, 'Townsend', 'Hugill');
insert into klienci values (62, 'Aldus', 'Gasquoine');
insert into klienci values (63, 'Georgette', 'Endon');
insert into klienci values (64, 'Shani', 'Lording');
insert into klienci values (65, 'Belle', 'Armitt');
insert into klienci values (66, 'Isis', 'Bolam');
insert into klienci values (67, 'Noni', 'Stobart');
insert into klienci values (68, 'Martino', 'Cosgriff');
insert into klienci values (69, 'Dollie', 'Anderl');
insert into klienci values (70, 'Hiram', 'Bernhardsson');
insert into klienci values (71, 'Nanny', 'Bowles');
insert into klienci values (72, 'Winne', 'Cone');
insert into klienci values (73, 'Ben', 'Jennions');
insert into klienci values (74, 'Kelby', 'Allans');
insert into klienci values (75, 'Renelle', 'Reidshaw');
insert into klienci values (76, 'Gaby', 'Vaulkhard');
insert into klienci values (77, 'Buffy', 'Karolovsky');
insert into klienci values (78, 'Harri', 'Clows');
insert into klienci values (79, 'Weidar', 'Dahl');
insert into klienci values (80, 'Roxana', 'Gatecliff');
insert into klienci values (81, 'Cara', 'Priddie');
insert into klienci values (82, 'Amandi', 'Wheeldon');
insert into klienci values (83, 'Matilda', 'Stothert');
insert into klienci values (84, 'Ricard', 'Derisley');
insert into klienci values (85, 'Sandie', 'Fishbourn');
insert into klienci values (86, 'Briny', 'Hayton');
insert into klienci values (87, 'Conrado', 'Boone');
insert into klienci values (88, 'Jandy', 'MacMichael');
insert into klienci values (89, 'Dian', 'Fairclough');
insert into klienci values (90, 'Bobbi', 'Arson');
insert into klienci values (91, 'Jacobo', 'Attenbrow');
insert into klienci values (92, 'Willem', 'Dufaire');
insert into klienci values (93, 'Jon', 'Paulack');
insert into klienci values (94, 'Zachery', 'Phizaclea');
insert into klienci values (95, 'Andreas', 'Bortoli');
insert into klienci values (96, 'Ardelis', 'Scaplehorn');
insert into klienci values (97, 'Regine', 'Manshaw');
insert into klienci values (98, 'Barnebas', 'Pingston');
insert into klienci values (99, 'Nedda', 'Arnson');
insert into klienci values (100, 'Eli', 'Arnholdt');
insert into klienci values (101, 'Melessa', 'Mullin');
insert into klienci values (102, 'Sergio', 'Knappen');
insert into klienci values (103, 'Latashia', 'Van der Kruis');
insert into klienci values (104, 'Byram', 'Ingolotti');
insert into klienci values (105, 'Nerty', 'Gerrish');
insert into klienci values (106, 'Trixi', 'Wallice');
insert into klienci values (107, 'Nelli', 'Dugan');
insert into klienci values (108, 'Carolina', 'O''Mannion');
insert into klienci values (109, 'Eduard', 'Buckam');
insert into klienci values (110, 'Wynny', 'Penkethman');
insert into klienci values (111, 'Leonore', 'Crawforth');
insert into klienci values (112, 'Glenna', 'Filippucci');
insert into klienci values (113, 'Peta', 'Stone');
insert into klienci values (114, 'Marti', 'Sloat');
insert into klienci values (115, 'Maura', 'Ainslie');
insert into klienci values (116, 'Scotti', 'Mantione');
insert into klienci values (117, 'Sandro', 'Slark');
insert into klienci values (118, 'Magda', 'Brookes');
insert into klienci values (119, 'Mohammed', 'Curd');
insert into klienci values (120, 'Claudio', 'Gilmour');
insert into klienci values (121, 'Ahmed', 'Thorns');
insert into klienci values (122, 'Vasily', 'Meuse');
insert into klienci values (123, 'Caitrin', 'McCullock');
insert into klienci values (124, 'Sigrid', 'Thorpe');
insert into klienci values (125, 'Sharon', 'Ludee');
insert into klienci values (126, 'Dasi', 'Tunsley');
insert into klienci values (127, 'Lief', 'Illidge');
insert into klienci values (128, 'Cristine', 'Shackell');
insert into klienci values (129, 'Stefan', 'Bamsey');
insert into klienci values (130, 'Nil', 'Robez');
insert into klienci values (131, 'Dorian', 'Thor');
insert into klienci values (132, 'Rolland', 'Sibbit');
insert into klienci values (133, 'Kali', 'Lambert');
insert into klienci values (134, 'Madalyn', 'Causon');
insert into klienci values (135, 'Ginni', 'Horsted');
insert into klienci values (136, 'Basile', 'Roy');
insert into klienci values (137, 'Leigh', 'Goulder');
insert into klienci values (138, 'Marchelle', 'Kenryd');
insert into klienci values (139, 'Henrik', 'Rudeforth');
insert into klienci values (140, 'Kelsi', 'Pietruszka');
insert into klienci values (141, 'Uri', 'Doncaster');
insert into klienci values (142, 'Reiko', 'Saladine');
insert into klienci values (143, 'Filmer', 'Bungey');
insert into klienci values (144, 'Shawn', 'Salkeld');
insert into klienci values (145, 'Nealson', 'Fane');
insert into klienci values (146, 'Jermain', 'Augar');
insert into klienci values (147, 'Dori', 'Sodeau');
insert into klienci values (148, 'Rowan', 'Woollard');
insert into klienci values (149, 'Doralynne', 'Wellfare');
insert into klienci values (150, 'Ceciley', 'Vynoll');
insert into klienci values (151, 'Axe', 'Mildenhall');
insert into klienci values (152, 'Caryn', 'Lambie');
insert into klienci values (153, 'Gizela', 'Dance');
insert into klienci values (154, 'Benedicta', 'Angrick');
insert into klienci values (155, 'Linoel', 'Doughton');
insert into klienci values (156, 'Culver', 'Pierse');
insert into klienci values (157, 'De witt', 'Rowbrey');
insert into klienci values (158, 'Johnath', 'Girardoni');
insert into klienci values (159, 'Eugenia', 'Rowantree');
insert into klienci values (160, 'Jonis', 'Sheard');
insert into klienci values (161, 'Tansy', 'Poag');
insert into klienci values (162, 'Dasha', 'Armfirld');
insert into klienci values (163, 'Rodolphe', 'Upex');
insert into klienci values (164, 'Marvin', 'De Benedictis');
insert into klienci values (165, 'Ariana', 'De Bischop');
insert into klienci values (166, 'Crystal', 'Croux');
insert into klienci values (167, 'Paulita', 'Chapling');
insert into klienci values (168, 'Leeanne', 'Fritz');
insert into klienci values (169, 'Reese', 'Ord');
insert into klienci values (170, 'Lucius', 'Bradley');
insert into klienci values (171, 'Nelie', 'Haskur');
insert into klienci values (172, 'Avie', 'Petegrew');
insert into klienci values (173, 'Daffi', 'Gildroy');
insert into klienci values (174, 'Loralie', 'Mercer');
insert into klienci values (175, 'Junie', 'Lamminam');
insert into klienci values (176, 'Randi', 'Hughland');
insert into klienci values (177, 'Almire', 'Lathy');
insert into klienci values (178, 'Jarad', 'Woolaston');
insert into klienci values (179, 'Ferdinand', 'Lapthorne');
insert into klienci values (180, 'Wallis', 'Wordesworth');
insert into klienci values (181, 'Stevy', 'Karpenko');
insert into klienci values (182, 'Gwenora', 'Coleford');
insert into klienci values (183, 'Lyndy', 'Ratazzi');
insert into klienci values (184, 'Duane', 'Morad');
insert into klienci values (185, 'Hayward', 'Blasing');
insert into klienci values (186, 'Andreana', 'Lupson');
insert into klienci values (187, 'Concettina', 'Pendrick');
insert into klienci values (188, 'Sibbie', 'Moule');
insert into klienci values (189, 'Mag', 'Prudence');
insert into klienci values (190, 'Cornela', 'Farmery');
insert into klienci values (191, 'Dom', 'Biles');
insert into klienci values (192, 'Kin', 'Parres');
insert into klienci values (193, 'Yancey', 'Roden');
insert into klienci values (194, 'Kathlin', 'Newbigging');
insert into klienci values (195, 'Ty', 'Hatchard');
insert into klienci values (196, 'Pattie', 'Witch');
insert into klienci values (197, 'Leelah', 'Chastand');
insert into klienci values (198, 'Jamal', 'Ricards');
insert into klienci values (199, 'Dari', 'Edden');
insert into klienci values (200, 'Glynnis', 'Savary');
insert into klienci values (201, 'Rycca', 'Ecclesall');
insert into klienci values (202, 'Brande', 'Boutton');
insert into klienci values (203, 'Luis', 'Shinfield');
insert into klienci values (204, 'Valencia', 'Melin');
insert into klienci values (205, 'Mylo', 'Scott');
insert into klienci values (206, 'Karel', 'Allery');
insert into klienci values (207, 'Kimberley', 'Etherington');
insert into klienci values (208, 'Myrah', 'Murley');
insert into klienci values (209, 'Flemming', 'Veryard');
insert into klienci values (210, 'Thomasina', 'Audibert');
insert into klienci values (211, 'Chet', 'Rump');
insert into klienci values (212, 'Mary', 'Habercham');
insert into klienci values (213, 'Brinna', 'Jouanny');
insert into klienci values (214, 'Fredrick', 'Ghidetti');
insert into klienci values (215, 'Homere', 'Simonnin');
insert into klienci values (216, 'Darb', 'Pilmer');
insert into klienci values (217, 'Fannie', 'Ronan');
insert into klienci values (218, 'Weston', 'Tabbernor');
insert into klienci values (219, 'Grete', 'Munro');
insert into klienci values (220, 'Dolores', 'Cristofano');
insert into klienci values (221, 'Ruggiero', 'Clymer');
insert into klienci values (222, 'Bernie', 'Thackray');
insert into klienci values (223, 'Otes', 'McCurdy');
insert into klienci values (224, 'Peyter', 'Mac Geaney');
insert into klienci values (225, 'Diego', 'Rohlf');
insert into klienci values (226, 'Amery', 'Aksell');
insert into klienci values (227, 'Gloria', 'Onion');
insert into klienci values (228, 'Wrennie', 'Richens');
insert into klienci values (229, 'Blinnie', 'Lindwall');
insert into klienci values (230, 'Elmer', 'Swatradge');
insert into klienci values (231, 'Briana', 'Markovich');
insert into klienci values (232, 'Arte', 'Domeney');
insert into klienci values (233, 'Patrizio', 'Tuddall');
insert into klienci values (234, 'Burton', 'Serridge');
insert into klienci values (235, 'Rossy', 'James');
insert into klienci values (236, 'Gusta', 'McGilleghole');
insert into klienci values (237, 'Adolpho', 'Martusov');
insert into klienci values (238, 'Sydel', 'Whittlesee');
insert into klienci values (239, 'Calla', 'Matts');
insert into klienci values (240, 'Athena', 'Gunning');
insert into klienci values (241, 'Henrik', 'Berney');
insert into klienci values (242, 'Elvira', 'Izakoff');
insert into klienci values (243, 'Sharyl', 'Giacomasso');
insert into klienci values (244, 'Bonni', 'Lezemore');
insert into klienci values (245, 'Ruggiero', 'Thornthwaite');
insert into klienci values (246, 'Gilburt', 'Drawmer');
insert into klienci values (247, 'Almeria', 'Antyshev');
insert into klienci values (248, 'Kiersten', 'Kemwall');
insert into klienci values (249, 'Kessiah', 'Maggill''Andreis');
insert into klienci values (250, 'Emmy', 'Taylerson');
insert into klienci values (251, 'Galvin', 'Speke');
insert into klienci values (252, 'Harriett', 'Bleythin');
insert into klienci values (253, 'Che', 'Usherwood');
insert into klienci values (254, 'Sheila', 'Gilogly');
insert into klienci values (255, 'Trudy', 'Danahar');
insert into klienci values (256, 'Noell', 'Ullett');
insert into klienci values (257, 'Delores', 'Hanton');
insert into klienci values (258, 'Kennith', 'Spanswick');
insert into klienci values (259, 'Joshua', 'Lazare');
insert into klienci values (260, 'Lindsey', 'Bondley');
insert into klienci values (261, 'Marty', 'Millea');
insert into klienci values (262, 'Bobbee', 'Hadenton');
insert into klienci values (263, 'Ingunna', 'Sprasen');
insert into klienci values (264, 'Brennen', 'Frediani');
insert into klienci values (265, 'Alastair', 'Clyne');
insert into klienci values (266, 'Claudian', 'Fernier');
insert into klienci values (267, 'Hayley', 'Antoniewicz');
insert into klienci values (268, 'Jesus', 'McCaughan');
insert into klienci values (269, 'Nickola', 'Firpi');
insert into klienci values (270, 'Jacinthe', 'Iuorio');
insert into klienci values (271, 'Thomasine', 'Pizzie');
insert into klienci values (272, 'Chelsae', 'Sandilands');
insert into klienci values (273, 'Petey', 'Godsafe');
insert into klienci values (274, 'Susy', 'Berriman');
insert into klienci values (275, 'Maggee', 'Gon');
insert into klienci values (276, 'Natty', 'Vint');
insert into klienci values (277, 'Milzie', 'Downie');
insert into klienci values (278, 'Reiko', 'Benjamin');
insert into klienci values (279, 'Kyrstin', 'Bowerman');
insert into klienci values (280, 'Craggy', 'Stilliard');
insert into klienci values (281, 'Norbert', 'Belderson');
insert into klienci values (282, 'Malinde', 'Base');
insert into klienci values (283, 'Gus', 'Frankema');
insert into klienci values (284, 'Walsh', 'Legg');
insert into klienci values (285, 'Jeffy', 'MacConnal');
insert into klienci values (286, 'Nora', 'Drydale');
insert into klienci values (287, 'Jamima', 'Ingman');
insert into klienci values (288, 'Maureene', 'Von Helmholtz');
insert into klienci values (289, 'Ginnie', 'Lobley');
insert into klienci values (290, 'Cassey', 'Clotworthy');
insert into klienci values (291, 'Jillie', 'Rodnight');
insert into klienci values (292, 'Stephan', 'Fallow');
insert into klienci values (293, 'Kelci', 'Ahern');
insert into klienci values (294, 'Laurie', 'Leopold');
insert into klienci values (295, 'Margret', 'Risso');
insert into klienci values (296, 'Selinda', 'Vasyatkin');
insert into klienci values (297, 'Emile', 'Piff');
insert into klienci values (298, 'Rasla', 'Goodlet');
insert into klienci values (299, 'Wren', 'Greader');
insert into klienci values (300, 'Jarad', 'McNiven');
insert into klienci values (301, 'Ingram', 'O''Dunniom');
insert into klienci values (302, 'Blaire', 'Dykas');
insert into klienci values (303, 'Iris', 'Whittington');
insert into klienci values (304, 'Valera', 'Ingre');
insert into klienci values (305, 'Devonna', 'Rosenstiel');
insert into klienci values (306, 'Brittany', 'McInally');
insert into klienci values (307, 'Dulcinea', 'Richardin');
insert into klienci values (308, 'Norbert', 'Castles');
insert into klienci values (309, 'Nike', 'Moorman');
insert into klienci values (310, 'Dorice', 'January 1st');
insert into klienci values (311, 'Willy', 'Baigrie');
insert into klienci values (312, 'Yevette', 'Liley');
insert into klienci values (313, 'Sayre', 'Winkett');
insert into klienci values (314, 'Cornell', 'Stiff');
insert into klienci values (315, 'Keary', 'Colisbe');
insert into klienci values (316, 'Thornie', 'Kingston');
insert into klienci values (317, 'Emelina', 'Sykora');
insert into klienci values (318, 'Artur', 'Magnar');
insert into klienci values (319, 'Devy', 'Penkethman');
insert into klienci values (320, 'Abbot', 'Eddie');
insert into klienci values (321, 'Marlo', 'Taylerson');
insert into klienci values (322, 'Maynord', 'Pereira');
insert into klienci values (323, 'Ilyse', 'Gaze');
insert into klienci values (324, 'Daniella', 'Blacklock');
insert into klienci values (325, 'Jeffrey', 'Aldine');
insert into klienci values (326, 'Eldon', 'Minshull');
insert into klienci values (327, 'Josh', 'Asple');
insert into klienci values (328, 'Maitilde', 'Gillbe');
insert into klienci values (329, 'Dulcine', 'Antoniewski');
insert into klienci values (330, 'Poppy', 'Agett');
insert into klienci values (331, 'Manolo', 'MacChaell');
insert into klienci values (332, 'Jorgan', 'Vannuchi');
insert into klienci values (333, 'Jeanne', 'Gatus');
insert into klienci values (334, 'Odele', 'Juschke');
insert into klienci values (335, 'Shirl', 'Windebank');
insert into klienci values (336, 'Willard', 'Pischof');
insert into klienci values (337, 'Shoshana', 'Hamel');
insert into klienci values (338, 'Ike', 'Rawlcliffe');
insert into klienci values (339, 'Viola', 'Marioneau');
insert into klienci values (340, 'Hashim', 'Eckley');
insert into klienci values (341, 'Gabriel', 'Congdon');
insert into klienci values (342, 'Anselm', 'Quakley');
insert into klienci values (343, 'Tadeo', 'Dettmar');
insert into klienci values (344, 'Lona', 'Ellerey');
insert into klienci values (345, 'Desdemona', 'Wharf');
insert into klienci values (346, 'Isacco', 'Novotni');
insert into klienci values (347, 'Jorgan', 'Custance');
insert into klienci values (348, 'Hewe', 'Colbourne');
insert into klienci values (349, 'Kiah', 'Beckham');
insert into klienci values (350, 'Yance', 'Thraves');
insert into klienci values (351, 'Ahmed', 'Fawdrie');
insert into klienci values (352, 'Karin', 'Nancekivell');
insert into klienci values (353, 'Mervin', 'Kilby');
insert into klienci values (354, 'Klarika', 'Buckthorpe');
insert into klienci values (355, 'Ambrosius', 'Hilley');
insert into klienci values (356, 'Bettina', 'Peyro');
insert into klienci values (357, 'Gherardo', 'Meake');
insert into klienci values (358, 'Cordie', 'Jewers');
insert into klienci values (359, 'Linn', 'Crosse');
insert into klienci values (360, 'May', 'Clemot');
insert into klienci values (361, 'Graig', 'Poznanski');
insert into klienci values (362, 'Delcina', 'Dixsee');
insert into klienci values (363, 'Fraser', 'Ambrodi');
insert into klienci values (364, 'Clim', 'Anfosso');
insert into klienci values (365, 'Sherri', 'Eversfield');
insert into klienci values (366, 'Lynnett', 'Toal');
insert into klienci values (367, 'Bennie', 'Merrell');
insert into klienci values (368, 'Edithe', 'Montford');
insert into klienci values (369, 'Marcie', 'Shercliff');
insert into klienci values (370, 'Karlotta', 'Mallya');
insert into klienci values (371, 'Gradey', 'Drivers');
insert into klienci values (372, 'Trefor', 'Arden');
insert into klienci values (373, 'Kiel', 'De Fraine');
insert into klienci values (374, 'Carena', 'De Gogay');
insert into klienci values (375, 'Mort', 'Louiset');
insert into klienci values (376, 'Briggs', 'Gail');
insert into klienci values (377, 'Mildrid', 'Cowburn');
insert into klienci values (378, 'Richie', 'McCrackan');
insert into klienci values (379, 'Rosemonde', 'Doey');
insert into klienci values (380, 'Nixie', 'Waterland');
insert into klienci values (381, 'Kathi', 'Rhys');
insert into klienci values (382, 'Misty', 'Wolfers');
insert into klienci values (383, 'Wendy', 'Ghilardi');
insert into klienci values (384, 'Bjorn', 'Caurah');
insert into klienci values (385, 'Joellen', 'Flaunier');
insert into klienci values (386, 'Annabel', 'Erdes');
insert into klienci values (387, 'Walton', 'Tithecott');
insert into klienci values (388, 'Kellina', 'Elden');
insert into klienci values (389, 'Meggi', 'Partridge');
insert into klienci values (390, 'Meris', 'Pinniger');
insert into klienci values (391, 'Billie', 'Paulmann');
insert into klienci values (392, 'Thaxter', 'Raubenheim');
insert into klienci values (393, 'Gualterio', 'Spittle');
insert into klienci values (394, 'Morris', 'Bascomb');
insert into klienci values (395, 'Darwin', 'Batalini');
insert into klienci values (396, 'Enrica', 'Haggata');
insert into klienci values (397, 'Marty', 'Dedon');
insert into klienci values (398, 'Adelice', 'Delacoste');
insert into klienci values (399, 'Nara', 'Lazar');
insert into klienci values (400, 'Rolf', 'MacCourt');
insert into klienci values (401, 'Rodolfo', 'Obee');
insert into klienci values (402, 'Beatrice', 'Moughtin');
insert into klienci values (403, 'Nance', 'Hannant');
insert into klienci values (404, 'Judye', 'Dumbar');
insert into klienci values (405, 'Steffie', 'Whittick');
insert into klienci values (406, 'Tomas', 'Goodyear');
insert into klienci values (407, 'Fern', 'Klosges');
insert into klienci values (408, 'Noel', 'Domm');
insert into klienci values (409, 'Mella', 'Falkous');
insert into klienci values (410, 'Othello', 'Potzold');
insert into klienci values (411, 'Elsi', 'Duckhouse');
insert into klienci values (412, 'Vonnie', 'Willock');
insert into klienci values (413, 'Hasty', 'Hasty');
insert into klienci values (414, 'Ursola', 'Clough');
insert into klienci values (415, 'Ev', 'Lowthian');
insert into klienci values (416, 'Kippar', 'Hartup');
insert into klienci values (417, 'Everard', 'Gidney');
insert into klienci values (418, 'Burch', 'Donett');
insert into klienci values (419, 'Phylys', 'Whitely');
insert into klienci values (420, 'Dianne', 'Plevey');
insert into klienci values (421, 'Hailey', 'Bunston');
insert into klienci values (422, 'Hurleigh', 'Chellingworth');
insert into klienci values (423, 'Noland', 'Pembridge');
insert into klienci values (424, 'Giraud', 'Kern');
insert into klienci values (425, 'Theodor', 'Naulls');
insert into klienci values (426, 'Kellina', 'Gilham');
insert into klienci values (427, 'Hetti', 'Barti');
insert into klienci values (428, 'Maury', 'Cranston');
insert into klienci values (429, 'Kendal', 'Joanaud');
insert into klienci values (430, 'Emelen', 'Esland');
insert into klienci values (431, 'Claiborne', 'Burtwistle');
insert into klienci values (432, 'Christy', 'McGahern');
insert into klienci values (433, 'Latrena', 'Eyles');
insert into klienci values (434, 'Arlee', 'Parbrook');
insert into klienci values (435, 'Tanney', 'Colmore');
insert into klienci values (436, 'Issy', 'Rollason');
insert into klienci values (437, 'Gar', 'Brummell');
insert into klienci values (438, 'Alaster', 'Lappin');
insert into klienci values (439, 'Foster', 'Stihl');
insert into klienci values (440, 'Carola', 'Eyes');
insert into klienci values (441, 'Giff', 'Budgey');
insert into klienci values (442, 'Sigismundo', 'Troman');
insert into klienci values (443, 'Mela', 'Swales');
insert into klienci values (444, 'Drucy', 'Mathe');
insert into klienci values (445, 'Nicky', 'D''Abbot-Doyle');
insert into klienci values (446, 'Putnem', 'Millin');
insert into klienci values (447, 'Rees', 'Dodridge');
insert into klienci values (448, 'Oates', 'McElrea');
insert into klienci values (449, 'Adolpho', 'Habben');
insert into klienci values (450, 'Berty', 'Sheard');
insert into klienci values (451, 'Thatcher', 'Billings');
insert into klienci values (452, 'Thaine', 'Normanvill');
insert into klienci values (453, 'Jelene', 'Tookey');
insert into klienci values (454, 'Lin', 'Lindegard');
insert into klienci values (455, 'Glenna', 'Fink');
insert into klienci values (456, 'Lottie', 'Eberts');
insert into klienci values (457, 'Leese', 'Dymond');
insert into klienci values (458, 'Shelton', 'Hussell');
insert into klienci values (459, 'Meta', 'Cottee');
insert into klienci values (460, 'Barrett', 'Rozanski');
insert into klienci values (461, 'Fair', 'Scally');
insert into klienci values (462, 'Rivkah', 'Jouhandeau');
insert into klienci values (463, 'Hebert', 'Bearblock');
insert into klienci values (464, 'Lazarus', 'Argyle');
insert into klienci values (465, 'Belinda', 'Mendes');
insert into klienci values (466, 'Shauna', 'Trevon');
insert into klienci values (467, 'Christophe', 'Dagger');
insert into klienci values (468, 'Hadlee', 'Hawtin');
insert into klienci values (469, 'Martina', 'Coppen');
insert into klienci values (470, 'Rick', 'Flade');
insert into klienci values (471, 'Fancy', 'Prantl');
insert into klienci values (472, 'Linet', 'MacMillan');
insert into klienci values (473, 'Amil', 'Schlag');
insert into klienci values (474, 'Alvy', 'Ashbridge');
insert into klienci values (475, 'Mario', 'Marle');
insert into klienci values (476, 'Nicol', 'O'' Lone');
insert into klienci values (477, 'Veriee', 'Bartczak');
insert into klienci values (478, 'Esra', 'Crafts');
insert into klienci values (479, 'Shaylynn', 'Breckwell');
insert into klienci values (480, 'Sven', 'Disman');
insert into klienci values (481, 'Michael', 'Facey');
insert into klienci values (482, 'Bronnie', 'Struss');
insert into klienci values (483, 'Charmine', 'Blazdell');
insert into klienci values (484, 'Juliette', 'Husselbee');
insert into klienci values (485, 'Elinor', 'Keilty');
insert into klienci values (486, 'Editha', 'Goodbarne');
insert into klienci values (487, 'Pablo', 'Renol');
insert into klienci values (488, 'Elvin', 'Webben');
insert into klienci values (489, 'Aldon', 'Arnaudot');
insert into klienci values (490, 'Chickie', 'Mugridge');
insert into klienci values (491, 'Franz', 'Gossan');
insert into klienci values (492, 'Erna', 'Maykin');
insert into klienci values (493, 'Juliette', 'Rubberts');
insert into klienci values (494, 'Mersey', 'Pitherick');
insert into klienci values (495, 'Gisela', 'Ternouth');
insert into klienci values (496, 'Obadiah', 'Odams');
insert into klienci values (497, 'Daisi', 'Pike');
insert into klienci values (498, 'Holly', 'Fishly');
insert into klienci values (499, 'Cairistiona', 'Shropshire');
insert into klienci values (500, 'Lacey', 'Seabrook');
insert into klienci values (501, 'Fabiano', 'Challicum');
insert into klienci values (502, 'Adelheid', 'Cussen');
insert into klienci values (503, 'Moritz', 'MacGuffie');
insert into klienci values (504, 'Elbert', 'Mustard');
insert into klienci values (505, 'Carma', 'Kewzick');
insert into klienci values (506, 'Brier', 'Mc Ilory');
insert into klienci values (507, 'Mandie', 'Bance');
insert into klienci values (508, 'Gilbertine', 'Haughey');
insert into klienci values (509, 'Brad', 'Iannuzzelli');
insert into klienci values (510, 'Callean', 'Toxell');
insert into klienci values (511, 'Rebeka', 'Castelot');
insert into klienci values (512, 'Jules', 'Asmus');
insert into klienci values (513, 'Austina', 'Mullane');
insert into klienci values (514, 'Derward', 'Sherwell');
insert into klienci values (515, 'Yehudit', 'Humpherson');
insert into klienci values (516, 'Robina', 'Blindt');
insert into klienci values (517, 'Kelci', 'McRoberts');
insert into klienci values (518, 'Berton', 'Patterfield');
insert into klienci values (519, 'Evan', 'Adger');
insert into klienci values (520, 'Joycelin', 'Peggrem');
insert into klienci values (521, 'Carilyn', 'Mullett');
insert into klienci values (522, 'Brade', 'Skinn');
insert into klienci values (523, 'Chance', 'Menier');
insert into klienci values (524, 'Prescott', 'Wadie');
insert into klienci values (525, 'Jose', 'Norster');
insert into klienci values (526, 'Eudora', 'Dalziel');
insert into klienci values (527, 'Joelynn', 'Paoli');
insert into klienci values (528, 'Agnesse', 'Watkinson');
insert into klienci values (529, 'Vale', 'Moberley');
insert into klienci values (530, 'Alessandra', 'Chicco');
insert into klienci values (531, 'Maryanna', 'Berling');
insert into klienci values (532, 'Raimund', 'Cuckson');
insert into klienci values (533, 'Rollins', 'Arington');
insert into klienci values (534, 'Timi', 'Bleackley');
insert into klienci values (535, 'Evelyn', 'Farrow');
insert into klienci values (536, 'Jobyna', 'Kleinmintz');
insert into klienci values (537, 'Robbie', 'Challenger');
insert into klienci values (538, 'Sherwin', 'Garioch');
insert into klienci values (539, 'Idaline', 'Chasle');
insert into klienci values (540, 'Odella', 'Barthrop');
insert into klienci values (541, 'Jean', 'Demchen');
insert into klienci values (542, 'Melodee', 'Learmount');
insert into klienci values (543, 'Mufi', 'Povlsen');
insert into klienci values (544, 'Max', 'Gilligan');
insert into klienci values (545, 'Hebert', 'Guisot');
insert into klienci values (546, 'Nerti', 'Youde');
insert into klienci values (547, 'Redd', 'Allibon');
insert into klienci values (548, 'Lindon', 'Dowtry');
insert into klienci values (549, 'Nowell', 'Coath');
insert into klienci values (550, 'Helli', 'Matfin');
insert into klienci values (551, 'Myriam', 'Kelle');
insert into klienci values (552, 'Rafaelita', 'Ziebart');
insert into klienci values (553, 'Gerome', 'Ellor');
insert into klienci values (554, 'Tod', 'Raubheim');
insert into klienci values (555, 'Ophelia', 'Strand');
insert into klienci values (556, 'Cara', 'Van der Brugge');
insert into klienci values (557, 'Kelbee', 'Brikner');
insert into klienci values (558, 'Art', 'Larrett');
insert into klienci values (559, 'Omero', 'Roach');
insert into klienci values (560, 'Lizette', 'Ethridge');
insert into klienci values (561, 'Ardene', 'Kitching');
insert into klienci values (562, 'Boote', 'Tern');
insert into klienci values (563, 'Veronica', 'Maylin');
insert into klienci values (564, 'Buiron', 'Haggata');
insert into klienci values (565, 'Tina', 'Klein');
insert into klienci values (566, 'Farleigh', 'Tie');
insert into klienci values (567, 'Rachel', 'Pinfold');
insert into klienci values (568, 'Kirbee', 'Coyne');
insert into klienci values (569, 'Gordan', 'Dymocke');
insert into klienci values (570, 'Virginia', 'Goodfield');
insert into klienci values (571, 'Happy', 'Blakeway');
insert into klienci values (572, 'Mordecai', 'Cuffley');
insert into klienci values (573, 'Charlotte', 'Dowsing');
insert into klienci values (574, 'Wells', 'Joutapavicius');
insert into klienci values (575, 'Davon', 'Garcia');
insert into klienci values (576, 'Kelvin', 'Byatt');
insert into klienci values (577, 'Adah', 'Hansed');
insert into klienci values (578, 'Cooper', 'Koppeck');
insert into klienci values (579, 'Phillip', 'Castillo');
insert into klienci values (580, 'Chickie', 'Burhouse');
insert into klienci values (581, 'Rich', 'Cuddon');
insert into klienci values (582, 'Merrel', 'Mieville');
insert into klienci values (583, 'Kiel', 'Possa');
insert into klienci values (584, 'Lilyan', 'Packman');
insert into klienci values (585, 'Margaret', 'Daubney');
insert into klienci values (586, 'Eward', 'Bradly');
insert into klienci values (587, 'Nanci', 'Simeons');
insert into klienci values (588, 'Sibilla', 'Giriardelli');
insert into klienci values (589, 'Cliff', 'Stidson');
insert into klienci values (590, 'Polly', 'Meagh');
insert into klienci values (591, 'Claudell', 'Fust');
insert into klienci values (592, 'Marge', 'MacDirmid');
insert into klienci values (593, 'Bambi', 'Enriquez');
insert into klienci values (594, 'Nev', 'Lochran');
insert into klienci values (595, 'Corine', 'Smalley');
insert into klienci values (596, 'Vinson', 'Mosby');
insert into klienci values (597, 'Gradeigh', 'McBoyle');
insert into klienci values (598, 'Riley', 'Pringer');
insert into klienci values (599, 'Brandon', 'Harwood');
insert into klienci values (600, 'Shana', 'Finneran');
insert into klienci values (601, 'Norbie', 'Devonshire');
insert into klienci values (602, 'Ricky', 'McCool');
insert into klienci values (603, 'Estrellita', 'Baudoux');
insert into klienci values (604, 'Royall', 'Ellesmere');
insert into klienci values (605, 'Sibby', 'Hanne');
insert into klienci values (606, 'Eilis', 'Eul');
insert into klienci values (607, 'Pearl', 'Graine');
insert into klienci values (608, 'Torry', 'Nell');
insert into klienci values (609, 'Clair', 'Eyckel');
insert into klienci values (610, 'Loralyn', 'Connechie');
insert into klienci values (611, 'Noellyn', 'Dowsey');
insert into klienci values (612, 'Katherine', 'Desaur');
insert into klienci values (613, 'Brennan', 'Androsik');
insert into klienci values (614, 'Fritz', 'Anscombe');
insert into klienci values (615, 'Leoline', 'Oscroft');
insert into klienci values (616, 'Judah', 'Whissell');
insert into klienci values (617, 'Zelda', 'Leggate');
insert into klienci values (618, 'Dasi', 'Mac Giolla Pheadair');
insert into klienci values (619, 'Bride', 'Cordeix');
insert into klienci values (620, 'Janice', 'Armes');
insert into klienci values (621, 'Cynthea', 'Gowdie');
insert into klienci values (622, 'Pearce', 'Woollacott');
insert into klienci values (623, 'Shari', 'Aleksankov');
insert into klienci values (624, 'Prue', 'Bettison');
insert into klienci values (625, 'Poppy', 'Ceci');
insert into klienci values (626, 'Cornelle', 'Lown');
insert into klienci values (627, 'Rudy', 'Bevington');
insert into klienci values (628, 'Hiram', 'Cawkill');
insert into klienci values (629, 'Ferrel', 'Major');
insert into klienci values (630, 'Torrie', 'Mahmood');
insert into klienci values (631, 'Saw', 'Foat');
insert into klienci values (632, 'Kellby', 'MacGrath');
insert into klienci values (633, 'Joeann', 'Rouby');
insert into klienci values (634, 'Alley', 'Batten');
insert into klienci values (635, 'Blondy', 'Hoolaghan');
insert into klienci values (636, 'Terra', 'Gonzalez');
insert into klienci values (637, 'Dominique', 'Randal');
insert into klienci values (638, 'Dwight', 'Bourchier');
insert into klienci values (639, 'Jada', 'Ellice');
insert into klienci values (640, 'Flss', 'Ravenhill');
insert into klienci values (641, 'Brockie', 'Dawid');
insert into klienci values (642, 'Margarita', 'Dussy');
insert into klienci values (643, 'Tamarah', 'Scholefield');
insert into klienci values (644, 'Yoshiko', 'Carnduff');
insert into klienci values (645, 'Anni', 'Balassi');
insert into klienci values (646, 'Verge', 'Del Checolo');
insert into klienci values (647, 'Zack', 'Kiraly');
insert into klienci values (648, 'Kaycee', 'Seagrave');
insert into klienci values (649, 'Brenda', 'Vautre');
insert into klienci values (650, 'Arri', 'Cutchie');
insert into klienci values (651, 'Ezequiel', 'Tankus');
insert into klienci values (652, 'Erika', 'Antognozzii');
insert into klienci values (653, 'Merna', 'Trevascus');
insert into klienci values (654, 'Dre', 'Sapey');
insert into klienci values (655, 'Goldie', 'Janata');
insert into klienci values (656, 'Ingemar', 'Chansonnau');
insert into klienci values (657, 'Gottfried', 'Linskill');
insert into klienci values (658, 'Dianna', 'Critchell');
insert into klienci values (659, 'Alex', 'Mee');
insert into klienci values (660, 'Bobbie', 'Sidney');
insert into klienci values (661, 'Allayne', 'Swire');
insert into klienci values (662, 'Jayme', 'Redgate');
insert into klienci values (663, 'Kit', 'Simes');
insert into klienci values (664, 'Carmita', 'Troy');
insert into klienci values (665, 'Wilhelm', 'Casoni');
insert into klienci values (666, 'Beauregard', 'Tukesby');
insert into klienci values (667, 'Krishnah', 'Wakefield');
insert into klienci values (668, 'Ancell', 'Wenzel');
insert into klienci values (669, 'Jolyn', 'Kemston');
insert into klienci values (670, 'Sheila', 'De Lisle');
insert into klienci values (671, 'Pansy', 'Cranney');
insert into klienci values (672, 'Rolph', 'Catenot');
insert into klienci values (673, 'Eliza', 'Geertz');
insert into klienci values (674, 'Christina', 'Klaggeman');
insert into klienci values (675, 'Layne', 'Connealy');
insert into klienci values (676, 'Corrie', 'Saunton');
insert into klienci values (677, 'Addie', 'Croad');
insert into klienci values (678, 'Bevvy', 'Merle');
insert into klienci values (679, 'Golda', 'Agron');
insert into klienci values (680, 'Armin', 'Checcuzzi');
insert into klienci values (681, 'Bartie', 'Antonat');
insert into klienci values (682, 'Kurtis', 'Anear');
insert into klienci values (683, 'Rabbi', 'Double');
insert into klienci values (684, 'Maribeth', 'Pennington');
insert into klienci values (685, 'Rhonda', 'Lujan');
insert into klienci values (686, 'Giralda', 'Penas');
insert into klienci values (687, 'Meredeth', 'Raithmill');
insert into klienci values (688, 'Erina', 'Newvell');
insert into klienci values (689, 'Edwina', 'Jans');
insert into klienci values (690, 'Camel', 'Blewett');
insert into klienci values (691, 'Regan', 'Kuhnert');
insert into klienci values (692, 'Joli', 'Clingan');
insert into klienci values (693, 'Tedie', 'Leeds');
insert into klienci values (694, 'Jasmin', 'Ibbison');
insert into klienci values (695, 'Joseito', 'Nipper');
insert into klienci values (696, 'Johnette', 'Lambole');
insert into klienci values (697, 'Gar', 'Kegg');
insert into klienci values (698, 'Agatha', 'Chimenti');
insert into klienci values (699, 'Stephan', 'Face');
insert into klienci values (700, 'Gottfried', 'Cleyburn');
insert into klienci values (701, 'Ailene', 'Frarey');
insert into klienci values (702, 'Joann', 'Legg');
insert into klienci values (703, 'Evvie', 'Rayman');
insert into klienci values (704, 'Hannis', 'McFarlan');
insert into klienci values (705, 'Masha', 'Ondricek');
insert into klienci values (706, 'Bobette', 'Simonelli');
insert into klienci values (707, 'Whitney', 'Aronovitz');
insert into klienci values (708, 'Devin', 'Bonellie');
insert into klienci values (709, 'Sheree', 'Ochiltree');
insert into klienci values (710, 'Ham', 'Limbourne');
insert into klienci values (711, 'Isaac', 'Wilshire');
insert into klienci values (712, 'Jenine', 'Atlee');
insert into klienci values (713, 'Broderic', 'Camellini');
insert into klienci values (714, 'Augusto', 'Trusler');
insert into klienci values (715, 'Michel', 'Thews');
insert into klienci values (716, 'Leigh', 'Kharchinski');
insert into klienci values (717, 'Cornie', 'McNeilley');
insert into klienci values (718, 'Dorris', 'Padefield');
insert into klienci values (719, 'Denna', 'Letford');
insert into klienci values (720, 'Wells', 'Ivakin');
insert into klienci values (721, 'Valera', 'O''Driscoll');
insert into klienci values (722, 'Arron', 'McGillivray');
insert into klienci values (723, 'Griselda', 'Fores');
insert into klienci values (724, 'Morry', 'De Robertis');
insert into klienci values (725, 'Kory', 'Spreag');
insert into klienci values (726, 'Carmelita', 'Bowcock');
insert into klienci values (727, 'Brittani', 'Sterke');
insert into klienci values (728, 'Tallia', 'Room');
insert into klienci values (729, 'Thurston', 'Keyes');
insert into klienci values (730, 'Bowie', 'MacRury');
insert into klienci values (731, 'Bendicty', 'Eagleton');
insert into klienci values (732, 'Bel', 'Regorz');
insert into klienci values (733, 'Dalia', 'Summerell');
insert into klienci values (734, 'Kareem', 'Winkell');
insert into klienci values (735, 'Ellen', 'Di Baudi');
insert into klienci values (736, 'Starlene', 'Dyte');
insert into klienci values (737, 'Gerty', 'Nizard');
insert into klienci values (738, 'Arne', 'McCoughan');
insert into klienci values (739, 'Jenny', 'Spolton');
insert into klienci values (740, 'Ursuline', 'Revie');
insert into klienci values (741, 'Eadie', 'Naylor');
insert into klienci values (742, 'Lacy', 'Andrivot');
insert into klienci values (743, 'Stanly', 'Stickins');
insert into klienci values (744, 'Eldredge', 'Fyldes');
insert into klienci values (745, 'Darbee', 'Campbell');
insert into klienci values (746, 'Amity', 'De Mars');
insert into klienci values (747, 'Caresa', 'Wenden');
insert into klienci values (748, 'Eveline', 'Rushbrook');
insert into klienci values (749, 'Antonius', 'Isoldi');
insert into klienci values (750, 'Dougy', 'Ensley');
insert into klienci values (751, 'Davin', 'Clancey');
insert into klienci values (752, 'Chrissie', 'Jacobsson');
insert into klienci values (753, 'Odelinda', 'Olivetti');
insert into klienci values (754, 'Danna', 'Scoble');
insert into klienci values (755, 'Cicily', 'Hagger');
insert into klienci values (756, 'Dorella', 'McAusland');
insert into klienci values (757, 'Rorke', 'Jerdan');
insert into klienci values (758, 'Vinny', 'Bermingham');
insert into klienci values (759, 'Seward', 'Klewer');
insert into klienci values (760, 'Desi', 'Drinkale');
insert into klienci values (761, 'Franny', 'Gabler');
insert into klienci values (762, 'Bing', 'Saffell');
insert into klienci values (763, 'Caitlin', 'Fielden');
insert into klienci values (764, 'Faulkner', 'Culbard');
insert into klienci values (765, 'Ursulina', 'Kenna');
insert into klienci values (766, 'Bran', 'Rappport');
insert into klienci values (767, 'Jay', 'Bouzek');
insert into klienci values (768, 'Tasha', 'Eccleshall');
insert into klienci values (769, 'Andrei', 'Timlett');
insert into klienci values (770, 'Sibbie', 'Neeson');
insert into klienci values (771, 'Nowell', 'Jordan');
insert into klienci values (772, 'Harriett', 'McChruiter');
insert into klienci values (773, 'Aeriela', 'Leete');
insert into klienci values (774, 'Beltran', 'Pothecary');
insert into klienci values (775, 'Frazer', 'Scrivner');
insert into klienci values (776, 'Aloisia', 'Holton');
insert into klienci values (777, 'Patten', 'Worsall');
insert into klienci values (778, 'Caressa', 'Seys');
insert into klienci values (779, 'Mil', 'Titcomb');
insert into klienci values (780, 'Berkie', 'Hartright');
insert into klienci values (781, 'Audi', 'Jahnke');
insert into klienci values (782, 'Manon', 'Belfield');
insert into klienci values (783, 'Crosby', 'Pessolt');
insert into klienci values (784, 'Emilia', 'Teresse');
insert into klienci values (785, 'Francesca', 'McGarva');
insert into klienci values (786, 'Eddie', 'Cliffe');
insert into klienci values (787, 'Marten', 'Alldre');
insert into klienci values (788, 'Ninetta', 'Brabin');
insert into klienci values (789, 'Davis', 'Rolley');
insert into klienci values (790, 'Gaultiero', 'Harriagn');
insert into klienci values (791, 'Bertina', 'Searight');
insert into klienci values (792, 'Cassandra', 'Willgress');
insert into klienci values (793, 'Reinald', 'Birkett');
insert into klienci values (794, 'Rena', 'Carden');
insert into klienci values (795, 'Deane', 'Tappington');
insert into klienci values (796, 'Emalia', 'Cockton');
insert into klienci values (797, 'Janelle', 'Antwis');
insert into klienci values (798, 'Matias', 'Kleuer');
insert into klienci values (799, 'Myrna', 'Soppit');
insert into klienci values (800, 'Lenore', 'Deeprose');
insert into klienci values (801, 'Lind', 'Colbeck');
insert into klienci values (802, 'Baxter', 'Abbotson');
insert into klienci values (803, 'Jimmie', 'Ramel');
insert into klienci values (804, 'Ruthie', 'Klosges');
insert into klienci values (805, 'Ettie', 'Macken');
insert into klienci values (806, 'Tammie', 'Logg');
insert into klienci values (807, 'Selene', 'Barrim');
insert into klienci values (808, 'L;urette', 'Ralphs');
insert into klienci values (809, 'Dur', 'Beach');
insert into klienci values (810, 'Cayla', 'Snelson');
insert into klienci values (811, 'Lombard', 'Rodie');
insert into klienci values (812, 'Raphael', 'McParland');
insert into klienci values (813, 'Caitlin', 'Neville');
insert into klienci values (814, 'Paolina', 'Sansom');
insert into klienci values (815, 'Nicolina', 'Eynald');
insert into klienci values (816, 'Kristy', 'Vice');
insert into klienci values (817, 'Kory', 'MacDonagh');
insert into klienci values (818, 'Orazio', 'Markussen');
insert into klienci values (819, 'Jen', 'Tearle');
insert into klienci values (820, 'Mel', 'Chellenham');
insert into klienci values (821, 'Nanon', 'Stansell');
insert into klienci values (822, 'Sandra', 'Bartalini');
insert into klienci values (823, 'Val', 'Pentecost');
insert into klienci values (824, 'Natalie', 'Jessup');
insert into klienci values (825, 'Kipper', 'Southers');
insert into klienci values (826, 'Birgitta', 'Treagust');
insert into klienci values (827, 'Gerald', 'Hadleigh');
insert into klienci values (828, 'Myrtie', 'Ickovits');
insert into klienci values (829, 'Ketti', 'Dessent');
insert into klienci values (830, 'Duane', 'Bodocs');
insert into klienci values (831, 'Midge', 'Moroney');
insert into klienci values (832, 'Cecil', 'Blything');
insert into klienci values (833, 'Emlen', 'Basson');
insert into klienci values (834, 'Clemmy', 'Hudel');
insert into klienci values (835, 'Jan', 'Kowalski');
insert into klienci values (836, 'Piotr', 'Nowak');
insert into klienci values (837, 'Halina', 'Misierowicz');
insert into klienci values (838, 'Janusz', 'Tracz');
insert into klienci values (839, 'Lidia', 'Marna');

-- dodawanie marek

insert into marki values (1, 'Alfa Romeo');
insert into marki values (2, 'Audi');
insert into marki values (3, 'BMW');
insert into marki values (4, 'Chevrolet');
insert into marki values (5, 'Chrysler');
insert into marki values (6, 'Citroen');
insert into marki values (7, 'Dacia');
insert into marki values (8, 'Dodge');
insert into marki values (9, 'Ferrari');
insert into marki values (10, 'Fiat');
insert into marki values (11, 'Ford');
insert into marki values (12, 'Honda');
insert into marki values (13, 'Hyundai');
insert into marki values (14, 'Infiniti');
insert into marki values (15, 'Jeep');
insert into marki values (16, 'Kia');
insert into marki values (17, 'Lancia');
insert into marki values (18, 'Lexus');
insert into marki values (19, 'Mazda');
insert into marki values (20, 'Mercedes-Benz');
insert into marki values (21, 'Mini');
insert into marki values (22, 'Mitsubishi');
insert into marki values (23, 'Nissan');
insert into marki values (24, 'Opel');
insert into marki values (25, 'Peugeot');
insert into marki values (26, 'Porsche');
insert into marki values (27, 'Renault');
insert into marki values (28, 'Saab');
insert into marki values (29, 'Seat');
insert into marki values (30, 'Skoda');
insert into marki values (31, 'Subaru');
insert into marki values (32, 'Suzuki');
insert into marki values (33, 'Tata');
insert into marki values (34, 'Toyota');
insert into marki values (35, 'Volkswagen');
insert into marki values (36, 'Volvo');


-- dodawanie modeli


-- Alfa Romeo

insert into modele values (1, 'Stelvio', 1);
insert into modele values (2, 'Giulia', 1);
insert into modele values (3, '4C', 1);
insert into modele values (4, 'Giuletta', 1);
insert into modele values (5, 'MiTo', 1);
insert into modele values (6, 'Brera', 1);
insert into modele values (7, '159', 1);
insert into modele values (8, 'GT', 1);
insert into modele values (9, '147', 1);
insert into modele values (10, '166', 1);
insert into modele values (11, '156', 1);
insert into modele values (12, '146', 1);
insert into modele values (13, 'GTV', 1);
insert into modele values (14, '145', 1);


-- Audi

insert into modele values (15, 'e-tron', 2);
insert into modele values (16, 'Q8', 2);
insert into modele values (17, 'Q2', 2);
insert into modele values (18, 'Q3', 2);
insert into modele values (19, 'A7', 2);
insert into modele values (20, 'A1', 2);
insert into modele values (21, 'Q5', 2);
insert into modele values (22, 'A5', 2);
insert into modele values (23, 'R8', 2);
insert into modele values (24, 'Q7', 2);
insert into modele values (25, 'A2', 2);
insert into modele values (26, 'A6 Allroad', 2);
insert into modele values (27, 'TT', 2);
insert into modele values (28, 'A3', 2);
insert into modele values (29, 'A4', 2);
insert into modele values (30, 'A6', 2);
insert into modele values (31, 'A8', 2);
insert into modele values (32, 'V8', 2);
insert into modele values (33, '90', 2);
insert into modele values (34, '200', 2);
insert into modele values (35, '80', 2);
insert into modele values (36, '100', 2);


-- BMW

insert into modele values (37, 'X7', 3);
insert into modele values (38, 'X2', 3);
insert into modele values (39, 'i8', 3);
insert into modele values (40, 'X4', 3);
insert into modele values (41, 'Seria 2', 3);
insert into modele values (42, 'i3', 3);
insert into modele values (43, 'Seria 4', 3);
insert into modele values (44, 'Seria 3 Gran Turismo', 3);
insert into modele values (45, 'X1', 3);
insert into modele values (46, 'Seria 5 Gran Turismo', 3);
insert into modele values (47, 'X6', 3);
insert into modele values (48, 'Seria 1', 3);
insert into modele values (49, 'X3', 3);
insert into modele values (50, 'Z4', 3);
insert into modele values (51, 'Z8', 3);
insert into modele values (52, 'X5', 3);
insert into modele values (53, 'Z3', 3);
insert into modele values (54, 'Seria 8', 3);
insert into modele values (55, 'Z1', 3);
insert into modele values (56, 'Seria 6', 3);
insert into modele values (57, 'Seria 7', 3);
insert into modele values (58, 'Seria 3', 3);
insert into modele values (59, 'Seria 5', 3);


-- Chevrolet

insert into modele values (60, 'Trax', 4);
insert into modele values (61, 'Malibu', 4);
insert into modele values (62, 'Orlando', 4);
insert into modele values (63, 'Cruze', 4);
insert into modele values (64, 'Captiva', 4);
insert into modele values (65, 'Epica', 4);
insert into modele values (66, 'HHR', 4);
insert into modele values (67, 'Spark', 4);
insert into modele values (68, 'Equinox', 4);
insert into modele values (69, 'Aveo', 4);
insert into modele values (70, 'Lacetti', 4);
insert into modele values (71, 'Rezzo', 4);
insert into modele values (72, 'Evanda', 4);
insert into modele values (73, 'Avalanche', 4);
insert into modele values (74, 'TrailBlazer', 4);
insert into modele values (75, 'Suburban', 4);
insert into modele values (76, 'Tahoe', 4);
insert into modele values (77, 'Silverado', 4);
insert into modele values (78, 'Blazer', 4);


-- Chrysler

insert into modele values (79, 'Aspen', 5);
insert into modele values (80, '300 C', 5);
insert into modele values (81, 'Pacifica', 5);
insert into modele values (82, 'Crossfire', 5);
insert into modele values (83, 'PT Cruiser', 5);
insert into modele values (84, '300 M', 5);
insert into modele values (85, 'Concorde', 5);
insert into modele values (86, 'Stratus', 5);
insert into modele values (87, 'Sebring', 5);
insert into modele values (88, 'Neon', 5);
insert into modele values (89, 'Vision', 5);
insert into modele values (90, 'Town Country', 5);
insert into modele values (91, 'Voyager', 5);


-- Citroen

insert into modele values (92, 'C5 Aircross', 6);
insert into modele values (93, 'C4 Spacetourer', 6);
insert into modele values (94, 'SpaceTourer', 6);
insert into modele values (95, 'C4 Cactus', 6);
insert into modele values (96, 'C4 Aircross', 6);
insert into modele values (97, 'C-Elysee', 6);
insert into modele values (98, 'DS5', 6);
insert into modele values (99, 'C-ZERO', 6);
insert into modele values (100, 'DS4', 6);
insert into modele values (101, 'DS3', 6);
insert into modele values (102, 'C3 Picasso', 6);
insert into modele values (103, 'Nemo', 6);
insert into modele values (104, 'C-Crosser', 6);
insert into modele values (105, 'C4 Picasso', 6);
insert into modele values (106, 'C6', 6);
insert into modele values (107, 'C1', 6);
insert into modele values (108, 'C4', 6);
insert into modele values (109, 'C2', 6);
insert into modele values (110, 'C 8', 6);
insert into modele values (111, 'C3', 6);
insert into modele values (112, 'C5', 6);
insert into modele values (113, 'Xsara Picasso', 6);
insert into modele values (114, 'Berlingo', 6);
insert into modele values (115, 'Xsara', 6);
insert into modele values (116, 'Saxo', 6);
insert into modele values (117, 'Evasion', 6);
insert into modele values (118, 'Xantia', 6);
insert into modele values (119, 'ZX', 6);


-- Dacia

insert into modele values (120, 'Dokker', 7);
insert into modele values (121, 'Lodgy', 7);
insert into modele values (123, 'Duster', 7);
insert into modele values (124, 'Sandero', 7);
insert into modele values (125, 'Logan', 7);
insert into modele values (126, 'Nova', 7);


-- Dodge

insert into modele values (127, 'Journey', 8);
insert into modele values (128, 'Challenger', 8);
insert into modele values (129, 'Avenger', 8);
insert into modele values (130, 'Nitro', 8);
insert into modele values (131, 'Caliber', 8);
insert into modele values (132, 'Charger', 8);
insert into modele values (133, 'Magnum', 8);
insert into modele values (134, 'Durango', 8);
insert into modele values (135, 'Dakota', 8);
insert into modele values (136, 'Viper', 8);
insert into modele values (137, 'Stratus', 8);
insert into modele values (138, 'Neon', 8);
insert into modele values (139, 'RAM', 8);
insert into modele values (140, 'Interpid', 8);
insert into modele values (141, 'Stealth', 8);
insert into modele values (142, 'Grand Caravan', 8);
insert into modele values (143, 'Caravan', 8);
insert into modele values (144, 'Monaco', 8);
insert into modele values (145, 'Spirit', 8);
insert into modele values (146, 'Dynasty', 8);
insert into modele values (147, 'Omni', 8);
insert into modele values (148, 'Diplomat', 8);
insert into modele values (149, 'Daytona', 8);


-- Ferrari

insert into modele values (150, 'F12 Berlinetta', 9);
insert into modele values (151, 'FF', 9);
insert into modele values (152, '458', 9);
insert into modele values (153, 'California', 9);
insert into modele values (154, '599', 9);
insert into modele values (155, '430', 9);
insert into modele values (156, '612', 9);
insert into modele values (157, '575', 9);
insert into modele values (158, '360', 9);
insert into modele values (159, '456', 9);
insert into modele values (160, '550', 9);


-- Fiat

insert into modele values (161, 'Fiorino/Qubo', 10);
insert into modele values (162, 'Fullback', 10);
insert into modele values (163, '124', 10);
insert into modele values (164, 'Freemont', 10);
insert into modele values (165, 'Fiorino', 10);
insert into modele values (166, '500', 10);
insert into modele values (167, 'Linea', 10);
insert into modele values (168, 'Sedici', 10);
insert into modele values (169, '600', 10);
insert into modele values (170, 'Idea', 10);
insert into modele values (171, 'Albea', 10);
insert into modele values (172, 'Doblo', 10);
insert into modele values (173, 'Stilo', 10);
insert into modele values (174, 'Multipla', 10);
insert into modele values (175, 'Seicento', 10);
insert into modele values (176, 'Palio', 10);
insert into modele values (177, 'Siena', 10);
insert into modele values (178, 'Marea', 10);
insert into modele values (179, 'Barchetta', 10);
insert into modele values (180, 'Bravo', 10);
insert into modele values (181, 'Brava', 10);
insert into modele values (182, 'Ulysse', 10);
insert into modele values (183, '126', 10);
insert into modele values (184, 'Coup', 10);
insert into modele values (185, 'Cinquecento', 10);
insert into modele values (186, 'Punto', 10);
insert into modele values (187, 'Tempra', 10);
insert into modele values (188, 'Tipo', 10);
insert into modele values (189, 'Croma', 10);
insert into modele values (190, 'Panda', 10);
insert into modele values (191, 'Ritmo', 10);
insert into modele values (192, 'Uno', 10);
insert into modele values (193, 'Regata', 10);


-- Ford

insert into modele values (194, 'Ecosport', 11);
insert into modele values (195, 'Ka+', 11);
insert into modele values (196, 'Tourneo Custom', 11);
insert into modele values (197, 'Mustang', 11);
insert into modele values (198, 'Turneo Courier', 11);
insert into modele values (199, 'Turneo Connect', 11);
insert into modele values (200, 'B-MAX', 11);
insert into modele values (201, 'Kuga', 11);
insert into modele values (202, 'Edge', 11);
insert into modele values (203, 'S-MAX', 11);
insert into modele values (204, 'Freestyle', 11);
insert into modele values (205, 'C-MAX', 11);
insert into modele values (206, 'Streetka', 11);
insert into modele values (207, 'Fusion', 11);
insert into modele values (208, 'Escape', 11);
insert into modele values (209, 'F 350', 11);
insert into modele values (210, 'Excursion', 11);
insert into modele values (211, 'F 250', 11);
insert into modele values (212, 'Cougar', 11);
insert into modele values (213, 'Focus', 11);
insert into modele values (214, 'Puma', 11);
insert into modele values (215, 'Ranger', 11);
insert into modele values (216, 'Expedition', 11);
insert into modele values (217, 'F 150', 11);
insert into modele values (218, 'Ka', 11);
insert into modele values (219, 'Galaxy', 11);
insert into modele values (220, 'Maverick', 11);
insert into modele values (221, 'Mondeo', 11);
insert into modele values (222, 'Explorer', 11);
insert into modele values (223, 'Scorpio', 11);
insert into modele values (224, 'Orion', 11);
insert into modele values (225, 'Sierra', 11);
insert into modele values (226, 'Granada', 11);
insert into modele values (227, 'Escort', 11);
insert into modele values (228, 'Capri', 11);
insert into modele values (229, 'Fiesta', 11);


-- Honda

insert into modele values (230, 'CR-Z', 12);
insert into modele values (231, 'Insight', 12);
insert into modele values (232, 'Fit', 12);
insert into modele values (233, 'City', 12);
insert into modele values (234, 'Ridgeline', 12);
insert into modele values (235, 'FR-V', 12);
insert into modele values (236, 'Element', 12);
insert into modele values (237, 'Pilot', 12);
insert into modele values (238, 'Jazz', 12);
insert into modele values (239, 'Stream', 12);
insert into modele values (240, 'S 2000', 12);
insert into modele values (241, 'HR-V', 12);
insert into modele values (242, 'Logo', 12);
insert into modele values (243, 'CR-V', 12);
insert into modele values (244, 'Shuttle', 12);
insert into modele values (245, 'Odyssey', 12);
insert into modele values (246, 'Concerto', 12);
insert into modele values (247, 'CRX', 12);
insert into modele values (248, 'Legend', 12);
insert into modele values (249, 'Integra', 12);
insert into modele values (250, 'Accord', 12);
insert into modele values (251, 'Civic', 12);
insert into modele values (252, 'Prelude', 12);


-- Hyundai

insert into modele values (253, 'Kona', 13);
insert into modele values (254, 'Ioniq', 13);
insert into modele values (255, 'Veloster', 13);
insert into modele values (256, 'i40', 13);
insert into modele values (257, 'Genesis', 13);
insert into modele values (258, 'ix20', 13);
insert into modele values (259, 'ix35', 13);
insert into modele values (260, 'i20', 13);
insert into modele values (261, 'ix55', 13);
insert into modele values (262, 'i10', 13);
insert into modele values (263, 'i30', 13);
insert into modele values (264, 'Grandeur', 13);
insert into modele values (265, 'Tucson', 13);
insert into modele values (266, 'Terracan', 13);
insert into modele values (267, 'Getz', 13);
insert into modele values (268, 'Matrix', 13);
insert into modele values (269, 'Santa Fe', 13);
insert into modele values (270, 'Elantra', 13);
insert into modele values (271, 'Trajet', 13);
insert into modele values (272, 'XG', 13);
insert into modele values (273, 'H-1', 13);
insert into modele values (274, 'Santamo', 13);
insert into modele values (275, 'Atos', 13);
insert into modele values (276, 'Galloper', 13);
insert into modele values (277, 'Coupe', 13);
insert into modele values (278, 'Accent', 13);
insert into modele values (279, 'Lantra', 13);
insert into modele values (280, 'S-Coupe', 13);
insert into modele values (281, 'Excel', 13);
insert into modele values (282, 'Sonata', 13);
insert into modele values (283, 'Pony', 13);


-- Infiniti

insert into modele values (284, 'QX60', 14);
insert into modele values (285, 'QX30', 14);
insert into modele values (286, 'Q30', 14);
insert into modele values (287, 'Q70', 14);
insert into modele values (288, 'Q60', 14);
insert into modele values (289, 'QX70', 14);
insert into modele values (290, 'QX50', 14);
insert into modele values (291, 'Q50', 14);
insert into modele values (292, 'M', 14);
insert into modele values (293, 'G37', 14);
insert into modele values (294, 'EX', 14);
insert into modele values (295, 'QX', 14);
insert into modele values (296, 'FX', 14);
insert into modele values (297, 'G35', 14);
insert into modele values (298, 'I35', 14);
insert into modele values (299, 'I30', 14);
insert into modele values (300, 'J30', 14);
insert into modele values (301, 'G20', 14);
insert into modele values (302, 'Q45', 14);


-- Jeep

insert into modele values (303, 'Renegade', 15);
insert into modele values (304, 'Patriot', 15);
insert into modele values (305, 'Compass', 15);
insert into modele values (306, 'Commander', 15);
insert into modele values (307, 'Liberty', 15);
insert into modele values (308, 'Grand Cherokee', 15);
insert into modele values (309, 'Wrangler', 15);
insert into modele values (310, 'Cherokee', 15);


-- Kia

insert into modele values (311, 'XCeed', 16);
insert into modele values (312, 'Stonic', 16);
insert into modele values (313, 'Stinger', 16);
insert into modele values (314, 'Niro', 16);
insert into modele values (315, 'Venga', 16);
insert into modele values (316, 'Cadenza', 16);
insert into modele values (317, 'Soul', 16);
insert into modele values (318, 'Ceed', 16);
insert into modele values (319, 'Picanto', 16);
insert into modele values (320, 'Cerato', 16);
insert into modele values (321, 'Opirus', 16);
insert into modele values (322, 'Sorento', 16);
insert into modele values (323, 'Spectra', 16);
insert into modele values (324, 'Optima', 16);
insert into modele values (325, 'Sedona', 16);
insert into modele values (326, 'Magentis', 16);
insert into modele values (327, 'Carens', 16);
insert into modele values (328, 'Rio', 16);
insert into modele values (329, 'Joice', 16);
insert into modele values (330, 'Retona', 16);
insert into modele values (331, 'Carnival', 16);
insert into modele values (332, 'Shuma', 16);
insert into modele values (333, 'Rocsta', 16);
insert into modele values (334, 'Clarus', 16);
insert into modele values (335, 'Pride', 16);
insert into modele values (336, 'Sportage', 16);
insert into modele values (337, 'Sephia', 16);


-- Lancia

insert into modele values (338, 'Voyager', 17);
insert into modele values (339, 'Musa', 17);
insert into modele values (340, 'Phedra', 17);
insert into modele values (341, 'Ypsilon', 17);
insert into modele values (342, 'Thesis', 17);
insert into modele values (343, 'Lybra', 17);
insert into modele values (344, 'Zeta', 17);
insert into modele values (345, 'Kappa', 17);
insert into modele values (346, 'Dedra', 17);
insert into modele values (347, 'Thema', 17);
insert into modele values (348, 'Y', 17);
insert into modele values (349, 'Delta', 17);


-- Lexus

insert into modele values (350, 'UX', 18);
insert into modele values (351, 'LC', 18);
insert into modele values (352, 'RC', 18);
insert into modele values (353, 'NX', 18);
insert into modele values (354, 'CT', 18);
insert into modele values (355, 'GX', 18);
insert into modele values (356, 'IS', 18);
insert into modele values (357, 'RX', 18);
insert into modele values (358, 'LX', 18);
insert into modele values (359, 'ES', 18);
insert into modele values (360, 'GS', 18);
insert into modele values (361, 'SC', 18);
insert into modele values (362, 'LS', 18);


-- Mazda

insert into modele values (363, 'MX-30', 19);
insert into modele values (364, 'CX-30', 19);
insert into modele values (365, 'CX-3', 19);
insert into modele values (366, 'CX-5', 19);
insert into modele values (367, 'CX-9', 19);
insert into modele values (368, 'CX-7', 19);
insert into modele values (369, '5', 19);
insert into modele values (370, '3', 19);
insert into modele values (371, '2', 19);
insert into modele values (372, 'RX-8', 19);
insert into modele values (373, '6', 19);
insert into modele values (374, 'Tribute', 19);
insert into modele values (375, 'Premacy', 19);
insert into modele values (376, 'Demio', 19);
insert into modele values (377, 'B-seria', 19);
insert into modele values (378, 'Millenia', 19);
insert into modele values (379, 'MPV', 19);
insert into modele values (380, 'Protege', 19);
insert into modele values (381, 'Xedos 9', 19);
insert into modele values (382, 'Xedos 6', 19);
insert into modele values (383, 'MX-6', 19);
insert into modele values (384, 'MX-3', 19);
insert into modele values (385, 'MX-5', 19);
insert into modele values (386, '121', 19);
insert into modele values (387, 'RX-7', 19);
insert into modele values (388, '323', 19);
insert into modele values (389, '929', 19);
insert into modele values (390, '626', 19);


-- Mercedes-Benz

insert into modele values (391, 'EQV', 20);
insert into modele values (392, 'GLA', 20);
insert into modele values (393, 'GLB', 20);
insert into modele values (394, 'EQC', 20);
insert into modele values (395, 'V Klasa', 20);
insert into modele values (396, 'CLA', 20);
insert into modele values (397, 'B Klasa', 20);
insert into modele values (398, 'AMG GT', 20);
insert into modele values (399, 'C Klasa', 20);
insert into modele values (400, 'A Klasa', 20);
insert into modele values (401, 'CLS Klasa', 20);
insert into modele values (402, 'Klasa X', 20);
insert into modele values (403, 'E Klasa', 20);
insert into modele values (404, 'S Klasa', 20);
insert into modele values (405, 'Klasa GLC', 20);
insert into modele values (406, 'Klasa GLE', 20);
insert into modele values (407, 'Mercedes AMG GT', 20);
insert into modele values (408, 'Klasa S Coupe', 20);
insert into modele values (409, 'Klasa GLA', 20);
insert into modele values (410, 'Klasa CLA', 20);
insert into modele values (411, 'SLS', 20);
insert into modele values (412, 'Klasa GLK', 20);
insert into modele values (413, 'Klasa CLC', 20);
insert into modele values (414, 'Klasa GL', 20);
insert into modele values (415, 'Klasa R', 20);
insert into modele values (416, 'Klasa B', 20);
insert into modele values (417, 'Klasa CLS', 20);
insert into modele values (418, 'Viano', 20);
insert into modele values (419, 'Vaneo', 20);
insert into modele values (420, 'Klasa ML', 20);
insert into modele values (421, 'Klasa A', 20);
insert into modele values (422, 'Klasa CLK', 20);
insert into modele values (423, 'Klasa V', 20);
insert into modele values (424, 'Klasa CL', 20);
insert into modele values (425, 'Klasa SLK', 20);
insert into modele values (426, 'Klasa E', 20);
insert into modele values (427, 'Klasa C', 20);
insert into modele values (428, 'Klasa S', 20);
insert into modele values (429, 'Klasa SEC', 20);
insert into modele values (430, '124', 20);
insert into modele values (431, '190', 20);
insert into modele values (432, 'Klasa SL', 20);
insert into modele values (433, 'Klasa G', 20);
insert into modele values (434, '126', 20);
insert into modele values (435, '123', 20);


-- Mini

insert into modele values (436, 'Countryman', 21);
insert into modele values (437, 'Clubman', 21);
insert into modele values (438, 'Paceman', 21);
insert into modele values (439, 'Roadster', 21);
insert into modele values (440, 'Coupe', 21);
insert into modele values (441, 'Caprio', 21);
insert into modele values (442, 'Mini', 21);
insert into modele values (443, 'Cooper', 21);


-- Mitsubishi

insert into modele values (444, 'Eclipse Cross', 22);
insert into modele values (445, 'Space Star 2014', 22);
insert into modele values (446, 'i-MiEV', 22);
insert into modele values (447, 'ASX', 22);
insert into modele values (448, 'Grandis', 22);
insert into modele values (449, 'Endeavor', 22);
insert into modele values (450, 'Outlander', 22);
insert into modele values (451, 'Santamo', 22);
insert into modele values (452, 'Space Star', 22);
insert into modele values (453, 'Montero', 22);
insert into modele values (454, 'L 200', 22);
insert into modele values (455, 'Carisma', 22);
insert into modele values (456, 'Space Gear', 22);
insert into modele values (457, '3000 GT', 22);
insert into modele values (458, 'Eclipse', 22);
insert into modele values (459, 'Space Runner', 22);
insert into modele values (460, 'Sigma', 22);
insert into modele values (461, 'Pajero', 22);
insert into modele values (462, 'Sapporo', 22);
insert into modele values (463, 'Starion', 22);
insert into modele values (464, 'Galant', 22);
insert into modele values (465, 'Lancer', 22);
insert into modele values (466, 'Colt', 22);
insert into modele values (467, 'Space Wagon', 22);


-- Nissan

insert into modele values (468, 'Pulsar', 23);
insert into modele values (469, 'Leaf', 23);
insert into modele values (470, 'Evalia', 23);
insert into modele values (471, 'Juke', 23);
insert into modele values (472, 'Cube', 23);
insert into modele values (473, '370 Z', 23);
insert into modele values (474, 'Pixo', 23);
insert into modele values (475, 'GT-R', 23);
insert into modele values (476, 'Rogue', 23);
insert into modele values (477, 'Tiida', 23);
insert into modele values (478, 'Qashqai', 23);
insert into modele values (479, 'Note', 23);
insert into modele values (480, 'Navara', 23);
insert into modele values (481, 'Titan', 23);
insert into modele values (482, 'Murano', 23);
insert into modele values (483, '350 Z', 23);
insert into modele values (484, 'X-Trail', 23);
insert into modele values (485, 'Xterra', 23);
insert into modele values (486, 'Sentra', 23);
insert into modele values (487, 'Quest', 23);
insert into modele values (488, 'Pick Up', 23);
insert into modele values (489, 'Pathfinder', 23);
insert into modele values (490, 'Frontier', 23);
insert into modele values (491, 'Almera', 23);
insert into modele values (492, 'Altima', 23);
insert into modele values (493, 'Serena', 23);
insert into modele values (494, '100 NX', 23);
insert into modele values (495, 'Primera', 23);
insert into modele values (496, 'Maxima', 23);
insert into modele values (497, '200 SX', 23);
insert into modele values (498, 'Terrano', 23);
insert into modele values (499, 'Sunny', 23);
insert into modele values (500, 'Bluebird', 23);
insert into modele values (501, 'Laurel', 23);
insert into modele values (502, '300 ZX', 23);
insert into modele values (503, 'Micra', 23);
insert into modele values (504, 'Praire', 23);
insert into modele values (505, 'Patrol', 23);


-- Opel

insert into modele values (506, 'Zafira Life', 24);
insert into modele values (507, 'Vivaro Tourer', 24);
insert into modele values (508, 'Grandland X', 24);
insert into modele values (509, 'Crossland X', 24);
insert into modele values (510, 'Karl', 24);
insert into modele values (511, 'Cascada', 24);
insert into modele values (512, 'Adam', 24);
insert into modele values (513, 'Mokka', 24);
insert into modele values (514, 'Ampera', 24);
insert into modele values (515, 'Combo', 24);
insert into modele values (516, 'Insignia', 24);
insert into modele values (517, 'GT', 24);
insert into modele values (518, 'Antara', 24);
insert into modele values (519, 'Meriva', 24);
insert into modele values (520, 'Signum', 24);
insert into modele values (521, 'Speedster', 24);
insert into modele values (522, 'Agila', 24);
insert into modele values (523, 'Zafira', 24);
insert into modele values (524, 'Sintra', 24);
insert into modele values (525, 'Tigra', 24);
insert into modele values (526, 'Frontera', 24);
insert into modele values (527, 'Monterey', 24);
insert into modele values (528, 'Astra', 24);
insert into modele values (529, 'Campo', 24);
insert into modele values (530, 'Calibra', 24);
insert into modele values (531, 'Vectra', 24);
insert into modele values (532, 'Omega', 24);
insert into modele values (533, 'Corsa', 24);
insert into modele values (534, 'Record', 24);
insert into modele values (535, 'Ascona', 24);
insert into modele values (536, 'Kadett', 24);
insert into modele values (537, 'Senator', 24);
insert into modele values (538, 'Monza', 24);


-- Peugeot

insert into modele values (539, 'Rifter', 25);
insert into modele values (540, 'Traveller', 25);
insert into modele values (541, '2008', 25);
insert into modele values (542, '301', 25);
insert into modele values (543, '208', 25);
insert into modele values (544, 'iOn', 25);
insert into modele values (545, '508', 25);
insert into modele values (546, 'RCZ', 25);
insert into modele values (547, '5008', 25);
insert into modele values (548, '3008', 25);
insert into modele values (549, '206+', 25);
insert into modele values (550, 'Bipper', 25);
insert into modele values (551, '4007', 25);
insert into modele values (552, '308', 25);
insert into modele values (553, '207', 25);
insert into modele values (554, '107', 25);
insert into modele values (555, '1007', 25);
insert into modele values (556, '407', 25);
insert into modele values (557, '807', 25);
insert into modele values (558, '307', 25);
insert into modele values (559, '607', 25);
insert into modele values (560, '206', 25);
insert into modele values (561, 'Partner', 25);
insert into modele values (562, '406', 25);
insert into modele values (563, '806', 25);
insert into modele values (564, '306', 25);
insert into modele values (565, '106', 25);
insert into modele values (566, '605', 25);
insert into modele values (567, '405', 25);
insert into modele values (568, '309', 25);
insert into modele values (569, '505', 25);
insert into modele values (570, '205', 25);
insert into modele values (571, '305', 25);


-- Porsche

insert into modele values (572, 'Taycan', 26);
insert into modele values (573, 'Macan', 26);
insert into modele values (574, '918 Spyder', 26);
insert into modele values (575, 'Panamera', 26);
insert into modele values (576, 'Cayman', 26);
insert into modele values (577, 'Cayenne', 26);
insert into modele values (578, 'Boxster', 26);
insert into modele values (579, '968', 26);
insert into modele values (580, '911', 26);
insert into modele values (581, '928', 26);
insert into modele values (582, '944', 26);
insert into modele values (583, '924', 26);


-- Renault

insert into modele values (584, 'Trafic SpaceClass', 27);
insert into modele values (585, 'Talisman', 27);
insert into modele values (586, 'Kadjar', 27);
insert into modele values (587, 'ZOE', 27);
insert into modele values (588, 'Twizy', 27);
insert into modele values (589, 'Captur', 27);
insert into modele values (590, 'Latitude', 27);
insert into modele values (591, 'Fluence', 27);
insert into modele values (592, 'Koleos', 27);
insert into modele values (593, 'Modus', 27);
insert into modele values (594, 'Vel Satis', 27);
insert into modele values (595, 'Avantime', 27);
insert into modele values (596, 'Thalia', 27);
insert into modele values (597, 'Scenic', 27);
insert into modele values (598, 'Kangoo', 27);
insert into modele values (599, 'Megane', 27);
insert into modele values (600, 'Laguna', 27);
insert into modele values (601, 'Twingo', 27);
insert into modele values (602, 'Safrane', 27);
insert into modele values (603, 'Clio', 27);
insert into modele values (604, 'R25', 27);
insert into modele values (605, 'R19', 27);
insert into modele values (606, 'R9', 27);
insert into modele values (607, 'R11', 27);
insert into modele values (608, 'Escape', 27);
insert into modele values (609, 'R5', 27);
insert into modele values (610, 'R21', 27);
insert into modele values (611, 'R4', 27);


-- Saab

insert into modele values (612, '9-3X', 28);
insert into modele values (613, '9-7X', 28);
insert into modele values (614, '9-2X', 28);
insert into modele values (615, '9-3', 28);
insert into modele values (616, '9-5', 28);
insert into modele values (617, '9000', 28);
insert into modele values (618, '900', 28);


-- Seat

insert into modele values (619, 'Tarraco', 29);
insert into modele values (620, 'Arona', 29);
insert into modele values (621, 'ATECA', 29);
insert into modele values (622, 'Mii', 29);
insert into modele values (623, 'Eeo', 29);
insert into modele values (624, 'Altea', 29);
insert into modele values (625, 'Leon', 29);
insert into modele values (626, 'Alhambra', 29);
insert into modele values (627, 'Arosa', 29);
insert into modele values (628, 'Cordoba', 29);
insert into modele values (629, 'Toledo', 29);
insert into modele values (630, 'Marbella', 29);
insert into modele values (631, 'Ibiza', 29);
insert into modele values (632, 'Ronda', 29);


-- Skoda

insert into modele values (633, 'Kamiq', 30);
insert into modele values (634, 'Scala', 30);
insert into modele values (635, 'Karoq', 30);
insert into modele values (636, 'Kodiaq', 30);
insert into modele values (637, 'Rapid', 30);
insert into modele values (638, 'Citigo', 30);
insert into modele values (639, 'Yeti', 30);
insert into modele values (640, 'Roomster', 30);
insert into modele values (641, 'Superb', 30);
insert into modele values (642, 'Fabia', 30);
insert into modele values (643, 'Octavia', 30);
insert into modele values (644, 'Felicia', 30);
insert into modele values (645, 'Forman', 30);
insert into modele values (646, 'Favorit', 30);
insert into modele values (647, '130', 30);
insert into modele values (648, '120', 30);
insert into modele values (649, 'S 130', 30);
insert into modele values (650, 'S 105', 30);


-- Subaru

insert into modele values (651, 'Levorg', 31);
insert into modele values (652, 'Outback', 31);
insert into modele values (653, 'WRX', 31);
insert into modele values (654, 'BRZ', 31);
insert into modele values (655, 'XV', 31);
insert into modele values (656, 'Tribeca', 31);
insert into modele values (657, 'Baja', 31);
insert into modele values (658, 'Forester', 31);
insert into modele values (659, 'Impreza', 31);
insert into modele values (660, 'SVX', 31);
insert into modele values (661, 'Legacy', 31);
insert into modele values (662, 'Justy', 31);
insert into modele values (663, '1800', 31);


-- Suzuki

insert into modele values (664, 'Celerio', 32);
insert into modele values (665, 'Kizashi', 32);
insert into modele values (666, 'Splash', 32);
insert into modele values (667, 'XL7', 32);
insert into modele values (668, 'SX4', 32);
insert into modele values (669, 'Reno', 32);
insert into modele values (670, 'Forenza', 32);
insert into modele values (671, 'Liana', 32);
insert into modele values (672, 'Ignis', 32);
insert into modele values (673, 'Jimny', 32);
insert into modele values (674, 'Wagon R+', 32);
insert into modele values (675, 'X-90', 32);
insert into modele values (676, 'Baleno', 32);
insert into modele values (677, 'Vitara', 32);
insert into modele values (678, 'Samurai', 32);
insert into modele values (679, 'Alto', 32);
insert into modele values (680, 'Swift', 32);


-- Tata

insert into modele values (681, 'Indica Vista', 33);
insert into modele values (682, 'Safari', 33);
insert into modele values (683, 'Xenon', 33);
insert into modele values (684, 'Indica', 33);
insert into modele values (685, 'Indigo', 33);


-- Toyota

insert into modele values (686, 'Proace City Verso', 34);
insert into modele values (687, 'Proace Verso', 34);
insert into modele values (688, 'C-HR', 34);
insert into modele values (689, 'GT86', 34);
insert into modele values (690, 'Verso-S', 34);
insert into modele values (691, 'Verso', 34);
insert into modele values (692, 'Urban Cruiser', 34);
insert into modele values (693, 'iQ', 34);
insert into modele values (694, 'Auris', 34);
insert into modele values (695, 'FJ Cruiser', 34);
insert into modele values (696, 'Aygo', 34);
insert into modele values (697, 'Prius', 34);
insert into modele values (698, 'Highlander', 34);
insert into modele values (699, 'Tundra', 34);
insert into modele values (700, 'Yaris', 34);
insert into modele values (701, 'Avensis', 34);
insert into modele values (702, 'Tacoma', 34);
insert into modele values (703, 'Picnic', 34);
insert into modele values (704, 'Paseo', 34);
insert into modele values (705, 'RAV4', 34);
insert into modele values (706, 'Previa', 34);
insert into modele values (707, 'MR2', 34);
insert into modele values (708, 'Supra', 34);
insert into modele values (709, 'Celica', 34);
insert into modele values (710, '4Runner', 34);
insert into modele values (711, 'HiLux', 34);
insert into modele values (712, 'Camry', 34);
insert into modele values (713, 'Land Cruiser', 34);
insert into modele values (714, 'Carina', 34);
insert into modele values (715, 'Corolla', 34);
insert into modele values (716, 'Starlet', 34);
insert into modele values (717, 'Tercel', 34);


-- Volkswagen

insert into modele values (718, 'T-Cross', 35);
insert into modele values (719, 'T-ROC', 35);
insert into modele values (720, 'Arteon', 35);
insert into modele values (721, 'Caddy', 35);
insert into modele values (722, 'Caravelle', 35);
insert into modele values (723, 'Multivan', 35);
insert into modele values (724, 'up', 35);
insert into modele values (725, 'Amarok', 35);
insert into modele values (726, 'Tiguan', 35);
insert into modele values (727, 'Eos', 35);
insert into modele values (728, 'Fox', 35);
insert into modele values (729, 'Touareg', 35);
insert into modele values (730, 'Touran', 35);
insert into modele values (731, 'Phaeton', 35);
insert into modele values (732, 'New Beetle', 35);
insert into modele values (733, 'Bora', 35);
insert into modele values (734, 'Lupo', 35);
insert into modele values (735, 'Sharan', 35);
insert into modele values (736, 'Vento', 35);
insert into modele values (737, 'Corrado', 35);
insert into modele values (738, 'Scirocco', 35);
insert into modele values (739, 'Jetta', 35);
insert into modele values (740, 'Passat', 35);
insert into modele values (741, 'Polo', 35);
insert into modele values (742, 'Golf', 35);


-- Volvo

insert into modele values (743, 'XC 40', 36);
insert into modele values (744, 'V40 Cross Country', 36);
insert into modele values (745, 'V60', 36);
insert into modele values (746, 'XC 60', 36);
insert into modele values (747, 'C30', 36);
insert into modele values (748, 'XC70', 36);
insert into modele values (749, 'V50', 36);
insert into modele values (750, 'XC 90', 36);
insert into modele values (751, 'S60', 36);
insert into modele values (752, 'S80', 36);
insert into modele values (753, 'C70', 36);
insert into modele values (754, 'S90', 36);
insert into modele values (755, 'V90', 36);
insert into modele values (756, 'V70', 36);
insert into modele values (757, 'S70', 36);
insert into modele values (758, 'V40', 36);
insert into modele values (759, 'S40', 36);
insert into modele values (760, '850', 36);
insert into modele values (761, '940', 36);
insert into modele values (762, '960', 36);
insert into modele values (763, '460', 36);
insert into modele values (764, '440', 36);
insert into modele values (765, '480', 36);
insert into modele values (766, '740', 36);
insert into modele values (767, '760', 36);
insert into modele values (768, '360', 36);
insert into modele values (769, '240', 36);
insert into modele values (770, '340', 36);


commit;
