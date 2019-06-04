-----------------Inserting Trk--04.06.2019---------------------
DELETE FROM Log.DimTrk
INSERT INTO Log.DimTrk
SELECT DISTINCT in_trk_code, in_trk_num, in_trk_name 
FROM Stage.CallTemp 
WHERE in_trk_num IS NOT NULL
UNION
SELECT DISTINCT code_used, out_trk_num, out_trk_name 
FROM Stage.CallTemp 
WHERE code_used IS NOT NULL