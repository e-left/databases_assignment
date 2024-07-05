SELECT team_name, maximum_average_salary
FROM (
		SELECT team_name, AVG(salary) AS average_salary 
		FROM Formula1DB.drivers_with_teams
		GROUP BY team_name
) AS A
JOIN (
	SELECT MAX(average_salary) AS maximum_average_salary
		FROM (
			SELECT team_name, AVG(salary) AS average_salary 
			FROM Formula1DB.drivers_with_teams
			GROUP BY team_name
		) AS A
) AS T
ON A.average_salary=T.maximum_average_salary;