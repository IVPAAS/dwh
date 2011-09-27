/*
SQLyog Community v8.3 
MySQL - 5.1.41-3ubuntu12.6 : Database - kalturadw
*********************************************************************
*/

USE `kalturadw`;

CREATE OR REPLACE VIEW `dwh_dim_entries_v` AS
SELECT 	`entry_id`, 
	`kshow_id`, 
	`kuser_id`, 
	`entry_name`, 
	`d`.`display` as `entry_type`, 
	`data`, 
	`thumbnail`, 
	`views`, 
	`votes`, 
	`comments`, 
	`favorites`, 
	`total_rank`, 
	`rank`, 
	`tags`, 
	`anonymous`, 
	`entry_status_id`, 
	`entry_media_source_id`, 
	`entry_source_id`, 
	`source_link`, 
	`entry_license_type_id`, 
	`credit`, 
	`length_in_msecs`, 
	`height`, 
	`width`, 
	`conversion_quality`, 
	`storage_size`, 
	`editor_type_id`, 
	`puser_id`, 
	`is_admin_content`, 
	`created_at`, 
	`created_date_id`, 
	`created_hour_id`, 
	`updated_at`, 
	`updated_date_id`, 
	`updated_hour_id`, 
	`partner_id`, 
	`display_in_search`, 
	`subp_id`, 
	`custom_data`, 
	`search_text`, 
	`screen_name`, 
	`site_url`, 
	`permissions`, 
	`group_id`, 
	`plays`, 
	`partner_data`, 
	`int_id`, 
	`indexed_custom_data_1`, 
	`description`, 
	`media_date`, 
	`admin_tags`, 
	`moderation_status`, 
	`moderation_count`, 
	`modified_at`, 
	`modified_date_id`, 
	`modified_hour_id`, 
	`dwh_creation_date`, 
	`dwh_update_date`, 
	`ri_ind`, 
	`access_control_id`, 
	`conversion_profile_id`, 
	`categories`, 
	`categories_ids`, 
	`search_text_discrete`, 
	`flavor_params_ids`, 
	`start_date`, 
	`start_date_id`, 
	`start_hour_id`, 
	`end_date`, 
	`end_date_id`, 
	`end_hour_id`
	 
	FROM 
	`kalturadw`.`dwh_dim_entries` e left outer join kalturadw.dwh_dim_entry_type_display_v d on (e.entry_type_id = d.entry_type_id and e.entry_media_type_id = d.entry_media_type_id);