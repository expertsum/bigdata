files = load '/user/horton/flightdelays/flight_delays?.csv' using PigStorage(',') as (Year, Month, DayofMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime, CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime,
ArrDelay, DepDelay, Origin, Dest, Distance, TaxiIn, TaxiOut, Cancelled, 
CancellationCode, Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
LateAircraftDelay);

filtered = filter files by DepTime != 'NA';

selected_cols = foreach filtered generate Year, Month, DayofMonth, DepTime, UniqueCarrier, FlightNum, ArrDelay, Origin, Dest;

store selected_cols into '/user/horton/flightdelays_clean' using PigStorage(',');

