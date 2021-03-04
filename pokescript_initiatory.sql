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

CREATE TABLE team_stats (
	id_current_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_level INT NOT NULL,
	team_exp INT NOT NULL,
	team_hp INT NOT NULL,
	team_attack INT NOT NULL,
	team_defense INT NOT NULL,
	team_x_atk INT NOT NULL,
	team_x_def INT NOT NULL,
	team_speed INT NOT NULL,
	team_accuracy INT NOT NULL,	
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) 
);

INSERT INTO team_stats (team_level, team_exp, team_hp, team_attack, team_defense, team_x_atk, team_x_def, team_speed, team_accuracy, id_pokenti) VALUES
	(8, 34, 41, 42, 65, 15, 15, 44,31, 1),
	(22, 33, 6, 43, 80, 8, 6, 45, 31, 2),
	(13, 44, 68, 56, 10, 10, 38, 11, 55, 3),
	(14, 14, 62, 32, 60, 35, 45, 12, 39, 4),
	(24, 75, 13, 18, 8, 25, 18, 45,  11, 5),
	(94, 88, 45, 42, 65, 45, 65, 66, 31, 6),
	(7, 23, 31, 35, 50, 6, 43, 45, 24, 7),
	(31, 28, 3, 20, 35, 10, 58, 47, 14, 8),
	(53, 71, 11, 60, 5, 15, 78, 49, 20, 9),
	(12, 21, 70, 31, 10, 20, 45, 11 ,15, 10),
	(27, 30, 140, 45, 55, 25, 30, 15, 50, 11),
	(55, 76, 15, 40, 14, 30, 70, 33, 45, 12),
	(12, 20, 25, 20, 24, 20, 50, 11, 19, 13),
	(26, 47, 15, 12, 15, 2, 35, 33, 45, 14),
	(77, 404, 110, 14, 40, 40, 55, 75, 15, 15),
	(6, 42, 15, 40, 32, 32, 53, 44, 25, 16),
	(10, 10, 220, 155, 44, 41, 31, 88, 39, 17),
	(77, 189, 50, 75, 17, 14, 10, 90, 79, 18),
	(4, 34, 6, 5, 2, 5, 2,  3, 19),
	(54, 1, 11, 60, 15, 40, 9, 110, 41, 20);

CREATE TABLE poke_pc (
	id_pc INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) 
);

INSERT INTO poke_pc (id_pokenti) VALUES
	(3),
	(6),
	(19),
	(12);

CREATE TABLE pc_stats (
	id_pc_stats INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hp INT NOT NULL,
	attack INT NOT NULL,
	defense INT NOT NULL,
	x_atk INT NOT NULL,
	x_def INT NOT NULL,
	speed INT NOT NULL,
	accuracy INT NOT NULL,
	xp INT NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti)
);

INSERT INTO pc_stats (hp, attack, defense, x_atk, x_def, speed, accuracy, xp, id_pokenti) VALUES
	(40, 50, 40, 40, 40, 90, 20, 318, 1),
	(65, 65, 65, 50, 50, 90, 25, 385, 2),
	(90, 95, 95, 70, 90, 70, 30, 510, 3),
	(25, 20, 15, 105, 55, 90, 88, 309, 4),
	(40, 35, 30, 120, 70, 105, 90, 400, 5),
	(55, 50, 45, 135, 95, 120, 99, 500, 6),
	(70, 80, 50, 35, 35, 35, 40 ,305, 7),
	(80, 100, 70, 50, 60, 45, 55, 405, 8),
	(90, 130, 80, 65, 85, 55, 55, 505, 9),
	(50, 75, 35, 70, 30, 40, 20, 300, 10),
	(65, 90, 50, 85, 45, 55, 35, 390, 11),
	(80, 105, 65, 100, 70, 70, 53, 490, 12),
	(40, 80, 100, 30, 30, 20, 14, 300, 13),
	(55, 95, 115, 45, 45, 35, 22, 390, 14),
	(80, 120, 130, 55, 65, 45, 60, 495, 15),
	(41, 64, 45, 50, 50, 50, 42 , 300, 16),
	(61, 84, 65, 70, 70, 71, 64 , 420, 17),
	(91, 134, 95, 100, 100, 80, 84, 600, 18),
	(20, 10, 55, 15, 20, 80, 1 ,200, 19),
	(95, 125, 79, 60, 100, 81, 100 ,540, 20);

/*Procedures for management*/

DROP PROCEDURE IF EXISTS caughtPokenti;

DELIMITER //

CREATE PROCEDURE caughtPokenti (IN in_id_pokenti INT UNSIGNED) 

BEGIN

	INSERT INTO poke_team (id_pokenti) VALUES ( 
		in_id_pokenti );
	DELETE FROM poke_pc  WHERE id_pokenti=in_id_pokenti LIMIT 1;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS storePokenti;

DELIMITER //

CREATE PROCEDURE storePokenti (
	IN in_id_pokenti INT UNSIGNED )
BEGIN 
INSERT INTO poke_pc (id_pokenti) VALUES (
	in_id_pokenti);

DELETE FROM poke_team WHERE id_pokenti=in_id_pokenti LIMIT 1;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS heal;

DELIMITER //

CREATE PROCEDURE healWound (
	IN in_healing INT,
	IN in_pokenti INT UNSIGNED )
BEGIN 

SELECT hp INTO @hp FROM pc_stats WHERE id_pokenti=in_pokenti;
SELECT curr_hp INTO @team_hp FROM team_stats WHERE id_pokenti=in_pokenti;

IF @curr_hp+in_healing> @hp THEN
	UPDATE team_stats SET curr_hp=@hp WHERE id_pokenti=in_pokenti;
ELSE
	UPDATE team_stats SET curr_hp=@curr_hp+in_healing WHERE id_pokenti=in_pokenti;
END IF;

END //

DELIMITER ;
