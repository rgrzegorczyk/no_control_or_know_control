--liquibase formatted sql
--changeset rafal:application_params_table runOnChange:false context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for application_params_table
  CREATE TABLE "RAFAL"."APPLICATION_PARAMS" 
   (	"CODE" VARCHAR2(50),
	"VALUE" VARCHAR2(500)
   ) SEGMENT CREATION DEFERRED
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  TABLESPACE "DATA"

--changeset rafal:application_params_table_add_col runOnChange:false context:v1 labels:task-1
--comment Add new column DESCRIPTION
ALTER TABLE RAFAL.APPLICATION_PARAMS ADD DESCRIPTION VARCHAR2(500);
