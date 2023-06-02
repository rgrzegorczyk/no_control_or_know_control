--liquibase formatted sql
--changeset rafal:countries_comments runOnChange:false context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for countries_comments

   COMMENT ON COLUMN "RAFAL"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "RAFAL"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "RAFAL"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "RAFAL"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
