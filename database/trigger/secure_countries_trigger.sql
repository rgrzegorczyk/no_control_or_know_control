
  CREATE OR REPLACE EDITIONABLE TRIGGER "RAFAL"."SECURE_COUNTRIES" 
before insert or update or delete on countries
begin
   secure_dml;
end secure_countries;

ALTER TRIGGER "RAFAL"."SECURE_COUNTRIES" DISABLE