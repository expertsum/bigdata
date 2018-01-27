film_actor = LOAD 'sakila.film_actor' USING org.apache.hive.hcatalog.pig.HCatLoader();

actors = FOREACH film_actor GENERATE actor_id;

distinct_actors = DISTINCT actors PARALLEL 10;

DUMP distinct_actors;;
