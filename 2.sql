DROP TRIGGER IF EXISTS `plus_Turnier_team`;
DELIMITER //

CREATE TRIGGER `plus_Turnier_team` AFTER INSERT 
ON `tournament_teams` FOR EACH ROW BEGIN 
	DECLARE Tournament INT UNSIGNED;
    Set  @Tournament = new.Tournament;
 update tournament set
 Count_team = 1+Count_team where id_Tournament = @Tournament;
	END // 


DELIMITER ;
-- --------------------------------------------------------------------
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
-- ----------------------------------------------------------------------
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
-- ---------------------------------------------------------------------------
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
-- ------------------------------------------------------------------------

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
-- -----------------------------------------------------------------------

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
-- ----------------------------------------------------------------------
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
-- ----------------------------------------------------------------------------
DROP PROCEDURE If EXISTS `close_tournament`;

DELIMITER //

CREATE PROCEDURE `close_tournament`(
IN `id_Tournaments` INT UNSIGNED)
BEGIN 
	UPDATE `kiber`.`tournament` SET  End_date = now() WHERE (`id_Tournament` = `id_Tournaments`);
    UPDATE `kiber`.`tournament` SET `exit_game` = '1'  WHERE (`id_Tournament` = `id_Tournaments`);

	END // 
DELIMITER ;


SET SQL_SAFE_UPDATES = 0;
Call close_tournament(1);
--   ---------------------------------------------------------------------------------------------
select tournament.name,discipline.Name as discipline,
date_of_beginning,End_date,Count_team,organization.Name as organisation, 
venue.Name , town.name , country.The_name_of_the_country 
from tournament, discipline,organization,venue,town,country
where discipline.id = tournament.Discipline 
and organization.id =tournament.Organization 
and tournament.Venue = venue.id_venue and venue.Town = town.id_town and town.country =country.id_country;
-- -------------------------------------------------------------------------------------------------------
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
-- ----------------------------------------------------------------------------------------------------

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
-- -------------------------------------------------------------------------------
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

insert into  team_players (Player, Team,Date_of_membership) values (8, 33,'2021-01-01');



-- 2022-12-18 00:00:00
SET SQL_SAFE_UPDATES = 0;
Call show_match("BLAST Titans - Arenas");

-- -------------------------------------------------------------------------------------------------
DROP PROCEDURE If EXISTS `show_countrie`;
DELIMITER //
CREATE PROCEDURE `show_countrie`(
IN `tournament` varchar(45))
BEGIN 
select country.The_name_of_the_country , count(country.The_name_of_the_country)
from country,players,team_players,team,tournament_teams,tournament 
where tournament_teams.Tournament = tournament.id_Tournament 
and tournament_teams.Team = team.id_Team and team.id_Team = team_players.Team 
and team_players.Player = players.id_Players and players.Country = country.id_country 
and tournament.name = `tournament` group by(country.The_name_of_the_country);
	END // 
DELIMITER ;

-- 2022-12-18 00:00:00
SET SQL_SAFE_UPDATES = 0;
Call show_countrie("BLAST Titans - Arenas");

