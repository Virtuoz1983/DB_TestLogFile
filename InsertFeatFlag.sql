-------------------Inserting FeatFlag--04.06.2019------------------

DELETE FROM Log.DimFeatFlag
INSERT INTO Log.DimFeatFlag(FeatFlagId)
SELECT DISTINCT feat_flag FROM Stage.CallTemp WHERE feat_flag IS NOT NULL
