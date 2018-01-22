sqoop import --connect jdbc:mysql://localhost/sakila --username root --password hadoop \
	     --query 'select film_id, release_year, language_id, length, rating, last_update from film where $CONDITIONS' \
	     --split-by 'release_year' -m 5 \
             --target-dir /user/maria_dev/sqoop/sakila/film --driver com.mysql.jdbc.Driver 
