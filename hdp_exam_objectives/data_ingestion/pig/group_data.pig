actor = LOAD '/user/maria_dev/sqoop/sakila/actor' USING PigStorage(',') AS (
		actor_id:int, first_name:chararray, last_name:chararray, last_update
	);

film_actor = LOAD 'film_actor' USING org.apache.hive.hcatalog.pig.HCatLoader();

joined = JOIN actor BY actor_id, film_actor BY actor_id;

grouped = GROUP joined BY (first_name, last_name);

counted = FOREACH grouped GENERATE group, COUNT(joined) AS film_count;

sorted = ORDER counted BY film_count DESC;

top100 = LIMIT sorted 100;

DUMP top100;
