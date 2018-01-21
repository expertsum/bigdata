-- pig -x local -useHCatalog solutions/task07.pig

data = load '/home/horton/datasets/flightdelays/sfo_weather.csv' using PigStorage(',') as (
	station_name:chararray, year:int, month:int, dayofmonth:int, precipitation:int, temperature_max:int, temperature_min:int
);

store data into 'sfo_weather' using org.apache.hive.hcatalog.pig.HCatStorer(); 
