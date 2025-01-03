CREATE EXTERNAL TABLE `data_pipeline_demo_enriched`(
  `message_id` bigint,
  `user_id` bigint,
  `user_is_bot` boolean,
  `user_first_name` string,
  `user_last_name` string,
  `user_username` string,
  `user_language_code` string,
  `chat_id` bigint,
  `chat_title` string,
  `chat_type` string,
  `chat_all_members_are_administrators` boolean,
  `text` string,
  `context_timestamp` string)
PARTITIONED BY (
  `context_date` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://data-pipeline-demo-enriched/'
