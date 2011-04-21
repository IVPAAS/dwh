DROP TABLE IF EXISTS `kalturadw`.`dwh_fact_fms_session_events_innodb`;
CREATE TABLE `kalturadw`.`dwh_fact_fms_session_events_innodb` (
  `file_id` INT(11) UNSIGNED NOT NULL,
  `event_type_id` TINYINT(3) UNSIGNED NOT NULL,
  `event_category_id` TINYINT(3) UNSIGNED NOT NULL,
  `event_time` DATETIME NOT NULL,
  `event_time_tz` VARCHAR(3) NOT NULL,
  `event_date_id` INT(11) NOT NULL,
  `event_hour_id` TINYINT(3) NOT NULL,
  `context` VARCHAR(100) DEFAULT NULL,
  `entry_id` VARCHAR(20) DEFAULT NULL,
  `partner_id` INT(10) DEFAULT NULL,
  `external_id` VARCHAR(50) DEFAULT NULL,
  `server_ip` INT(10) UNSIGNED DEFAULT NULL,
  `server_process_id` INT(10) UNSIGNED NOT NULL,
  `server_cpu_load` SMALLINT(5) UNSIGNED NOT NULL,
  `server_memory_load` SMALLINT(5) UNSIGNED NOT NULL,
  `adaptor_id` SMALLINT(5) UNSIGNED NOT NULL,
  `virtual_host_id` SMALLINT(5) UNSIGNED NOT NULL,
  `app_id` TINYINT(3) UNSIGNED NOT NULL,
  `app_instance_id` TINYINT(3) UNSIGNED NOT NULL,
  `duration_secs` INT(10) UNSIGNED NOT NULL,
  `status_id` SMALLINT(3) UNSIGNED DEFAULT NULL,
  `status_desc_id` TINYINT(3) UNSIGNED NOT NULL,
  `client_ip_str` VARCHAR(15) NOT NULL,
  `client_ip` INT(10) UNSIGNED NOT NULL,
  `client_country_id` INT(10) UNSIGNED DEFAULT '0',
  `client_location_id` INT(10) UNSIGNED DEFAULT '0',
  `client_protocol_id` TINYINT(3) UNSIGNED NOT NULL,
  `uri` VARCHAR(4000) NOT NULL,
  `uri_stem` VARCHAR(2000) DEFAULT NULL,
  `uri_query` VARCHAR(2000) DEFAULT NULL,
  `referrer` VARCHAR(4000) DEFAULT NULL,
  `user_agent` VARCHAR(2000) DEFAULT NULL,
  `session_id` VARCHAR(20) NOT NULL,
  `client_to_server_bytes` BIGINT(20) UNSIGNED NOT NULL,
  `server_to_client_bytes` BIGINT(20) UNSIGNED NOT NULL,
  `stream_name` VARCHAR(50) DEFAULT NULL,
  `stream_query` VARCHAR(50) DEFAULT NULL,
  `stream_file_name` VARCHAR(4000) DEFAULT NULL,
  `stream_type_id` TINYINT(3) UNSIGNED DEFAULT NULL,
  `stream_size_bytes` INT(11) DEFAULT NULL,
  `stream_length_secs` INT(11) DEFAULT NULL,
  `stream_position` INT(11) DEFAULT NULL,
  `client_to_server_stream_bytes` INT(10) UNSIGNED DEFAULT NULL,
  `server_to_client_stream_bytes` INT(10) UNSIGNED DEFAULT NULL,
  `server_to_client_qos_bytes` INT(10) UNSIGNED DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8
PARTITION BY RANGE (event_date_id)
(PARTITION p_20100131 VALUES LESS THAN (20100201) ENGINE = INNODB,
 PARTITION p_20100228 VALUES LESS THAN (20100301) ENGINE = INNODB,
 PARTITION p_20100331 VALUES LESS THAN (20100401) ENGINE = INNODB,
 PARTITION p_20100430 VALUES LESS THAN (20100501) ENGINE = INNODB,
 PARTITION p_20100531 VALUES LESS THAN (20100601) ENGINE = INNODB,
 PARTITION p_20100630 VALUES LESS THAN (20100701) ENGINE = INNODB,
 PARTITION p_20100731 VALUES LESS THAN (20100801) ENGINE = INNODB,
 PARTITION p_20100831 VALUES LESS THAN (20100901) ENGINE = INNODB,
 PARTITION p_20100930 VALUES LESS THAN (20101001) ENGINE = INNODB,
 PARTITION p_20101031 VALUES LESS THAN (20101101) ENGINE = INNODB,
 PARTITION p_20101130 VALUES LESS THAN (20101201) ENGINE = INNODB,
 PARTITION p_20101231 VALUES LESS THAN (20110101) ENGINE = INNODB,
 PARTITION p_20110101 VALUES LESS THAN (20110102) ENGINE = INNODB,
 PARTITION p_20110102 VALUES LESS THAN (20110103) ENGINE = INNODB,
 PARTITION p_20110103 VALUES LESS THAN (20110104) ENGINE = INNODB,
 PARTITION p_20110104 VALUES LESS THAN (20110105) ENGINE = INNODB,
 PARTITION p_20110105 VALUES LESS THAN (20110106) ENGINE = INNODB,
 PARTITION p_20110106 VALUES LESS THAN (20110107) ENGINE = INNODB,
 PARTITION p_20110107 VALUES LESS THAN (20110108) ENGINE = INNODB,
 PARTITION p_20110108 VALUES LESS THAN (20110109) ENGINE = INNODB,
 PARTITION p_20110109 VALUES LESS THAN (20110110) ENGINE = INNODB,
 PARTITION p_20110110 VALUES LESS THAN (20110111) ENGINE = INNODB,
 PARTITION p_20110111 VALUES LESS THAN (20110112) ENGINE = INNODB,
 PARTITION p_20110112 VALUES LESS THAN (20110113) ENGINE = INNODB,
 PARTITION p_20110113 VALUES LESS THAN (20110114) ENGINE = INNODB,
 PARTITION p_20110114 VALUES LESS THAN (20110115) ENGINE = INNODB,
 PARTITION p_20110115 VALUES LESS THAN (20110116) ENGINE = INNODB,
 PARTITION p_20110116 VALUES LESS THAN (20110117) ENGINE = INNODB,
 PARTITION p_20110117 VALUES LESS THAN (20110118) ENGINE = INNODB,
 PARTITION p_20110118 VALUES LESS THAN (20110119) ENGINE = INNODB,
 PARTITION p_20110119 VALUES LESS THAN (20110120) ENGINE = INNODB,
 PARTITION p_20110120 VALUES LESS THAN (20110121) ENGINE = INNODB,
 PARTITION p_20110121 VALUES LESS THAN (20110122) ENGINE = INNODB,
 PARTITION p_20110122 VALUES LESS THAN (20110123) ENGINE = INNODB,
 PARTITION p_20110123 VALUES LESS THAN (20110124) ENGINE = INNODB,
 PARTITION p_20110124 VALUES LESS THAN (20110125) ENGINE = INNODB,
 PARTITION p_20110125 VALUES LESS THAN (20110126) ENGINE = INNODB,
 PARTITION p_20110126 VALUES LESS THAN (20110127) ENGINE = INNODB,
 PARTITION p_20110127 VALUES LESS THAN (20110128) ENGINE = INNODB,
 PARTITION p_20110128 VALUES LESS THAN (20110129) ENGINE = INNODB,
 PARTITION p_20110129 VALUES LESS THAN (20110130) ENGINE = INNODB,
 PARTITION p_20110130 VALUES LESS THAN (20110131) ENGINE = INNODB,
 PARTITION p_20110131 VALUES LESS THAN (20110201) ENGINE = INNODB,
 PARTITION p_20110201 VALUES LESS THAN (20110202) ENGINE = INNODB,
 PARTITION p_20110202 VALUES LESS THAN (20110203) ENGINE = INNODB,
 PARTITION p_20110203 VALUES LESS THAN (20110204) ENGINE = INNODB,
 PARTITION p_20110204 VALUES LESS THAN (20110205) ENGINE = INNODB,
 PARTITION p_20110205 VALUES LESS THAN (20110206) ENGINE = INNODB,
 PARTITION p_20110206 VALUES LESS THAN (20110207) ENGINE = INNODB,
 PARTITION p_20110207 VALUES LESS THAN (20110208) ENGINE = INNODB,
 PARTITION p_20110208 VALUES LESS THAN (20110209) ENGINE = INNODB,
 PARTITION p_20110209 VALUES LESS THAN (20110210) ENGINE = INNODB,
 PARTITION p_20110211 VALUES LESS THAN (20110212) ENGINE = INNODB,
 PARTITION p_20110212 VALUES LESS THAN (20110213) ENGINE = INNODB,
 PARTITION p_20110213 VALUES LESS THAN (20110214) ENGINE = INNODB,
 PARTITION p_20110214 VALUES LESS THAN (20110215) ENGINE = INNODB,
 PARTITION p_20110215 VALUES LESS THAN (20110216) ENGINE = INNODB,
 PARTITION p_20110216 VALUES LESS THAN (20110217) ENGINE = INNODB,
 PARTITION p_20110217 VALUES LESS THAN (20110218) ENGINE = INNODB,
 PARTITION p_20110218 VALUES LESS THAN (20110219) ENGINE = INNODB,
 PARTITION p_20110219 VALUES LESS THAN (20110220) ENGINE = INNODB,
 PARTITION p_20110220 VALUES LESS THAN (20110221) ENGINE = INNODB,
 PARTITION p_20110221 VALUES LESS THAN (20110222) ENGINE = INNODB,
 PARTITION p_20110222 VALUES LESS THAN (20110223) ENGINE = INNODB,
 PARTITION p_20110223 VALUES LESS THAN (20110224) ENGINE = INNODB,
 PARTITION p_20110224 VALUES LESS THAN (20110225) ENGINE = INNODB,
 PARTITION p_20110225 VALUES LESS THAN (20110226) ENGINE = INNODB,
 PARTITION p_20110226 VALUES LESS THAN (20110227) ENGINE = INNODB,
 PARTITION p_20110227 VALUES LESS THAN (20110228) ENGINE = INNODB,
 PARTITION p_20110228 VALUES LESS THAN (20110301) ENGINE = INNODB,
 PARTITION p_20110301 VALUES LESS THAN (20110302) ENGINE = INNODB,
 PARTITION p_20110302 VALUES LESS THAN (20110303) ENGINE = INNODB,
 PARTITION p_20110303 VALUES LESS THAN (20110304) ENGINE = INNODB,
 PARTITION p_20110304 VALUES LESS THAN (20110305) ENGINE = INNODB,
 PARTITION p_20110305 VALUES LESS THAN (20110306) ENGINE = INNODB,
 PARTITION p_20110306 VALUES LESS THAN (20110307) ENGINE = INNODB,
 PARTITION p_20110307 VALUES LESS THAN (20110308) ENGINE = INNODB,
 PARTITION p_20110308 VALUES LESS THAN (20110309) ENGINE = INNODB,
 PARTITION p_20110309 VALUES LESS THAN (20110310) ENGINE = INNODB,
 PARTITION p_20110310 VALUES LESS THAN (20110311) ENGINE = INNODB,
 PARTITION p_20110311 VALUES LESS THAN (20110312) ENGINE = INNODB,
 PARTITION p_20110312 VALUES LESS THAN (20110313) ENGINE = INNODB,
 PARTITION p_20110313 VALUES LESS THAN (20110314) ENGINE = INNODB,
 PARTITION p_20110314 VALUES LESS THAN (20110315) ENGINE = INNODB,
 PARTITION p_20110315 VALUES LESS THAN (20110316) ENGINE = INNODB,
 PARTITION p_20110316 VALUES LESS THAN (20110317) ENGINE = INNODB,
 PARTITION p_20110317 VALUES LESS THAN (20110318) ENGINE = INNODB,
 PARTITION p_20110318 VALUES LESS THAN (20110319) ENGINE = INNODB,
 PARTITION p_20110319 VALUES LESS THAN (20110320) ENGINE = INNODB,
 PARTITION p_20110320 VALUES LESS THAN (20110321) ENGINE = INNODB,
 PARTITION p_20110321 VALUES LESS THAN (20110322) ENGINE = INNODB,
 PARTITION p_20110322 VALUES LESS THAN (20110323) ENGINE = INNODB,
 PARTITION p_20110323 VALUES LESS THAN (20110324) ENGINE = INNODB,
 PARTITION p_20110324 VALUES LESS THAN (20110325) ENGINE = INNODB,
 PARTITION p_20110325 VALUES LESS THAN (20110326) ENGINE = INNODB,
 PARTITION p_20110326 VALUES LESS THAN (20110327) ENGINE = INNODB,
 PARTITION p_20110327 VALUES LESS THAN (20110328) ENGINE = INNODB,
 PARTITION p_20110328 VALUES LESS THAN (20110329) ENGINE = INNODB,
 PARTITION p_20110329 VALUES LESS THAN (20110330) ENGINE = INNODB,
 PARTITION p_20110330 VALUES LESS THAN (20110331) ENGINE = INNODB,
 PARTITION p_20110331 VALUES LESS THAN (20110401) ENGINE = INNODB,
 PARTITION p_20110401 VALUES LESS THAN (20110402) ENGINE = INNODB,
 PARTITION p_20110402 VALUES LESS THAN (20110403) ENGINE = INNODB,
 PARTITION p_20110403 VALUES LESS THAN (20110404) ENGINE = INNODB,
 PARTITION p_20110404 VALUES LESS THAN (20110405) ENGINE = INNODB,
 PARTITION p_20110405 VALUES LESS THAN (20110406) ENGINE = INNODB,
 PARTITION p_20110406 VALUES LESS THAN (20110407) ENGINE = INNODB,
 PARTITION p_20110407 VALUES LESS THAN (20110408) ENGINE = INNODB,
 PARTITION p_20110408 VALUES LESS THAN (20110409) ENGINE = INNODB,
 PARTITION p_20110409 VALUES LESS THAN (20110410) ENGINE = INNODB,
 PARTITION p_20110410 VALUES LESS THAN (20110411) ENGINE = INNODB,
 PARTITION p_20110411 VALUES LESS THAN (20110412) ENGINE = INNODB,
 PARTITION p_20110412 VALUES LESS THAN (20110413) ENGINE = INNODB,
 PARTITION p_20110413 VALUES LESS THAN (20110414) ENGINE = INNODB,
 PARTITION p_20110414 VALUES LESS THAN (20110415) ENGINE = INNODB,
 PARTITION p_20110415 VALUES LESS THAN (20110416) ENGINE = INNODB,
 PARTITION p_20110416 VALUES LESS THAN (20110417) ENGINE = INNODB,
 PARTITION p_20110417 VALUES LESS THAN (20110418) ENGINE = INNODB,
 PARTITION p_20110418 VALUES LESS THAN (20110419) ENGINE = INNODB,
 PARTITION p_20110419 VALUES LESS THAN (20110420) ENGINE = INNODB,
 PARTITION p_20110420 VALUES LESS THAN (20110421) ENGINE = INNODB);
