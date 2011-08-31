SELECT *
FROM kalturadw_ds.cycles
WHERE  (STATUS IN ('GENERATED','PROCESSED','LOADED') AND insert_time < NOW() - INTERVAL 1 DAY)
 OR 
 (STATUS = 'RUNNING' AND run_time < NOW() - INTERVAL 2 HOUR)
 OR 
 (STATUS = 'TRANSFERING' AND transfer_time < NOW() - INTERVAL 2 HOUR)
 OR 
 STATUS NOT IN ('DONE', 'GENERATED', 'PROCESSED', 'LOADED', 'RUNNING', 'TRANSFERRING', 'DELETED', 'SPOOF_CYCLE')
