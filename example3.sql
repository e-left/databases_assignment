SELECT AVG(temperature) AS average_temperature, AVG(humidity) AS average_humidity 
FROM (
	SELECT year, name, temperature, humidity 
	FROM Formula1DB.races_with_circuit_and_weather
	WHERE year=2022
) AS R
GROUP BY name;
