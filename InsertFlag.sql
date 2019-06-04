-------------------Inserting Flag--04.06.2019------------------
DELETE FROM Log.DimFlag
INSERT INTO Log.DimFlag(FlagId, FlagName)
SELECT DISTINCT res_flag, res_flag_f FROM Stage.CallTemp WHERE res_flag IS NOT NULL