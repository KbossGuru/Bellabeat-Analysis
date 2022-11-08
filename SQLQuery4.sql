-----------------------------------------cleaning the dailyActivity table--------------------------------------------------

--Changing the datatype of activitydate to date
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_date DATE;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_date=CAST(ActivityDate AS DATE);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN ActivityDate;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_date', 'ActivityDate', 'COLUMN';

--changing the datatype of other columns 
--TotalSteps
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_totalsteps INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_totalsteps=CAST(TotalSteps AS INT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN TotalSteps;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_totalsteps', 'TotalSteps', 'COLUMN';

--TotalDistance
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_totaldistance FLOAT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_totaldistance=CAST(TotalDistance AS FLOAT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN TotalDistance;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_totaldistance', 'TotalDistance', 'COLUMN';

--VeryActiveMinutes
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_VeryActiveMinutes INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_VeryActiveMinutes=CAST(VeryActiveMinutes AS INT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN VeryActiveMinutes;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_VeryActiveMinutes', 'VeryActiveMinutes', 'COLUMN';

--FairlyActiveMinutes
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_FairlyActiveMinutes INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_FairlyActiveMinutes=CAST(FairlyActiveMinutes AS INT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN FairlyActiveMinutes;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_FairlyActiveMinutes', 'FairlyActiveMinutes', 'COLUMN';

--LightlyActiveMinutes
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_LightlyActiveMinutes INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_LightlyActiveMinutes=CAST(LightlyActiveMinutes AS INT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN LightlyActiveMinutes;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_LightlyActiveMinutes', 'LightlyActiveMinutes', 'COLUMN';

--SedentaryMinutes
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_SedentaryMinutes INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_SedentaryMinutes=CAST(SedentaryMinutes AS INT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN SedentaryMinutes;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_SedentaryMinutes', 'SedentaryMinutes', 'COLUMN';

--Calories
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD new_calories INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET new_calories=CAST(Calories AS INT);
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN Calories;
SP_RENAME 'Bellabeat.dbo.dailyActivity_merged.new_calories', 'Calories', 'COLUMN';


--create a new active minutes column aggregating the data in veryactiveminute, fairlyactiveminutes, LightlyActiveMinutes
ALTER TABLE Bellabeat.dbo.dailyActivity_merged ADD ActiveMinutes INT;
UPDATE Bellabeat.dbo.dailyActivity_merged SET ActiveMiNUTES = VeryACtiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes;

--Deleting redundant columns
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN LoggedActivitiesDistance;
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN VeryActiveDistance;
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN ModeratelyActiveDistance;
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN LightActiveDistance;
ALTER TABLE Bellabeat.dbo.dailyActivity_merged DROP COLUMN SedentaryActiveDistance;


----------------------------------------Cleaning the weightLogInfo table----------------------------------------------------

--changing the weightkg datatype
ALTER TABLE Bellabeat.dbo.weightLogInfo ADD new_weight FLOAT;
UPDATE Bellabeat.dbo.weightLogInfo SET new_weight = CAST(WeightKg AS FLOAT);
ALTER TABLE Bellabeat.dbo.weightLogInfo DROP COLUMN WeightKg;
SP_RENAME 'Bellabeat.dbo.weightLogInfo.new_weight', 'WeightKg', 'COLUMN';

--BMI Column 
ALTER TABLE Bellabeat.dbo.weightLogInfo ADD new_weight FLOAT;
UPDATE Bellabeat.dbo.weightLogInfo SET new_weight = CAST(BMI AS FLOAT);
ALTER TABLE Bellabeat.dbo.weightLogInfo DROP COLUMN BMI;
SP_RENAME 'Bellabeat.dbo.weightLogInfo.new_weight', 'BMI', 'COLUMN';

--changing the WeightPounds datatype
ALTER TABLE Bellabeat.dbo.weightLogInfo ADD new_weight FLOAT;
UPDATE Bellabeat.dbo.weightLogInfo SET new_weight = CAST(WeightPounds AS FLOAT);
ALTER TABLE Bellabeat.dbo.weightLogInfo DROP COLUMN WeightPounds;
SP_RENAME 'Bellabeat.dbo.weightLogInfo.new_weight', 'WeightPounds', 'COLUMN';

--changing the date datatype
ALTER TABLE Bellabeat.dbo.weightLogInfo ADD new_date DATETIME;
UPDATE Bellabeat.dbo.weightLogInfo SET new_date=CAST(Date AS DATETIME);
ALTER TABLE Bellabeat.dbo.weightLogInfo DROP COLUMN Date;
SP_RENAME 'Bellabeat.dbo.weightLogInfo.new_date', 'Date', 'COLUMN';


--------------------------------DataCleaning For The HeartRate Table---------------------------------------------

--Fixing the data types
--Value column
ALTER TABLE Bellabeat.dbo.heartrate_seconds ADD new_Values INT;
UPDATE Bellabeat.dbo.heartrate_seconds SET new_Values=CAST(Value AS INT);
ALTER TABLE Bellabeat.dbo.heartrate_seconds DROP COLUMN Value;
SP_RENAME 'Bellabeat.dbo.heartrate_seconds.new_Values', 'Value', 'COLUMN';

--Time Column
ALTER TABLE Bellabeat.dbo.heartrate_seconds ADD new_time DATETIME;
UPDATE Bellabeat.dbo.heartrate_seconds SET new_time=CAST(Time AS DATETIME);
ALTER TABLE Bellabeat.dbo.heartrate_seconds DROP COLUMN Time;
SP_RENAME 'Bellabeat.dbo.heartrate_seconds.new_time', 'Time', 'COLUMN';


-------------------------------------------------EXPLORATORY ANALYSIS---------------------------------------------------


--analyzing the daily activities table
--Checking the averages of some parameters
SELECT Id, AVG(Calories) AS avg_calories, AVG(TotalSteps) AS avg_steps, AVG(SedentaryMinutes) AS avg_inactive_minutes, AVG(ActiveMinutes) as avg_active_minutes 
FROM Bellabeat.dbo.dailyActivity_merged
GROUP BY Id;

--comparing the trend in calories per day
SELECT Id, ActivityDate, Calories 
FROM Bellabeat.dbo.dailyActivity_merged
GROUP BY ActivityDate, Id, Calories;

--Identifying trend in the average calories and total of individuals
SELECT  Id, AVG(Calories) as avg_calories, AVG(TotalDistance) as avg_distance
FROM Bellabeat.dbo.dailyActivity_merged
GROUP BY Id
ORDER BY avg_distance DESC;


--weightlog table

--checking the fat people in the weightlog table
SELECT Id, AVG(new_weight) AS fat
FROM Bellabeat.dbo.weightLogInfo
GROUP BY Id;

--finding number of weight entries
SELECT Id, IsManualReport FROM Bellabeat.dbo.weightLogInfo
GROUP BY Id, IsManualReport;

SELECT * FROM Bellabeat.dbo.heartrate_seconds;


--analyzing the heartrate table

--Finding the average heartbeat per second of each individual.
SELECT Id, AVG(Value) AS Avg_value
FROM Bellabeat.dbo.heartrate_seconds
GROUP BY Id;
