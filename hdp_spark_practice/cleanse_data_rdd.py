from pyspark import SparkContext, SparkConf

conf = SparkConf().setAppName('Cleanse data RDD').setMaster('local[*]')
sc = SparkContext(conf=conf)

input_file = 'file:///root/bigdata/hdp_spark_practice/data/flightdelays.csv'
output_file = 'hdfs:///user/maria_dev/flights/flightdelays_clean_rdd'

def find_indexes(items, selected):
	return [i[0] for i in enumerate(items) if i[1] in selected]

flight_delays = sc.textFile(input_file)

col_names = flight_delays.first().split(',')
sel_cols = ['Year', 'Month', 'DayofMonth', 'DepTime', 'UniqueCarrier',
			'FlightNum', 'ArrDelay', 'Origin', 'Dest']
sel_ix = find_indexes(col_names, sel_cols)

r = flight_delays \
	.map(lambda l: l.split(',')) \
	.map(lambda c: [c[i] for i in sel_ix]) \
	.filter(lambda fd: fd[0] != 'Year') \
	.filter(lambda fd: fd[3] != 'NA') \
	.map(lambda fd: ','.join(str(c) for c in fd)) \
	.saveAsTextFile(output_file)
