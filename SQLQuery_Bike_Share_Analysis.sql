--- combining all files into one with Union---

SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 INTO TRIPDATA
 FROM [Cyclistic_BikeShare].[dbo].[202205-divvy-tripdata]
UNION ALL
SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202206-divvy-tripdata]
UNION ALL 
  SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202207-divvy-tripdata]
UNION ALL 
  SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202208-divvy-tripdata]
UNION ALL
  SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202209-divvy-publictripdata]
UNION ALL
SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202210-divvy-tripdata]
 UNION ALL
 SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202211-divvy-tripdata]
 UNION ALL
  SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202212-divvy-tripdata]
 UNION ALL
   SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202301-divvy-tripdata]
 UNION ALL
    SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202302-divvy-tripdata]
 UNION ALL
     SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202303-divvy-tripdata]
 UNION ALL
      SELECT [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[member_casual]
 FROM [Cyclistic_BikeShare].[dbo].[202304-divvy-tripdata]

  --- count num of rows---

 select count(ride_id) as num_of_rows_
 from TRIPDATA;

 ---checking for duplicates---


select ride_id, count(*) as DublicateValues
from TRIPDATA
Group by ride_id
Having Count(*)>1;



---- checking for completeness: null values----

select count(*) 
from TRIPDATA
where start_station_id is null; 


select count(*) 
from TRIPDATA
where end_station_id is null; 

select count(*) 
from TRIPDATA
where rideable_type is null; 

select count(*) 
from TRIPDATA
where started_at is null; 

select count(*) 
from TRIPDATA
where ended_at is null; 

select count(*) 
from TRIPDATA
where member_casual is null; 

---- checking for  consistency: extra spaces or mispellings----
select len(rideable_type) as num_of_letters
from TRIPDATA;

select len(member_casual) as num_of_letters
from TRIPDATA;

select rideable_type
from TRIPDATA 
WHERE LEN(rideable_type) > 13;

select distinct rideable_type from TRIPDATA
order by rideable_type;


---- changing the format of rideable_type to enhance  readability in the viz--- 
select case when rideable_type = 'classic_bike' then 'Classic Bike'
			when rideable_type = 'docked_bike' then 'Docked Bike'
			when rideable_type = 'electric_bike' then 'Electric Bike'
			end as rideable_type
from TRIPDATA; 

----- checking the spelling in start_station_name, and start_station_id attributes. The id containes letters.Normally is better to contain only numbers.---

select distinct top 10 start_station_name, start_station_id, end_station_name, end_station_id
from TRIPDATA

select distinct member_casual from TRIPDATA;

--- now I have to make an update in the TRIPDATA columns with the new changes and i am going to replace the nulls with zeros or Unknown. 

UPDATE TRIPDATA SET rideable_type = (case when rideable_type = 'classic_bike' then 'Classic Bike'
			when rideable_type = 'docked_bike' then 'Docked Bike'
			when rideable_type = 'electric_bike' then 'Electric Bike'
			end), start_station_name = ISNULL(start_station_name, 'Unknown'), end_station_name = ISNULL(end_station_name,'Unknown'),
			start_station_id = ISNULL(start_station_id, '0'), end_station_id = ISNULL(end_station_id, '0'),
			member_casual = TRIM(member_casual), started_at = TRIM(started_at), ended_at = TRIM(ended_at)
			

---checking if there are any inconsistencies between the start and end dates and ensure that no dates were flipped between the two different attributes---- 

UPDATE TRIPDATA SET started_at = (case when started_at > ended_at then ended_at else started_at end),
					ended_at =	 (case when ended_at > started_at then ended_at else started_at end)

--- now just run to see if all is ok 
select * from TRIPDATA; 

--- extracted date and time from the original timestamps and adding extra columns that will support the analysis later on---

ALTER TABLE TRIPDATA ADD started_at_date date;
ALTER TABLE TRIPDATA ADD started_at_time time;
ALTER TABLE TRIPDATA ADD started_at_day varchar(10);
ALTER TABLE TRIPDATA ADD started_at_month varchar(20); 
ALTER TABLE TRIPDATA ADD started_at_quarter varchar(2);

ALTER TABLE TRIPDATA ADD ended_at_date date;
ALTER TABLE TRIPDATA ADD ended_at_time time;
ALTER TABLE TRIPDATA ADD ended_at_day varchar(10);
ALTER TABLE TRIPDATA ADD ended_at_month varchar(20);
ALTER TABLE TRIPDATA ADD ended_at_quarter varchar(2);
ALTER TABLE TRIPDATA ADD ride_week_day varchar(15);

ALTER TABLE TRIPDATA ADD ride_season varchar(10);

ALTER TABLE TRIPDATA ADD ride_length int; 


--- fill in with data the above columns--- 

UPDATE TRIPDATA set started_at_date = CAST(started_at as DATE), 
                    ended_at_date = CAST(ended_at as DATE); 


UPDATE TRIPDATA set started_at_time = CAST(started_at as TIME), 
                    ended_at_time = CAST(ended_at as TIME); 

UPDATE TRIPDATA set started_at_day = DAY(started_at), 
                    ended_at_day = DAY(ended_at); 

UPDATE TRIPDATA set started_at_month = MONTH(started_at), 
                    ended_at_month = MONTH(ended_at); 

UPDATE TRIPDATA set started_at_quarter = 'Q'+ CAST(DATEPART(quarter, started_at) as varchar), 
                    ended_at_quarter = 'Q'+ CAST(DATEPART(quarter, ended_at) as varchar);

UPDATE TRIPDATA set ride_week_day = DATENAME(weekday, started_at);
                    
---assign seasons---

UPDATE TRIPDATA SET ride_season = case when started_at_month in (12,1,2) then 'winter'
									   when started_at_month in(3,4,5) then 'spring'
									   when started_at_month in (6,7,8) then 'summer'
									   else 'automn' end

UPDATE TRIPDATA SET ride_length = CASE WHEN DATEDIFF(minute, started_at_time, ended_at_time) > 0
                                  THEN DATEDIFF(minute, started_at_time, ended_at_time)
								  ELSE 1440 + DATEDIFF(minute, started_at_time, ended_at_time) end 


--- we have the problem of sorting the days correctly------

ALTER TABLE TRIPDATA ADD ride_week_day_id smallint;

UPDATE TRIPDATA SET ride_week_day_id = DATEPART(weekday, started_at_date)





