/******* Total number of tests for US Yesterday                                *******************************************************************************************************/
/****	 NOTE:	- Because the data isn't current, and the most recent data is '2021-03-07', I used '2021-03-08' as "Today" . Normally I would use the function GETDATE()         *****/
/****           - totalTestResults-  At the national level, this metric is a summary statistic which, because of the variation in test reporting methods, is at best an estimate *****/
/****             of US viral (PCR) testing. Some states/territories report tests in units of test encounters, some report tests in units of specimens, and some report tests in *****/
/****             units of unique people. Moreover, some jurisdictions include antigen tests in their total test counts without reporting a separate total of viral (PCR) tests. *****/
/****             Therefore, this value is an aggregate calculation of heterogeneous figures.                                                                                    *****/



SELECT SUM(totalTestResults) as TotalTestsUS
into [TorchProject].[dbo].TotalTestsUSYesterday
from [TorchProject].[dbo].[AllStatesHistory]  
where date <= DATEADD(day, -1, CAST('2021-03-08' AS date)) 
