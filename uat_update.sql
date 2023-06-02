-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: controller.xml
-- Ran at: 02.06.2023, 15:26
-- Against: RAFAL@jdbc:oracle:thin:@rguat_low
-- Liquibase version: 4.19.0
-- *********************************************************************

-- Create Database Lock Table
CREATE TABLE RAFAL.DATABASECHANGELOGLOCK (ID INTEGER NOT NULL, LOCKED NUMBER(1) NOT NULL, LOCKGRANTED TIMESTAMP, LOCKEDBY VARCHAR2(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

-- Initialize Database Lock Table
DELETE FROM RAFAL.DATABASECHANGELOGLOCK;

INSERT INTO RAFAL.DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

-- Lock Database
UPDATE RAFAL.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'localhost (192.168.8.117)', LOCKGRANTED = SYSTIMESTAMP WHERE ID = 1 AND LOCKED = 0;

-- Create Database Change Log Table
CREATE TABLE RAFAL.DATABASECHANGELOG (ID VARCHAR2(255) NOT NULL, AUTHOR VARCHAR2(255) NOT NULL, FILENAME VARCHAR2(255) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR2(10) NOT NULL, MD5SUM VARCHAR2(35), DESCRIPTION VARCHAR2(255), COMMENTS VARCHAR2(255), TAG VARCHAR2(255), LIQUIBASE VARCHAR2(20), CONTEXTS VARCHAR2(255), LABELS VARCHAR2(255), DEPLOYMENT_ID VARCHAR2(10));

-- Changeset sequence/departments_seq_sequence.sql::departments_seq_sequence::rafal
-- Initial changeset for departments_seq_sequence
CREATE SEQUENCE "RAFAL"."DEPARTMENTS_SEQ" MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE NOORDER NOCYCLE NOSCALE;

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('departments_seq_sequence', 'rafal', 'sequence/departments_seq_sequence.sql', SYSTIMESTAMP, 1, '8:bcc540288cccd8b4a427e8eaac8ea99f', 'sql', 'Initial changeset for departments_seq_sequence', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset table/regions_table.sql::regions_table::rafal
-- Initial changeset for regions_table
CREATE TABLE "RAFAL"."REGIONS" 
   (	"REGION_ID" NUMBER CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE,
	"REGION_NAME" VARCHAR2(25),
	CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX
  PCTFREE 10 INITRANS 20 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA";

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('regions_table', 'rafal', 'table/regions_table.sql', SYSTIMESTAMP, 2, '8:354320f6bc1be8e2c73015d88c1596dd', 'sql', 'Initial changeset for regions_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset table/departments_table.sql::departments_table::rafal
-- Initial changeset for departments_table
CREATE TABLE "RAFAL"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0),
	"DEPARTMENT_NAME" VARCHAR2(30) CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE,
	"MANAGER_ID" NUMBER(6,0),
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION DEFERRED
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  TABLESPACE "DATA";

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('departments_table', 'rafal', 'table/departments_table.sql', SYSTIMESTAMP, 3, '8:dac97fa1cbf82e35426cae68960ac6c8', 'sql', 'Initial changeset for departments_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset table/application_params_table.sql::application_params_table::rafal
-- Initial changeset for application_params_table
CREATE TABLE "RAFAL"."APPLICATION_PARAMS" 
   (	"CODE" VARCHAR2(50),
	"VALUE" VARCHAR2(500)
   ) SEGMENT CREATION DEFERRED
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  TABLESPACE "DATA";

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('application_params_table', 'rafal', 'table/application_params_table.sql', SYSTIMESTAMP, 4, '8:f94a4bb81d6d69b7d24df342ec559b9b', 'sql', 'Initial changeset for application_params_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset procedure/secure_dml_procedure.sql::secure_dml_procedure::rafal
-- Initial changeset for secure_dml_procedure
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
/

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('secure_dml_procedure', 'rafal', 'procedure/secure_dml_procedure.sql', SYSTIMESTAMP, 5, '8:a8bb9833fc4677860f5e96cdd36ee240', 'sql', 'Initial changeset for secure_dml_procedure', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset table/countries_table.sql::countries_table::rafal
-- Initial changeset for countries_table
CREATE TABLE "RAFAL"."COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2) CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE,
	"COUNTRY_NAME" VARCHAR2(40),
	"REGION_ID" NUMBER,
	CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX
  PCTFREE 10 INITRANS 20 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE,
	CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	 REFERENCES "RAFAL"."REGIONS" ("REGION_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA";

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('countries_table', 'rafal', 'table/countries_table.sql', SYSTIMESTAMP, 6, '8:c9e46bb6ed0f4ac6c9305b715e254ca9', 'sql', 'Initial changeset for countries_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset table/locations_table.sql::locations_table::rafal
-- Initial changeset for locations_table
CREATE TABLE "RAFAL"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0),
	"STREET_ADDRESS" VARCHAR2(40 CHAR),
	"POSTAL_CODE" VARCHAR2(12 CHAR),
	"CITY" VARCHAR2(30 CHAR) CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE,
	"STATE_PROVINCE" VARCHAR2(25 CHAR),
	"COUNTRY_ID" CHAR(2 CHAR),
	CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX
  PCTFREE 10 INITRANS 20 MAXTRANS 255 LOGGING
  TABLESPACE "DATA"  ENABLE,
	CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	 REFERENCES "RAFAL"."COUNTRIES" ("COUNTRY_ID") ENABLE
   ) SEGMENT CREATION DEFERRED
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  TABLESPACE "DATA";

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('locations_table', 'rafal', 'table/locations_table.sql', SYSTIMESTAMP, 7, '8:9eebc3c8cfe2590b163fe85d41700dee', 'sql', 'Initial changeset for locations_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset view/emp_details_view_view.sql::emp_details_view_view::rafal
-- Initial changeset for emp_details_view_view
CREATE OR REPLACE FORCE EDITIONABLE VIEW "RAFAL"."EMP_DETAILS_VIEW" 
 ( "COUNTRY_NAME", "REGION_NAME"
  )  AS 
  select c.country_name,
          r.region_name
     from countries c
     join regions r
       on c.region_id = r.region_id
/

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('emp_details_view_view', 'rafal', 'view/emp_details_view_view.sql', SYSTIMESTAMP, 8, '8:ec420a9a958b7407c9352d65c68b2696', 'sql', 'Initial changeset for emp_details_view_view', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset trigger/secure_countries_trigger.sql::secure_countries_trigger::rafal
-- Initial changeset for secure_countries_trigger
CREATE OR REPLACE EDITIONABLE TRIGGER "RAFAL"."SECURE_COUNTRIES" 
before insert or update or delete on countries
begin
   secure_dml;
end secure_countries;

ALTER TRIGGER "RAFAL"."SECURE_COUNTRIES" DISABLE
/

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('secure_countries_trigger', 'rafal', 'trigger/secure_countries_trigger.sql', SYSTIMESTAMP, 9, '8:cbcccab17d19329a17cd61aa4c4c8dc3', 'sql', 'Initial changeset for secure_countries_trigger', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset trigger/secure_regions_trigger.sql::secure_regions_trigger::rafal
-- Initial changeset for secure_regions_trigger
CREATE OR REPLACE EDITIONABLE TRIGGER "RAFAL"."SECURE_REGIONS" 
before insert or update or delete on regions
begin
   null;
end secure_regions;

ALTER TRIGGER "RAFAL"."SECURE_REGIONS" DISABLE
/

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('secure_regions_trigger', 'rafal', 'trigger/secure_regions_trigger.sql', SYSTIMESTAMP, 10, '8:5481eba35a7f1679853911f6e61cdd7e', 'sql', 'Initial changeset for secure_regions_trigger', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset comment/regions_comments.sql::regions_comments::rafal
-- Initial changeset for regions_comments
COMMENT ON COLUMN "RAFAL"."REGIONS"."REGION_ID" IS 'Primary key of regions table.';

COMMENT ON COLUMN "RAFAL"."REGIONS"."REGION_NAME" IS 'Names of regions. Locations are in the countries of these regions.';

COMMENT ON TABLE "RAFAL"."REGIONS"  IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('regions_comments', 'rafal', 'comment/regions_comments.sql', SYSTIMESTAMP, 11, '8:291b8e68e1dfcfb9c385f3285ce939d4', 'sql', 'Initial changeset for regions_comments', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Changeset comment/countries_comments.sql::countries_comments::rafal
-- Initial changeset for countries_comments
COMMENT ON COLUMN "RAFAL"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';

COMMENT ON COLUMN "RAFAL"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';

COMMENT ON COLUMN "RAFAL"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';

COMMENT ON TABLE "RAFAL"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('countries_comments', 'rafal', 'comment/countries_comments.sql', SYSTIMESTAMP, 12, '8:73f6c3719a40648710a6a552d383f668', 'sql', 'Initial changeset for countries_comments', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712386404');

-- Release Database Lock
UPDATE RAFAL.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

