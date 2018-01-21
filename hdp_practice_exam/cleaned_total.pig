flightdelays = load '/user/horton/flightdelays_clean' using PigStorage(',');

group_all = group flightdelays all;

total_count = foreach group_all generate COUNT(flightdelays);

store total_count into '/user/horton/cleaned_total';

