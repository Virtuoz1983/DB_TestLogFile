---------------------Inserting Uri--04.06.2019----------------
DELETE FROM Log.DimUri
INSERT INTO [Log].DimUri
SELECT from_uri
FROM Stage.CallTemp
WHERE from_uri IS NOT NULL
UNION
SELECT to_uri
FROM Stage.CallTemp
WHERE to_uri IS NOT NULL