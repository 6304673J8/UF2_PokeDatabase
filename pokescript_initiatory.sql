/* Let's start by deleting tables if they exist */

DROP TABLE IF EXISTS pokentis;
DROP TABLE IF EXISTS poke_team;
DROP TABLE IF EXISTS poke_pc;

DROP TABLE IF EXISTS poke_types;
DROP TABLE IF EXISTS base_type;

DROP TABLE IF EXISTS evolution_index;
DROP TABLE IF EXISTS poke_evolving;
DROP TABLE IF EXISTS to_level;

DROP TABLE IF EXISTS wild_stats;
DROP TABLE IF EXISTS team_stats;
DROP TABLE IF EXISTS stats;

CREATE TABLE pokentis (
	id_pokenti INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(24) NOT NULL,
	wap_name VARCHAR(24) NOT NULL,
	poke_index INT NOT NULL 
);

INSERT INTO pokentis (name, wap_name, poke_index) VALUES
	('Poliwag', 'Nyoromo', 1),
	('Poliwhirl', 'Nyorozo', 2),
	('Poliwrath', 'Nyoboron', 3),
	('Abra', 'Casey', 4),
	('Kadabra','Yungerer',5),
	('Alakazam','Foodin',6),
	('Machop','Wanriky',7),
	('Machoke','Goriky',8),
	('Machamp','Kairiky',9),
	('Bellsprout','Madatsubomi',10),
	('Weepinbell','Utsudon',11),
	('Victrebeel','Utsubot',12),
	('Geodude','Ishitsubute',13),
	('Graveler','Golone',14),
	('Golem','Golonya',15),
	('Dratini','Miniryu',16),
	('Dragonair','Hakuryu',17),
	('Dragonite','Kairyu',18),
	('Magikarp','Koiking',19);
	('Gyarados','Gyarados',20);

CREATE TABLE base_type (
	id_base_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type_name VARCHAR(16) NOT NULL
);

INSERT INTO base_type (type_name) VALUES	
	('Bug'),	
	('Dragon'),
	('Electric'),
	('Fighting'),
	('Fire'),
	('Flying'),
	('Ghost'),
	('Grass'),
	('Ground'),
	('Ice'),
	('Normal'),
	('Poison')
	('Psychic')
	('Rock')
	('Water');

CREATE TABLE poke_types (
	id_poke_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	id_base_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	FOREIGN KEY (id_base_type) REFERENCES base_type(id_base_type)
);

INSERT INTO pokentis_types (id_pokenti, id_type) VALUES
	(1, 15),
	(2, 15),
	(3, 15),
	(4, 13),
	(5, 13),
	(6, 13),
	(7, 4),
	(8, 4),
	(9, 4),
	(10, 8),
	(11, 8),
	(12, 8),
	(13, 14),
	(14, 14),
	(15, 14),
	(16, 2),
	(17, 2),
	(18, 2),
	(19, 15),
	(20, 2);

CREATE TABLE evolution_index (
	id_evolution_index INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pre_evolution VARCHAR(24) NOT NULL,
	next_evolution VARCHAR(24) NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti)
);

INSERT INTO evolution_index (pre_evolution, next_evolution, id_pokenti) VALUES
	('Egg', 'Poliwhirl', 1),
	('Poliwag', 'Poliwrath', 2),
	('Poliwhirl', '', 3),
	('Egg', 'Kadabra', 4),
	('Abra', 'Alakazam', 5),
	('Kadabra', '', 6),
	('Egg', 'Machoke', 7),
	('Machop', 'Machamp', 8),
	('Machoke', '', 9),
	('Egg', 'Weepinbell', 10),
	('Bellsprout', 'Victreebell', 11),
	('Weepinbell', '', 12),
	('Egg', 'Graveler', 13),
	('Geodude', 'Golem', 14),
	('Graveler', '', 15),
	('Egg', 'Dragonair', 16),
	('Dratini', 'Dragonite', 17),
	('Dragonair', '', 18),
	('Egg', 'Gyarados', 19),
	('Magikarp', '', 20);

CREATE TABLE to_level (
	id_to_level INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_evolution INT,
	special_action TINYINT,
	final_evolution INT
);

INSERT INTO to_level (first_evolution, special_action, final_evolution) VALUES
	(21, 1, null),
	(16, 1, null),
	(28, 1, null),
	(21, 1, null),
	(25, 1, null),
	(30, 0, 55),
	(20, 0, null);
	
CREATE TABLE poke_evolving (
	id_evolving INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_evolution_index INT UNSIGNED,
	id_to_level INT UNSIGNED,
	FOREIGN KEY (id_evolution_index) REFERENCES evolution_index(id_evolution_index),
	FOREIGN KEY (id_to_level) REFERENCES to_level(id_to_level)
);

INSERT INTO poke_evolving (id_evolution_index, id_to_level) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 5),
	(14, 5),
	(15, 5),
	(16, 6),
	(17, 6),
	(18, 6),
	(19, 7),
	(20, 7);

CREATE TABLE poke_team (
	id_team INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti)
);

INSERT INTO poke_team(id_pokenti) VALUES
	(1),
	(4),
	(9),
	(15),
	(18);

CREATE TABLE poke_pc (
	id_pc INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO poke_pc (id_pokenti) VALUES
	(3),
	(6),
	(19),
	(12);




