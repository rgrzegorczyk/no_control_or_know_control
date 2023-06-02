--liquibase formatted sql
--changeset rafal:secure_countries_trigger runOnChange:true endDelimiter:\n/ context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for secure_countries_trigger

  CREATE OR REPLACE EDITIONABLE TRIGGER "RAFAL"."SECURE_COUNTRIES" 
before insert or update or delete on countries
begin
   secure_dml;
end secure_countries;

ALTER TRIGGER "RAFAL"."SECURE_COUNTRIES" DISABLE
