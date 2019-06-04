--------------------Inserting Frl--04.06.2019----------------------------------
DELETE FROM Log.DimFrl
INSERT INTO [Log].DimFrl
SELECT DISTINCT frl, frl_f
FROM Stage.CallTemp
WHERE frl IS NOT NULL
ORDER BY frl ASC