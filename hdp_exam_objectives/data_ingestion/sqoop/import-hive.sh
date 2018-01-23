sqoop import --connect jdbc:mysql://localhost/sakila --username root --password hadoop --table film_actor \
	     --hive-import --driver com.mysql.jdbc.Driver
