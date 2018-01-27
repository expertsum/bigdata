category = load '/root/bigdata/hdp_exam_objectives/data/category.csv' using PigStorage(',') as (category_id:int, name:chararray, last_update:datetime);

dump category;
