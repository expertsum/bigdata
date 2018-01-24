-- Load CSV files into HDFS
fs -rm /user/maria_dev/pig/sakila/*.csv;
fs -copyFromLocal /root/bigdata/hdp_exam_objectives/data_ingestion/data/category.csv /user/maria_dev/pig/sakila/category.csv;
fs -copyFromLocal /root/bigdata/hdp_exam_objectives/data_ingestion/data/film_category.csv /user/maria_dev/pig/sakila/film_category.csv;


-- Load the sakila.category table in Hive
category = LOAD '/user/maria_dev/pig/sakila/category.csv' USING PigStorage(',') AS (
		category_id:int, name:chararray, last_update:chararray
	   );

category_datetime = FOREACH category GENERATE category_id, name, ToDate(last_update) AS last_update;

STORE category_datetime INTO 'sakila.category' USING org.apache.hive.hcatalog.pig.HCatStorer();


-- Load the sakila.film_category table in Hive
film_category = LOAD '/user/maria_dev/pig/sakila/film_category.csv' USING PigStorage(',') AS (
                        film_id:int, category_id:int, last_update:chararray
                );

film_category_datetime = FOREACH film_category GENERATE category_id, film_id, ToDate(last_update) AS last_update;

STORE film_category_datetime INTO 'sakila.film_category' USING org.apache.hive.hcatalog.pig.HCatStorer();
