-----------Inserting conditions--04.06.2019-----------------------
DELETE FROM Log.DimCondition
INSERT INTO [Log].DimCondition
SELECT DISTINCT cond_code, cond_code_f
FROM Stage.CallTemp
WHERE cond_code IS NOT NULL