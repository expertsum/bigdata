film_actor = LOAD 'film_actor' USING org.apache.hive.hcatalog.pig.HCatLoader();

STORE film_actor INTO '/user/maria_dev/pig/sakila/film_actor' USING PigStorage(',');

fs -ls /user/maria_dev/pig/sakila/film_actor;
