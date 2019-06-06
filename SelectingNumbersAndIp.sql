-- Outputing calls and ips ---------------------------------------
SELECT DimNumber.Number AS CallingNumber, DimIp.Ip AS CallingIp
FROM Stage.CallTemp
FULL JOIN Log.DimNumber ON DimNumber.Number = calling_num
FULL JOIN Log.DimIp ON DimIp.Ip = calling_ip

SELECT DimNumber.Number AS DialedNumber, DimIp.Ip AS DialedIp
FROM Stage.CallTemp
FULL JOIN Log.DimNumber ON DimNumber.Number = dialed_num
FULL JOIN Log.DimIp ON DimIp.Ip = dialed_ip
------------------------------------------------------------------