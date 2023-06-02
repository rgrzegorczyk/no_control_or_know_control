-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: controller.xml
-- Ran at: 02.06.2023, 15:42
-- Against: RAFAL@jdbc:oracle:thin:@rguat_low
-- Liquibase version: 4.19.0
-- *********************************************************************

-- Lock Database
UPDATE RAFAL.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'localhost (192.168.8.117)', LOCKGRANTED = SYSTIMESTAMP WHERE ID = 1 AND LOCKED = 0;

-- Changeset procedure/secure_dml_procedure.sql::secure_dml_procedure::rafal
-- Modified error message
CREATE OR REPLACE EDITIONABLE PROCEDURE "RAFAL"."SECURE_DML" 
is
begin
   if TO_CHAR(SYSDATE, 'HH24:MI') not between '08:00' and '18:00'
      or TO_CHAR(SYSDATE, 'DY') in ('SAT', 'SUN')
   then
      RAISE_APPLICATION_ERROR(-20205,
                              'ERROR.You may only make changes during normal office hours');
   end if;
end secure_dml;
/

UPDATE RAFAL.DATABASECHANGELOG SET COMMENTS = 'Modified error message', CONTEXTS = 'v1', DATEEXECUTED = SYSTIMESTAMP, DEPLOYMENT_ID = '5713343987', EXECTYPE = 'RERAN', LABELS = 'task-2', MD5SUM = '8:653c7bcaf40ceaa33c5b16715cb122a9', ORDEREXECUTED = 13 WHERE ID = 'secure_dml_procedure' AND AUTHOR = 'rafal' AND FILENAME = 'procedure/secure_dml_procedure.sql';

-- Release Database Lock
UPDATE RAFAL.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

