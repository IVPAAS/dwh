DELIMITER $$

USE `kalturadw`$$

DROP FUNCTION IF EXISTS `calc_partner_storage_data_last_month`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `calc_partner_monthly_storage`(p_month_id INT ,p_partner_id INT) RETURNS DECIMAL(19,4)
    DETERMINISTIC
BEGIN
	DECLARE avg_cont_aggr_storage DECIMAL(19,4);
	
	SELECT	SUM(continuous_aggr_storage)/DAY(LAST_DAY(continuous_partner_storage.date_id)) avg_continuous_aggr_storage_mb
	INTO avg_cont_aggr_storage
	FROM (		SELECT 	all_times.day_id date_id,
				IFNULL(IF(aggr_p.bandwidth_source_id = 1, aggr_p.aggr_storage_mb,
				(SELECT aggr_storage_mb FROM dwh_hourly_partner_usage inner_a_p 
				 WHERE 	inner_a_p.partner_id=p_partner_id AND 
					inner_a_p.date_id<all_times.day_id AND 
					inner_a_p.hour_id = 0 AND 
					inner_a_p.bandwidth_source_id = 1
					ORDER BY inner_a_p.date_id DESC LIMIT 1)), 0) continuous_aggr_storage
			FROM 	dwh_hourly_partner_usage aggr_p RIGHT JOIN
				dwh_dim_time all_times
				ON (all_times.day_id=aggr_p.date_id 
					AND aggr_p.bandwidth_source_id = 1 
					AND aggr_p.hour_id = 0 
					AND aggr_p.partner_id=p_partner_id)
			WHERE 	all_times.day_id BETWEEN 20081230 AND LAST_DAY(p_month_id*100+1)*1
		) continuous_partner_storage
	WHERE kalturadw.calc_month_id(continuous_partner_storage.date_id)=p_month_id
	GROUP BY kalturadw.calc_month_id(continuous_partner_storage.date_id);
	RETURN avg_cont_aggr_storage;
END$$

DELIMITER ;