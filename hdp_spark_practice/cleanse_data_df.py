from pyspark.sql import SparkSession

spark = SparkSession \
	.builder \
	.appName('Cleanse data DF') \
	.master('local[*]') \
	.getOrCreate()

input_file = 'file:///root/bigdata/hdp_spark_practice/data/flightdelays.csv'
output_file = 'hdfs:///user/maria_dev/flights/flightdelays_clean'

flight_delays = spark.read.csv(input_file, header=True, inferSchema=True)
flight_delays \
	.filter('DepTime != "NA"') \
	.select('Year', 'Month', 'DayofMonth', 'DepTime', 'UniqueCarrier', 'FlightNum', 'ArrDelay', 'Origin', 'Dest') \
	.write.csv(output_file, mode='overwrite')
