--liquibase formatted sql
--changeset rafal:secure_dml_procedure runOnChange:true endDelimiter:\n/ context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for secure_dml_procedure

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RAFAL"."SECURE_DML" 
is
begin
   if TO_CHAR(SYSDATE, 'HH24:MI') not between '08:00' and '18:00'
      or TO_CHAR(SYSDATE, 'DY') in ('SAT', 'SUN')
   then
      RAISE_APPLICATION_ERROR(-20205,
                              'You may only make changes during normal office hours');
   end if;
end secure_dml;

