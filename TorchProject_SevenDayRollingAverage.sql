/**** The 7-day rolling average number of new cases per day for the last 30 days.							    ******/
/****																																								******/
/**** NOTE: 																																						******/
/****		- 'positiveIncrease' is cases (confirmed plus probable) calculated based on the previous day’s value.											     	******/																	 *****/
/****		- Because the data isn't current, and the most recent data is '2021-03-07', I used '2021-03-08' as "Today" . Normally I would use the function GETDATE()  ****/



 --7 day rolling average of new cases for last 30 days
 select date,
       sum(positiveIncrease) as TotalNewCases,
       avg(sum(positiveIncrease)) OVER(ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) as SevenDay_Rolling_Average 
into [TorchProject].[dbo].SevenDayRollingNewCases
from [TorchProject].[dbo].[AllStatesHistory]  
where date >= DATEADD(day, -30, CAST('2021-03-08' AS date)) 
group by date