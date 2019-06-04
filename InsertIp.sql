---------Inserting Ip--04.06.2019---------------
DELETE FROM Log.DimIp
INSERT INTO [Log].DimIp
SELECT DISTINCT calling_ip
FROM Stage.CallTemp
WHERE calling_ip IS NOT NULL
UNION
SELECT dialed_ip
FROM Stage.CallTemp
WHERE dialed_ip IS NOT NULL