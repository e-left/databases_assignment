SELECT id, name, first_name, last_name, city, country, team_id
FROM (
	SELECT *
	FROM Formula1DB.team
	JOIN (
		SELECT team_id, season_year
		FROM Formula1DB.`team-competes-season`
	) AS K
	ON team.id=K.team_id
) AS R
WHERE NOT EXISTS (
    SELECT 1
    FROM (
		SELECT DISTINCT(season_year)
		FROM Formula1DB.`team-competes-season`
		WHERE season_year>=2021
	) AS S
    WHERE S.season_year NOT IN (
        SELECT T.season_year
        FROM (
			SELECT *
			FROM Formula1DB.team
			JOIN (
				SELECT team_id, season_year
				FROM Formula1DB.`team-competes-season`
			) AS K
			ON team.id=K.team_id
		) AS T
        WHERE T.season_year = R.season_year
    )
);
