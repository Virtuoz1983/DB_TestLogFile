-----------Inserting Location--04.06.2019-------------------------
DELETE FROM Log.DimLocation
INSERT INTO Log.DimLocation
SELECT DISTINCT location_from, location_from_f 
FROM Stage.CallTemp
WHERE location_from IS NOT NULL
UNION
SELECT DISTINCT location_to, location_to_f
FROM Stage.CallTemp
WHERE location_to IS NOT NULL