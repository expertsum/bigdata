REGISTER /root/bigdata/hdp_exam_objectives/data_ingestion/pig/piggybank.jar

DEFINE LENGTH org.apache.pig.piggybank.evaluation.string.LENGTH;

category = LOAD '/root/bigdata/hdp_exam_objectives/data/category.csv'
		USING PigStorage(',') AS (category_id, name:chararray, last_update);

category_length = FOREACH category GENERATE category_id, name, LENGTH(name) AS name_length, last_update;

DUMP category_length;
