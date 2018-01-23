category = load '/root/practice/pig/category.csv' using PigStorage(',') as (category_id:int, name:chararray, last_update:datetime);

dump category;
