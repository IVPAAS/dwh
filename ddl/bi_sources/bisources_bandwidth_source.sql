CREATE TABLE kalturadw_bisources.bisources_bandwidth_source
(`bandwidth_source_id` INT, `bandwidth_source_name` VARCHAR(50),
PRIMARY KEY(`bandwidth_source_id`));

INSERT INTO kalturadw_bisources.bisources_bandwidth_source VALUES (1, 'WWW'),(2, 'LLN'),(3,'LEVEL3'),(4,'akamai_vod_http'),(5, 'akamai_live_fms'),(6, 'akamai_vod_fms');
