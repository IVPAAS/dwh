ALTER TABLE kalturadw.dwh_fact_entry_sizes
DROP PRIMARY KEY,
ADD PRIMARY KEY (partner_id, entry_id, entry_size_date_id);