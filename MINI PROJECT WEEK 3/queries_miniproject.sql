USE re_company_analysis;


#1.	The top 10 countries with most CO2 emissions (cumulative over the years) and interesting to know in 2000 and 2020 
SELECT c.country_name, SUM(r.co2_emissions) AS total_co2_emissions
FROM countries_analized AS  c
JOIN renewable_electricity_indicators AS r 
ON c.country_id = r.country_id
WHERE  r.year IN (2000, 2020)
GROUP BY  c.country_name
ORDER BY total_co2_emissions DESC
LIMIT 10;



#2.	The top 5 countries with greater energy consumption per person in kWh
SELECT c.country_name, SUM(r.primary_energy_consumption_per_capita_kwhperson) AS avg_energy_consumption
FROM countries_analized AS  c
JOIN renewable_electricity_indicators AS r 
ON c.country_id = r.country_id
GROUP BY c.country_name
ORDER BY avg_energy_consumption DESC
LIMIT 1000;

SELECT * FROM countries_analized;
SELECT country_id FROM renewable_electricity_indicators;
#3.	The top 5 countries with less energy consumption per person in kWh

SELECT c.country_name, AVG(r.primary_energy_consumption_per_capita_kwhperson) AS avg_energy_consumption
FROM countries_analized AS  c
JOIN renewable_electricity_indicators AS r 
ON c.country_id = r.country_id
GROUP BY c.country_name
ORDER BY avg_energy_consumption ASC
LIMIT 5;


SELECT c.country_name, SUM(r.primary_energy_consumption_per_capita_kwhperson) AS sum_energy_consumption
FROM countries_analized AS  c
JOIN renewable_electricity_indicators AS r 
ON c.country_id = r.country_id
GROUP BY c.country_name
ORDER BY sum_energy_consumption ASC
LIMIT 7;




#4.	The top 10 countries with less access to clean fuels for cooking

SELECT c.country_name, SUM(r.access_to_clean_fuels_for_cooking) AS avg_access_to_clean_fuels
FROM countries_analized AS  c
JOIN renewable_electricity_indicators AS r 
ON c.country_id = r.country_id
GROUP BY c.country_name 
ORDER BY avg_access_to_clean_fuels ASC
LIMIT 10;




