ALTER TABLE `etl_meta_sqoop_job_v1`
ADD COLUMN `source_db_short_names`  varchar(255) NOT NULL COMMENT '数据源DB,以,分割不同DB,简写方式' AFTER `source_db_names`;