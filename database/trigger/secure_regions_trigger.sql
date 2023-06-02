
  CREATE OR REPLACE EDITIONABLE TRIGGER "RAFAL"."SECURE_REGIONS" 
before insert or update or delete on regions
begin
   null;
end secure_regions;

ALTER TRIGGER "RAFAL"."SECURE_REGIONS" DISABLE