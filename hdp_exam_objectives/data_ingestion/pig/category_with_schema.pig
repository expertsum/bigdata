category = load '/root/bigdata/hdp_exam_objectives/data_ingestion/data/category.csv' using PigStorage(',') as (category_id:int, name:chararray, last_update:datetime);

dump category;
