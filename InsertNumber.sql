---------Inserting Number---04.06.2019---------
DELETE FROM Log.DimNumber
INSERT INTO [Log].DimNumber
SELECT DISTINCT calling_num
FROM Stage.CallTemp
WHERE calling_num IS NOT NULL
UNION
SELECT dialed_num
FROM Stage.CallTemp
WHERE dialed_num IS NOT NULL 