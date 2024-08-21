SELECT
	SUM(REPLACE(Value,',','')) AS Total
FROM milk_production
WHERE Year = 2023;



SELECT
	REPLACE(Value, ',', '') as replaced,
	SUM(REPLACE(Value, ',', '')) as total
FROM coffee_production
WHERE Year = 2015;



SELECT 
	REPLACE(Value, ',', '') as replaced,
	(SUM(REPLACE(Value, ',', ''))) / (COUNT(Value)) AS Ave,
	AVG(Value)
FROM honey_production
WHERE Year = 2022;



SELECT
	sl.State,
	sl.State_ANSI
FROM state_lookup sl 
WHERE sl.State = "IOWA";



SELECT 
	Value,
	MAX(Value) as Highest
FROM yogurt_production yp 
Where Year = 2022;



SELECT 
	sl.State_ANSI
FROM ((state_lookup sl INNER JOIN honey_production hp
	ON sl.State_ANSI = hp.State_ANSI) INNER JOIN milk_production mp 
	ON sl.State_ANSI = mp.State_ANSI)
WHERE 
	hp.Year = 2022 AND 
	sl.State_ANSI = 35;
	


SELECT 
	SUM(yp.Value)
FROM yogurt_production yp 
WHERE yp."Year" = 2022 AND yp.State_ANSI IN (SELECT State_ANSI FROM cheese_production WHERE Year = 2022);
	


SELECT 	
	REPLACE(cp.Value, ',', '') AS Value,
	cp.Period,
	sl.State
FROM cheese_production cp INNER JOIN state_lookup sl 
	ON cp.State_ANSI = sl.State_ANSI 
WHERE 
	cp.Value > 100000000 AND 
	cp.Period = "APR" AND 
	cp.Year = 2023;

	
	
SELECT 
	SUM(REPLACE(Value, ',', '')) as Total
FROM coffee_production cp 
WHERE Year = 2011



SELECT 
	AVG(Value) as Average
FROM honey_production hp 
Where Year = 2022;



SELECT 
	State,
	State_ANSI
FROM state_lookup sl;



SELECT 
	sl.State,
	SUM(REPLACE(cp.Value,',','')) as Total
FROM state_lookup sl INNER JOIN cheese_production cp
	ON sl.State_ANSI = cp.State_ANSI
WHERE sl.State = "NEW JERSEY";



SELECT 
	REPLACE(yp.Value,',','') AS Total,
	sl.State
FROM yogurt_production yp INNER JOIN state_lookup sl 
	ON yp.State_ANSI = sl.State_ANSI 
WHERE yp.Year = 2022 AND 
	yp.State_ANSI IN
	(SELECT State_ANSI FROM cheese_production cp WHERE Year = 2023);
	


SELECT 
	sl.State
FROM state_lookup sl INNER JOIN milk_production mp on 
	sl.State_ANSI = mp.State_ANSI 
WHERE mp.Year = 2023 AND 
	mp.Value IS NULL;
	


SELECT 	
	cp.Value,
	cp.Period,
	sl.State
From cheese_production cp INNER JOIN state_lookup sl 
	ON cp.State_ANSI = sl.State_ANSI 
WHERE cp.Year = 2023 AND 
	cp.Period = "APR"
ORDER BY sl.State 



SELECT 
	cp.Value,
	cp.year
FROM coffee_production cp INNER JOIN honey_production hp 
	ON cp.State_ANSI = hp.State_ANSI 
WHERE cp.Year IN 
	(SELECT Year FROM honey_production WHERE Value > 1000000)
	