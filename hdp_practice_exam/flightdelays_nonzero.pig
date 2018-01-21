--pig -x tez -useHCatalog solutions/flightdelays_nonzero.pig

data = load 'flightdelays' using org.apache.hive.hcatalog.pig.HCatLoader();

filtered = filter data by arrdelay > 0;

sorted = order filtered by arrdelay desc parallel 3;
 
store sorted into '/user/horton/flightdelays_nonzero' using PigStorage(',');

