--liquibase formatted sql
--changeset rafal:secure_regions_trigger runOnChange:true endDelimiter:\n/ context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for secure_regions_trigger

  CREATE OR REPLACE EDITIONABLE TRIGGER "RAFAL"."SECURE_REGIONS" 
before insert or update or delete on regions
begin
   null;
end secure_regions;

ALTER TRIGGER "RAFAL"."SECURE_REGIONS" DISABLE
