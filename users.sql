CREATE USER 'f1admin'@'%' IDENTIFIED BY 'root-password';
GRANT ALL PRIVILEGES ON Formula1DB.* TO 'f1admin'@'%';

CREATE USER 'f1employee'@'%' IDENTIFIED BY 'employee-password';
GRANT SELECT ON Formula1DB.* TO 'f1employee'@'%';
GRANT INSERT, UPDATE ON Formula1DB.* TO 'f1employee'@'%';

CREATE USER 'f1fan'@'%' IDENTIFIED BY 'fan-password';
GRANT SELECT ON Formula1DB.circuit TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.driver TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.team TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.season TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.company TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.`company-sponsors-team` TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.driver_lap TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.`driver-ranks-race` TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.race TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.weather TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.`team-competes-season` TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.drivers_with_teams TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.race_results TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.races_with_circuit_and_weather TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.season_standing TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.season_winner_drivers TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.season_winner_teams TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.sponsors_with_teams_count TO 'f1fan'@'%';
GRANT SELECT ON Formula1DB.teams_with_total_drivers_and_total_sponsors TO 'f1fan'@'%';
