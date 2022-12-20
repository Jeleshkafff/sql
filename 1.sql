-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Tournament'
-- 
-- ---
create database kiber;
use kiber;

-- DROP TABLE IF EXISTS `Tournament`;
		
-- CREATE TABLE `Tournament` (
--   `id_Tournament` INTEGER PRIMARY KEY AUTO_INCREMENT not null,
--   `Discipline` INTEGER not null,
--   `Location` INTEGER not null,
--   `date_of_beginning` DATETIME NOT NULL default NOW(),
--   `End_date` DATETIME NOT NULL,
--   `Organization` INTEGER not null,
--   `Count_team` INTEGER DEFAULT NULL,

--    FOREIGN KEY (Discipline) REFERENCES ` discipline` (`id`),
--  FOREIGN KEY (Location) REFERENCES `location` (`id_location`),
-- FOREIGN KEY (Organization) REFERENCES `Organization` (`id`)
-- );
alter table result add column win bool not null default false

-- ---
-- Table 'Team'
-- 
-- ---

-- DROP TABLE IF EXISTS `Team`;
-- 		
-- CREATE TABLE `Team` (
--   `id_Team` INTEGER PRIMARY KEY  AUTO_INCREMENT ,
--   `Name` VARCHAR(50) not null unique,
--   `date_of_creation` Datetime not NULL DEFAULT now()
-- );

-- ---
-- Table 'Match'
-- 
-- ---

-- DROP TABLE IF EXISTS `Match`;
		
-- CREATE TABLE `Match` (
--   `id_Match` INTEGER not null AUTO_INCREMENT ,
--   `Tournament` INTEGER not null,
--   PRIMARY KEY (`id_Match`),
--   FOREIGN KEY (Tournament) REFERENCES `Tournament` (`id_Tournament`)
-- );

-- ---
-- Table 'commentary_staff'
-- 
-- ---

-- DROP TABLE IF EXISTS `commentary_staff`;
		
-- CREATE TABLE `commentary_staff` (
--   ` employee_code` INTEGER AUTO_INCREMENT ,
--   `Name` varchar(30) NOT NULL ,
--   `Surname` varchar(30) NOT NULL ,
--   `patronymic` varchar(30) ,
--   `Speciality` INTEGER not null,
--   `passport_details` varchar(20) unique not null,
--   PRIMARY KEY (` employee_code`),
--   FOREIGN KEY (Speciality) REFERENCES `Speciality` (`id_Speciality`)
-- );

-- ---
-- Table ' Tournament_teams'
-- 
-- ---

-- DROP TABLE IF EXISTS ` Tournament_teams`;
-- 		
-- CREATE TABLE ` Tournament_teams` (
--   `Team` INTEGER not null,
--   `Tournament` INTEGER not null,
--   PRIMARY KEY (`Team`, `Tournament`),
--   FOREIGN KEY (Team) REFERENCES `Team` (`id_Team`),
--   FOREIGN KEY (Tournament) REFERENCES `Tournament` (`id_Tournament`)
-- );

-- ---
-- Table 'Result'
-- 
-- ---

-- DROP TABLE IF EXISTS `Result`;
		
-- CREATE TABLE `Result` (
--   `Match` INTEGER not null,
--   `Team` INTEGER not null,
--   `Place` INTEGER not null,
--   PRIMARY KEY (`Match`),
--   FOREIGN KEY (`Match`) REFERENCES `Match` (`id_Match`),
--   FOREIGN KEY (Team) REFERENCES `Team_in_math` (`Team`)
-- );

-- ---
-- Table 'Players'
-- 
-- ---

-- DROP TABLE IF EXISTS `Players`;
		
-- CREATE TABLE `Players` (
--   `id_Players`  INTEGER PRIMARY KEY AUTO_INCREMENT,
--   `Name` VARCHAR(30) not null ,
--   `Nickname` VARCHAR(40) not null unique,
--   `Surname` VARCHAR(30) not null,
--   `Date_of_Birth` date not null,
--   `Country` INTEGER not null,
--   FOREIGN KEY (Country) REFERENCES `Country` (`id_country`)
-- );

-- ---
-- Table ' Play_in_a_match'
-- 
-- ---

-- DROP TABLE IF EXISTS ` Play_in_a_match`;
		
-- CREATE TABLE ` Play_in_a_match` (
--   `Match` INTEGER not null,
--   `Team` INTEGER not null,
--   `Was_there_a_game` bool not null default false,
--   `Map` INTEGER NOT NULL default 0,
--    FOREIGN KEY (`Match`) REFERENCES `Match` (`id_Match`)
-- );

-- ---
-- Table 'Team_players'
-- 
-- ---

-- DROP TABLE IF EXISTS `Team_players`;
-- 		
-- CREATE TABLE `Team_players` (
--   `Player` INTEGER not null,
--   `Team` INTEGER not null,
--   `Date_of_membership` datetime not NULL DEFAULT now(),
--   `Does_it_play` bool not null DEFAULT true,
--   FOREIGN KEY (Player) REFERENCES `Players` (`id_Players`),
-- FOREIGN KEY (Team) REFERENCES `Team` (`id_Team`)
-- );

-- ---
-- Table 'Workers_in_the_tournament'
-- 
-- ---

DROP TABLE IF EXISTS `Workers_in_the_tournament`;
		
CREATE TABLE `Workers_in_the_tournament` (
  `Tournament` INTEGER not null,
  `employee` INTEGER not null,
    FOREIGN KEY (Tournament) REFERENCES `Tournament` (`id_Tournament`),
	FOREIGN KEY (employee) REFERENCES `commentary_staff` (` employee_code`)
);

-- ---
-- Table 'Organization'
-- 
-- ---

-- DROP TABLE IF EXISTS `Organization`;
-- 		
-- CREATE TABLE `Organization` (
--   `id` INTEGER PRIMARY KEY not NULL,
--   `Name` varchar(40) not NULL unique,
--   `Location` INTEGER not null,
--   FOREIGN KEY (Location) REFERENCES `location` (`id_location`)
-- );
create table Town (
id_town INTEGER PRIMARY KEY not NULL,
country int not null,
FOREIGN KEY (country) REFERENCES `country` (`id_country`)
);
create table Venue (
id_venue INTEGER PRIMARY KEY not NULL,
Town int not null,
FOREIGN KEY (Town) REFERENCES `Town` (`id_town`)
);
ALTER TABLE `kiber`.`organization` 
ADD COLUMN `Venue` INT NOT NULL AFTER `Name`;

ALTER TABLE `kiber`.`tournament` 
ADD COLUMN `Venue` INT NULL AFTER `exit_game`,
ADD COLUMN `online` TINYINT(1) NOT NULL DEFAULT 1 AFTER `Venue`,
CHANGE COLUMN `Count_team` `Count_team` INT NOT NULL DEFAULT 0 ;



alter table  ` play_in_a_match` add FOREIGN KEY (Team) REFERENCES `team_in_math` (`Team`);
-- SET FOREIGN_KEY_CHECKS=0;
alter table  `organization` add FOREIGN KEY (Town) REFERENCES `town` (id_town);
alter table  `tournament` add FOREIGN KEY (Venue) REFERENCES `Venue` (`id_venue`);
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `kiber`.`organization` 
DROP COLUMN `Countrie`

ALTER TABLE organization DROP FOREIGN KEY organization_ibfk_1 ; 


-- ---
-- Table 'Speciality'
-- 
-- ---

-- DROP TABLE IF EXISTS `Speciality`;
		
-- CREATE TABLE `Speciality` (
--   `id_Speciality` INTEGER  AUTO_INCREMENT not null,
--   `Name` VARCHAR(40) not null unique,
--   PRIMARY KEY (`id_Speciality`)
-- );

-- ---
-- Table 'Country'
-- 
-- ---

-- DROP TABLE IF EXISTS `Country`;
		
-- CREATE TABLE `Country` (
--   `id_country`  INTEGER PRIMARY KEY AUTO_INCREMENT,
--   `The_name_of_the_country` varchar(50) not null unique

-- );

-- ---
-- Table ' Discipline'
-- 
-- ---

-- DROP TABLE IF EXISTS ` Discipline`;
-- 		
-- CREATE TABLE ` Discipline` (
--   `id` INTEGER  AUTO_INCREMENT ,
--   `Name` varchar(60) not null unique,
--   PRIMARY KEY (`id`)
-- );

-- ---
-- Table 'Team_in_math'
-- 
-- ---

-- DROP TABLE IF EXISTS `Team_in_math`;
		
-- CREATE TABLE `Team_in_math` (
--   `Team` INTEGER not null,
--   `Match` INTEGER not null,
--   PRIMARY KEY (`Team`, `Match`),
--   FOREIGN KEY (Team) REFERENCES ` Tournament_teams` (`Team`),
--   FOREIGN KEY (`Match`) REFERENCES `Match` (`id_Match`)
-- );

-- ---
-- Table 'Prize'
-- 
-- ---

DROP TABLE IF EXISTS `Prize`;
		
CREATE TABLE `Prize` (
  `tuournament` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `plase` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`tuournament`)
);

-- ---
-- Table 'location'
-- 
-- ---

-- DROP TABLE IF EXISTS `location`;
		
-- CREATE TABLE `location` (
--   `id_location` INTEGER  AUTO_INCREMENT not NULL,
--   `name_location` varchar(80) not null DEFAULT "online",
--   PRIMARY KEY (`id_location`)
-- );

-- ---
-- Foreign Keys 
-- ---










ALTER TABLE `Workers_in_the_tournament` ADD FOREIGN KEY (Tournament) REFERENCES `Tournament` (`id_Tournament`);
ALTER TABLE `Workers_in_the_tournament` ADD FOREIGN KEY ( employee) REFERENCES `commentary_staff` (` employee_code`);

ALTER TABLE `result` ADD FOREIGN KEY (`Match`) REFERENCES `match` (`id_Match`);

INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('1', '5', '0');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('1', '6', '1');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('2', '1', '0');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('2', '8', '1');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('3', '3', '0');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('3', '6', '1');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('4', '7', '0');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('4', '8', '1');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('5', '6', '1');
INSERT INTO `kiber`.`result` (`Match`, `Team`, `win`) VALUES ('5', '8', '0');


ALTER TABLE `Prize` ADD FOREIGN KEY (tuournament) REFERENCES `Tournament` (`id_Tournament`);

-- ---
-- Table Properties
-- ---


-- ---
-- Test Data
-- ---

-- INSERT INTO `Tournament` (`id_Tournament`,` Discipline`,`Location`,`the_date_of_the_beginning`,`End_date`,`Organization`,`Count_team`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Team` (`id_Team`,`Name`,`date_of_creation`) VALUES
-- ('','','');
-- INSERT INTO `Match` (`id_Match`,`Tournament`) VALUES
-- ('','');
-- INSERT INTO `commentary_staff` (` employee_code`,`Name`,`Surname`,`patronymic`,`Speciality`,`passport_details`) VALUES
-- ('','','','','','');
-- INSERT INTO ` Tournament_teams` (`Team`,`Tournament`) VALUES
-- ('','');
-- INSERT INTO `Result` (`Match`,`Team`,`Place`) VALUES
-- ('','','');
-- INSERT INTO `Players` (`id_Players`,`Name`,`Nickname`,`Surname`,`Date_of_Birth`,`Country`) VALUES
-- ('','','','','','');
-- INSERT INTO ` Play_in_a_match` (`Match`,`Team`,`Was_there_a_game`,`Map`) VALUES
-- ('','','','');

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('1','1','2016-07-04',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('2','1','2017-11-06',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('3','1','2020-12-20',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('4','1','2020-01-24',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('5','1','2022-07-03',true);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('6','2','2020-04-05',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('7','2','2020-04-08',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('8','2','2021-02-26',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('9','2','2022-06-21',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('10','2','2022-10-10',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('11','3','2016-01-20',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('12','3','2019-09-26',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('13','3','2021-01-30',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('14','3','2021-02-15',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('15','3','2022-01-03',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('16','3','2021-03-13',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('17','4','2019-12-16',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('18','4','2019-12-16',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('19','4','2019-12-16',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('20','4','2021-10-22',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('21','4','2022-05-31',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('22','4','2022-05-31',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('23','5','2021-02-18',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('24','5','2018-10-08',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('25','5','2022-01-05',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('26','5','2022-01-05',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('27','5','2022-08-15',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('28','5','2022-01-05',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('29','6','2020-10-28',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('30','6','2019-09-30',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('31','6','2022-01-03',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('32','6','2022-08-16',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('33','6','2022-08-16',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('34','6','2022-10-29',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('35','7','2021-04-09',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('36','7','2022-01-23',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('37','7','2022-05-27',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('38','7','2022-05-27',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('39','7','2022-07-15',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('40','7','2020-01-29',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('41','8','2015-03-22',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('42','8','2018-02-05',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('43','8','2021-12-27',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('44','8','2022-01-15',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('45','8','2022-10-18',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('46','8','2022-06-20',true);



INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('31', '14',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('32', '14',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('29', '7',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('30', '7',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('28', '8',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('27', '8',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('26', '9',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('25', '9',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('24', '10',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('23', '10',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('22', '11',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('21', '11',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('20', '12',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('19', '12',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('18', '13',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('17', '13',0);

INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('30', '15',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('32', '15',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('27', '16',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('25', '16',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('21', '17',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('23', '17',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('18', '18',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('19', '18',1);

INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('30', '19',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('27', '19',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('21', '20',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('19', '20',1);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('19', '21',0);
INSERT INTO `kiber`.`result` (`Team`, `Match`,win) VALUES ('27', '21',1);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('49','17','2022-03-26',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('50','17','2022-11-04',true);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('51','17','2022-02-04',true);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('52','18','2020-09-09',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('53','18','2020-11-04',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('54','18','2019-04-09',0);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('54','19','2022-07-26',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('55','19','2019-03-15',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('56','19','2021-03-24',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('57','19','2022-07-15',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('58','19','2022-11-03',1);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('59','20','2020-04-28',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('60','20','2020-07-02',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('61','20','2022-05-09',1);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('62','21','2021-07-06',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('63','21','2021-06-01',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('64','21','2021-06-01',1);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('65','22','2020-12-25',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('66','22','2020-12-25',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('67','22','2021-02-18',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('68','23','2021-05-10',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('69','23','2021-05-10',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('70','23','2021-05-10',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('71','24','2020-07-13',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('72','24','2020-09-29',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('73','24','2021-07-20',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('74','25','2020-10-27',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('75','25','2020-10-27',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('76','25','2020-10-27',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('77','26','2020-11-21',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('78','26','2020-11-21',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('79','26','2021-08-03',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('80','27','2021-05-27',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('81','27','2021-05-27',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('82','27','2021-05-27',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('83','28','2019-03-05',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('84','28','2021-01-12',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('85','28','2021-05-17',1);



INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('86','29','2020-10-01',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('87','29','2020-10-01',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('88','29','2021-06-14',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('89','30','2021-03-19',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('90','30','2022-08-08',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('91','30','2021-06-14',0);


INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('92','31','2021-02-26',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('93','31','2021-02-26',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('94','31','2021-02-26',1);

INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('95','32','2021-03-20',1);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('96','32','2021-03-20',0);
INSERT INTO `Team_players` (`Player`,`Team`,`Date_of_membership`,`Does_it_play`) VALUES
('97','32','2021-03-20',1);




UPDATE `kiber`.`commentary_staff` SET `Name` = 'Freya ', `Surname` = 'Spiers', `Speciality` = '4', `Nickname` = 'Freya' WHERE (` employee_code` = '1');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Jason ', 'O\'Toole', '1', 'moses ');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Harry ', 'Russell', '1', 'JustHarry');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Conner ', 'Girvan', '1', 'Scrawny ');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Mohan ', 'Govindasamy', '1', 'launders');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('James', 'Banks', '5', 'James Banks');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Mads ', 'Pedersen', '5', 'CouldBeMassive');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Mathieu ', 'Quiquerez', '2', 'Maniac ');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Danny ', 'Hsieh', '2', 'Mahone ');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Jacob ', 'Winneche', '2', 'Pimp ');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Markus ', 'Eliasen', '3', 'Pinqu');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Jake ', 'Karakouzian', '3', 'zarx');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Marko ', 'Krajčeski', '3', 'shev');
INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `Nickname`) VALUES ('Bastian ', 'Faber', '3', 'UnknownFME');




INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Aleksei', 'Qikert', 'Golubev', '1999-01-01', '9');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Dastan', 'dastan', 'Aqbaev', '1993-08-05', '9');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Dzhami', 'Jame', 'Ali', '1998-05-23', '1');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Evgeniy', 'FL1T', 'Lebedev', '2000-12-21', '1');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('David', 'n0rb3r7', 'Daniyelyan', '2001-03-11', '1');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Pyotr', 'fame', 'Bolyshev', '2003-03-03', '1');


INSERT INTO `kiber`.` tournament_teams` (`Team`, `Tournament`) VALUES ('2', '1');


INSERT INTO `kiber`.`team` (`id_Team`, `Name`, `date_of_creation`) VALUES ('2', 'Heroic', '2016-08-26');
INSERT INTO `kiber`.`location` (`name_location`) VALUES (' United Arab Emirates, Abu Dhabi');

ALTER TABLE `kiber`.` play_in_a_match` 
DROP COLUMN `Map`,
DROP COLUMN `Was_there_a_game`;

ALTER TABLE `kiber`.`match` 
ADD COLUMN `was_the_game` TINYINT(1) NOT NULL DEFAULT 0 AFTER `Tournament`;

TRUNCATE TABLE Team_players;
INSERT INTO `Workers_in_the_tournament` (`Tournament`,`employee`) VALUES
('1','1');
INSERT INTO `Workers_in_the_tournament` (`Tournament`,`employee`) VALUES
('1','2'),('1','3'),('1','4'),('1','5'),('1','6'),('1','7'),('1','8'),('1','9'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14');
-- INSERT INTO `Organization` (`id`,`Name`,`Location`) VALUES
-- ('','','');
-- INSERT INTO `Speciality` (`id_Speciality`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Country` (`id_country`,`The_name_of_the_country`) VALUES
-- ('','');
-- INSERT INTO ` Discipline` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Team_in_math` (`Team`,`Match`) VALUES
-- ('','');
-- INSERT INTO `Prize` (`tuournament`,`plase`) VALUES
-- ('','');
-- INSERT INTO `location` (`id_location`,`name_location`) VALUES
-- ('','')-- тригерр на результатыalter--процедура завершение матча 
ALTER TABLE result DROP FOREIGN KEY result_ibfk_1 ; 
SHOW CREATE TABLE  result;
-- create procedure cloze_proc 
-- as 
INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Russia');
INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Ukraine');

INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Denis ', 'electronic', 'Sharipov', '1998-09-02', '1');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Valerii ', 'b1t', 'Vakhovskyi', '2003-01-05', '2');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Ilya ', 'Perfecto', 'Zalutskiy', '1999-11-24', '1');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Viktor', 'sdy', 'Orudzhev', '1997-03-14', '2');

INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('NaVi', '2009-12-17');

INSERT INTO `kiber`.`location` (`name_location`) VALUES ('Copenhagen,Danish');

INSERT INTO `kiber`.`organization` (`id`, `Name`, `Location`) VALUES ('1', 'BLAST ', '1');

INSERT INTO `kiber`.`speciality` (`Name`) VALUES ('Comentator');

INSERT INTO `kiber`.`commentary_staff` (`Name`, `Surname`, `Speciality`, `passport_details`) VALUES ('Manuel', 'Zeindler', '1', '1234567890');

INSERT INTO `kiber`.` discipline` (`Name`) VALUES ('CS.GO');
INSERT INTO `kiber`.` discipline` (`Name`) VALUES ('Dota 2');

INSERT INTO `kiber`.`tournament` (`Discipline`, `Location`, `date_of_beginning`, `End_date`, `Organization`, `Count_team`, `exit_game`) VALUES ('1', '1', '2022-12-14', '2022-12-18', '1', '0', '0');


INSERT INTO `kiber`.` tournament_teams` (`Team`, `Tournament`) VALUES ('1', '1');
INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Denmark');

INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Casper', 'cadiaN', 'Møller', '1995-06-26', '3');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('René', 'TeSeS', 'Madsen', '2000-12-12', '3');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Rasmus', 'sjuush', 'Beck', '1999-01-03', '3');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Jakob', 'Jabbi', 'Nygaard', '2003-06-23', '3');
INSERT INTO `kiber`.`players` (`Name`, `Nickname`, `Surname`, `Date_of_Birth`, `Country`) VALUES ('Kristian', 'k0nfig', 'Wienecke', '1997-04-19', '3');

INSERT INTO `kiber`.`speciality` (`Name`) VALUES ('Analysts');
INSERT INTO `kiber`.`speciality` (`Name`) VALUES ('Observers');
UPDATE `kiber`.`speciality` SET `Name` = 'Commentators' WHERE (`id_Speciality` = '1');
INSERT INTO `kiber`.`speciality` (`Name`) VALUES ('Desk Host');
INSERT INTO `kiber`.`speciality` (`Name`) VALUES ('Interviewers');

ALTER TABLE `kiber`.`commentary_staff` 
DROP COLUMN `passport_details`,
ADD COLUMN `Nickname` VARCHAR(45) NOT NULL AFTER `Speciality`,
ADD UNIQUE INDEX `Nickname_UNIQUE` (`Nickname` ASC) VISIBLE,
DROP INDEX `passport_details` ;
;

ALTER TABLE `kiber`.` play_in_a_match` 
RENAME TO  `kiber`.`play_in_a_match` ;

ALTER TABLE `kiber`.` discipline` 
RENAME TO  `kiber`.`discipline` ;

ALTER TABLE `kiber`.` tournament_teams` 
RENAME TO  `kiber`.`tournament_teams` ;
INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('FaZe Clan', '2016-01-20');
INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('Outsiders', '2022-03-04');
INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('Team Vitality', '2018-10-08');
INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('G2 Esports', '2015-02-11');
INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('OG', '2019-12-04');
INSERT INTO `kiber`.`team` (`Name`, `date_of_creation`) VALUES ('Team Liquid', '2015-01-13');

INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Norway');
INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Latvia');
INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Canada');
INSERT INTO `kiber`.`country` (`The_name_of_the_country`) VALUES ('Estonia');



-- create trigger plus_Turnier_team 
-- after INSERT 
-- ON tournament_teams FOR EACH ROW 
-- declare Tournament ; 
-- BEGIN  

-- SELECT  @Tournament := (select Tournament from inserted)
-- update tournament set
-- Count_team = 1+Count_team where id_Tournament = @Tournament
-- END ;
-- CREATE TRIGGER `plus_Turnier_team ` AFTER INSERT 
-- ON `tournament_teams` FOR EACH ROW BEGIN 
-- 	DECLARE Tournament INT UNSIGNED DEFAULT 0;
-- 	CALL GET_OR_CREATE_ACTIVITY_SPHERE('GROUP', @SPHERE_ID);
-- 	CALL
-- 	    Create_Activity(
-- 	        NEW.`ROOM_ID`,
-- 	        NEW.`CREATOR_ID`,
-- 	        @SPHERE_ID,
-- 	        'Create'
-- 	    );
-- 	END // 


-- DELIMITER ;
DROP TRIGGER IF EXISTS `plus_Turnier_team`;
DELIMITER //

CREATE TRIGGER `plus_Turnier_team` AFTER INSERT 
ON ` tournament_teams` FOR EACH ROW BEGIN 
	DECLARE Tournament INT UNSIGNED;
    Set  @Tournament = new.Tournament;
 update tournament set
 Count_team = 1+Count_team where id_Tournament = @Tournament;
	END // 


DELIMITER ;

DROP TRIGGER IF EXISTS `change_info_matсh`;
DELIMITER //

CREATE TRIGGER `change_info_matсh` before INSERT 
ON `match` FOR EACH ROW BEGIN 
    DECLARE Tournament INT UNSIGNED;
    Set  @Tournament = new.Tournament;
    IF ((select tournament.exit_game from tournament
     where id_Tournament= @Tournament )=1 )THEN
	   insert into math(Tournament) values (@Tournament);	
end if; 
	END // 


DELIMITER ;

DROP TRIGGER IF EXISTS `change_info_workers`;
DELIMITER //

CREATE TRIGGER `change_info_workers` before INSERT 
ON `workers_in_the_tournament` FOR EACH ROW BEGIN 
    DECLARE Tournament INT UNSIGNED;
    DECLARE employee INT UNSIGNED;
    Set  @Tournament = new.Tournament;
    Set  @employee = new.employee;
    IF ((select tournament.exit_game from tournament
     where id_Tournament= @Tournament )=1 )THEN
	   insert into workers_in_the_tournamen(Tournament,employee) values (@Tournament,@employee);	
end if; 
	END // 


DELIMITER ;

DROP TRIGGER IF EXISTS `change_info_team`;
DELIMITER //

CREATE TRIGGER `change_info_team` before INSERT 
ON `tournament_teams` FOR EACH ROW BEGIN 
    DECLARE Tournament INT UNSIGNED;
    DECLARE Team INT UNSIGNED;
    Set  @Tournament = new.Tournament;
    Set  @Team = new.Team;
    IF ((select tournament.exit_game from tournament
     where id_Tournament= @Tournament )=1 )THEN
	   insert into tournament_team(Tournament,Team) values (@Tournament,@Team);	
end if; 
	END // 


DELIMITER ;

DROP TRIGGER IF EXISTS `change_info_result`;
DELIMITER //

CREATE TRIGGER `change_info_result` before INSERT 
ON `result` FOR EACH ROW BEGIN 
    DECLARE math INT UNSIGNED;
    DECLARE Team INT UNSIGNED;
    DECLARE win INT UNSIGNED;
    Set  @math = new.`Match`;
    Set  @Team = new.Team;
    Set  @win = new.win;
    IF ((select tournament.exit_game  from tournament,`match` 
		where `match`.Tournament = tournament.id_Tournament 
		and id_Match= @math group by id_Tournament )=1 )THEN
	   insert into result(`Match`,Team,win) values (@math,@Team,@win);	
end if; 
	END // 

DELIMITER ;

DROP TRIGGER IF EXISTS `change_info_math_team`;
DELIMITER //

CREATE TRIGGER `change_info_math_team` before INSERT 
ON `team_in_math` FOR EACH ROW BEGIN 
    DECLARE math INT UNSIGNED;
    DECLARE Team INT UNSIGNED;
    Set  @math = new.`Match`;
    Set  @Team = new.Team;
    IF ((select tournament.exit_game  from tournament,`match` 
		where `match`.Tournament = tournament.id_Tournament 
		and `Match`= @math group by id_Tournament )=1 )THEN
	   insert into team_in_math(`Match`,Team) values (@math,@Team);	
end if; 
	END // 

DELIMITER ;

DROP TRIGGER IF EXISTS `add_end_date`;
DELIMITER //

CREATE TRIGGER `add_end_date` AFTER update 
ON `tournament` FOR EACH ROW BEGIN 
	DECLARE Tournament INT UNSIGNED;
    Set  @Tournament = new.id_Tournament;
    if (new.exit_game = 1)
    then
	update tournament set
 End_date = now()  where id_Tournament = @Tournament;
end if;
	END // 


DELIMITER ;




DROP PROCEDURE If EXISTS `close_tournament`;

DELIMITER //

CREATE PROCEDURE `close_tournament`(
IN `id_Tournament` INT UNSIGNED)
BEGIN 
	UPDATE `kiber`.`tournament` SET  End_date = now() WHERE (`id_Tournament` = 1);
    UPDATE `kiber`.`tournament` SET `exit_game` = '1'  WHERE (`id_Tournament` = '1');

	END // 
DELIMITER ;

-- 2022-12-18 00:00:00
SET SQL_SAFE_UPDATES = 0;
Call close_tournament(1);

select tournament.name,discipline.Name as discipline,
date_of_beginning,End_date,Count_team,organization.Name as organisation, 
venue.Name , town.name , country.The_name_of_the_country 
from tournament, discipline,organization,venue,town,country
where discipline.id = tournament.Discipline 
and organization.id =tournament.Organization 
and tournament.Venue = venue.id_venue and venue.Town = town.id_town and town.country =country.id_country;

DROP PROCEDURE If EXISTS `AVG_AGE`;

DELIMITER //

CREATE PROCEDURE `AVG_AGE`(
IN `Countriy` varchar(30))
BEGIN 
select AVG(YEAR(now()) - YEAR(Date_of_Birth))  as age from players,country 
where Country = country.id_country and country.The_name_of_the_country = `Countriy`;
	END // 
DELIMITER ;

-- 2022-12-18 00:00:00
SET SQL_SAFE_UPDATES = 0;
Call AVG_AGE('Denmark');


DROP PROCEDURE If EXISTS `AVG_AGE_team`;

DELIMITER //

CREATE PROCEDURE `AVG_AGE_team`(
IN `Team` varchar(30))
BEGIN 
select AVG(YEAR(now()) - YEAR(Date_of_Birth))  as age from players,team,team_players
where team_players.Player=players.id_Players and  team_players.Team = team.id_Team  and
team.Name  = `Team`;
	END // 
DELIMITER ;

-- 2022-12-18 00:00:00
SET SQL_SAFE_UPDATES = 0;
Call AVG_AGE_team('NaVi');



DROP PROCEDURE If EXISTS `show_match`;

DELIMITER //

CREATE PROCEDURE `show_match`(
IN `tournament` varchar(45))
BEGIN 
select `Match`,team.Name, win from result, team, tournament, `match`
where `match`.Tournament = tournament.id_Tournament  and result.Match = `match`.id_Match 
and result.Team = team.id_Team and tournament.name = `tournament`;
	END // 
DELIMITER ;

-- 2022-12-18 00:00:00
SET SQL_SAFE_UPDATES = 0;
Call show_match("BLAST Premier: World Final 2022");