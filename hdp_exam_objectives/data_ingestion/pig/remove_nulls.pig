family = LOAD 'file:///root/bigdata/hdp_exam_objectives/data_ingestion/data/family.txt'
		USING PigStorage(',') AS (name:chararray, age:int);

filtered = FILTER family BY age IS NOT NULL;

DUMP filtered;
