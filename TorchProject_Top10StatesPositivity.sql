/**** The Top 10 states with the highest test positivity rate (positive tests / tests performed) for tests performed in the last 30 days.							 *****/
/****																																								 *****/
/**** NOTE: 																																						 *****/
/****		- NULLS and Zeros are excluded																															 *****/
/****		- Because the data isn't current, and the most recent data is '2021-03-07', I used '2021-03-08' as "Today" . Normally I would use the function GETDATE() *****/
/****       - 'positiveTestsViral' is the total number of completed PCR tests (or specimens tested) that return positive as reported by the state or territory.      *****/
/****          If we discover that a jurisdiction is including antigen tests in this metric, we will annotate that state or territory’s data accordingly.            *****/
/****       - 'totalTestsViral is the Total number of PCR tests (or specimens tested) as reported by the state or territory. The count for this metric is incremented ****/
/****          up each time a specimen is tested and the result is reported. If we discover that a jurisdiction is including antigen tests in this metric, we will    ****/
/****          annotate that state or territory’s data accordingly. For states with ambiguous annotations, we have assigned their total tests to this category        ****/

select top 10 state, cast(sum(positiveTestsViral) as numeric)/cast(sum(totalTestsViral) as numeric)*100 as PositivityRate
into [TorchProject].[dbo].TenStateHighPositivity
from [TorchProject].[dbo].[AllStatesHistory]  
where date >= DATEADD(day, -30, CAST('2021-03-08' AS date)) 
group by state
order by PositivityRate desc,state