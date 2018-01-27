category = LOAD 'sakila.category' USING org.apache.hive.hcatalog.pig.HCatLoader();

film_category = LOAD 'sakila.film_category' USING org.apache.hive.hcatalog.pig.HCatLoader();

joined = JOIN film_category BY category_id, category BY category_id USING 'replicated';

grouped = GROUP joined BY category::name;

count_by_category = FOREACH grouped GENERATE group AS category_name, COUNT(joined) as film_count;

sorted_result = ORDER count_by_category BY film_count DESC;

DUMP sorted_result;
