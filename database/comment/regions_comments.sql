--liquibase formatted sql
--changeset rafal:regions_comments runOnChange:false context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for regions_comments

   COMMENT ON COLUMN "RAFAL"."REGIONS"."REGION_ID" IS 'Primary key of regions table.';
   COMMENT ON COLUMN "RAFAL"."REGIONS"."REGION_NAME" IS 'Names of regions. Locations are in the countries of these regions.';
   COMMENT ON TABLE "RAFAL"."REGIONS"  IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';
