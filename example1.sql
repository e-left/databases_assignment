SELECT race_number, year, date
FROM (
	SELECT * 
	FROM (
		SELECT * 
		FROM Formula1DB.team 
		WHERE name='Red Bull Racing'
	) AS K
	JOIN Formula1DB.`team-competes-season` 
	ON K.id=team_id
) AS T
JOIN Formula1DB.race
ON T.season_year=race.year;
