cd /root/bigdata/airline_online_performance/data

#wget http://stat-computing.org/dataexpo/2009/2003.csv.bz2
#wget http://stat-computing.org/dataexpo/2009/2004.csv.bz2
#wget http://stat-computing.org/dataexpo/2009/2005.csv.bz2
#wget http://stat-computing.org/dataexpo/2009/2006.csv.bz2
#wget http://stat-computing.org/dataexpo/2009/2007.csv.bz2
#wget http://stat-computing.org/dataexpo/2009/2008.csv.bz2
#wget http://stat-computing.org/dataexpo/2009/carriers.csv
#wget http://stat-computing.org/dataexpo/2009/plane-data.csv
#wget http://stat-computing.org/dataexpo/2009/airports.csv

#bzip2 -d 2003.csv.bz2
#bzip2 -d 2004.csv.bz2
#bzip2 -d 2005.csv.bz2
#bzip2 -d 2006.csv.bz2
#bzip2 -d 2007.csv.bz2
#bzip2 -d 2008.csv.bz2

hdfs dfs -mkdir -p /user/maria_dev/airline/flights
hdfs dfs -mkdir -p /user/maria_dev/airline/airports
hdfs dfs -mkdir -p /user/maria_dev/airline/carriers
hdfs dfs -mkdir -p /user/maria_dev/airline/plane_infos

hdfs dfs -moveFromLocal 2003.csv /user/maria_dev/airline/flights
hdfs dfs -moveFromLocal 2004.csv /user/maria_dev/airline/flights
hdfs dfs -moveFromLocal 2005.csv /user/maria_dev/airline/flights
hdfs dfs -moveFromLocal 2006.csv /user/maria_dev/airline/flights
hdfs dfs -moveFromLocal 2007.csv /user/maria_dev/airline/flights
hdfs dfs -moveFromLocal 2008.csv /user/maria_dev/airline/flights

hdfs dfs -moveFromLocal plane-data.csv /user/maria_dev/airline/plane_infos
hdfs dfs -moveFromLocal airports.csv /user/maria_dev/airline/airports
hdfs dfs -moveFromLocal carriers.csv /user/maria_dev/airline/carriers

