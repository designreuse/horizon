################### 数据库链接串配置 ###################
CREATE TABLE `etl_meta_db` (
  `db_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据库ID',
  `db_name` varchar(200) NOT NULL COMMENT '数据库别名',
  `database_name` varchar(200) NOT NULL DEFAULT '' COMMENT 'databases库名',
  `db_desc` varchar(300) NOT NULL COMMENT '数据库描述',
  `dialect` varchar(50) NOT NULL COMMENT '数据库方言',
  `db_url` varchar(300) NOT NULL COMMENT '数据库连接串',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `is_enable` tinyint(4) NOT NULL COMMENT '可用状态:0可用,1删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`db_id`),
  UNIQUE KEY `uni_db_name` (`db_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DB数据源元数据';

################### 数据仓库sqoop hive 作业配置表 ###################
CREATE TABLE `etl_meta_sqoop_job_v1` (
  `sqp_job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sqoop 作业ID',
  `sqp_job_name` varchar(200) NOT NULL COMMENT 'sqoop作业名称',
  `source_db_names` varchar(200) NOT NULL COMMENT '数据源DB,以,分割不同DB',
  `hive_db` varchar(200) NOT NULL COMMENT 'hive库',
  `hive_table_name` varchar(200) NOT NULL COMMENT 'hive表名',
  `sqp_command` varchar(6000) NOT NULL COMMENT 'sqoop命令',
  `hive_command` mediumtext NOT NULL COMMENT '需要执行的hive命令',
  `create_time` datetime NOT NULL COMMENT '记录创建日期',
  `update_time` datetime NOT NULL COMMENT '记录最后更新日期',
  PRIMARY KEY (`sqp_job_id`),
  UNIQUE KEY `uni_job_name` (`sqp_job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sqoop作业';

################### 数据仓库kettle export hive 作业配置表 ###################
CREATE TABLE `etl_meta_export_job_v1` (
  `export_job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'export 作业ID',
  `export_job_name` varchar(200) NOT NULL COMMENT 'export作业名称',
  `source_db_names` varchar(200) NOT NULL COMMENT '数据源DB,以,分割不同DB',
  `hive_db` varchar(200) NOT NULL COMMENT 'hive库',
  `hive_table_name` varchar(200) NOT NULL COMMENT 'hive表名',
  `query_sql` varchar(6000) NOT NULL COMMENT 'select命令',
  `hive_command` varchar(12000) NOT NULL COMMENT 'hive命令',
  `create_time` datetime NOT NULL COMMENT '记录创建日期',
  `update_time` datetime NOT NULL COMMENT '记录最后更新日期',
  PRIMARY KEY (`export_job_id`),
  UNIQUE KEY `uni_job_name` (`export_job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='export作业';
