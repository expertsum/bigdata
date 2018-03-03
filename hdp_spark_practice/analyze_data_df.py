import pyspark.sql.types as t
from pyspark.sql import SparkSession

spark = SparkSession \
	.builder \
	.appName('Analyze data DF') \
	.getOrCreate()

input_file = 'hdfs:///user/maria_dev/flights/flightdelays_clean_df'
total_output_file = 'hdfs:///user/maria_dev/flights/flightdelays_cleaned_total_df'
denver_output_file = 'hdfs:///user/maria_dev/flights/flightdelays_cleaned_denver_df'
denver_late_output_file = 'hdfs:///user/maria_dev/flights/flightdelays_cleaned_denver_late_df'

input_struct = t.StructType([
	t.StructField('Year', t.IntegerType(), True),
	t.StructField('Month', t.IntegerType(), True),
	t.StructField('DayofMonth', t.IntegerType(), True),
	t.StructField('DepTime', t.IntegerType(), True),
	t.StructField('UniqueCarrier', t.StringType(), True),
	t.StructField('FlightNum', t.StringType(), True),
	t.StructField('ArrDelay', t.IntegerType(), True),
	t.StructField('Origin', t.StringType(), True),
	t.StructField('Dest', t.StringType(), True)])

flight_delays = spark.read.csv(input_file, sep=',', schema=input_struct)
flight_delays.persist()

def save_to_text(count_df, output_file):
	c = count_df.withColumn('count', count_df['count'].cast(t.StringType()))
	c.write.text(output_file)

c = flight_delays.groupBy().count()
save_to_text(c, total_output_file)

c = flight_delays.filter('Dest="DEN"').groupBy().count()
save_to_text(c, denver_output_file)

c = flight_delays \
	.filter('Dest="DEN" and ArrDelay>=60') \
	.groupBy() \
	.count()
save_to_text(c, denver_late_output_file)
