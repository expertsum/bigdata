sqoop import --connect jdbc:mysql://localhost/sakila --username root --password hadoop --table actor \
             --target-dir /user/maria_dev/sqoop/sakila/actor --driver com.mysql.jdbc.Driver 
