hive -f store_relation_into_hive.hive
pig -x tez -useHCatalog -f store_relation_into_hive.pig
