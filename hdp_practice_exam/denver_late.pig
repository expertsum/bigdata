flightdelays = load '/user/horton/flightdelays_clean' using PigStorage(',') as (Year, Month, DayofMonth, DepTime, UniqueCarrier, FlightNum, ArrDelay:int, Origin, Dest);

denver_delays = filter flightdelays by Dest == 'DEN' and ArrDelay >= 60;

group_all = group denver_delays all;

total_count = foreach group_all generate COUNT(denver_delays);

store total_count into '/user/horton/denver_late';

