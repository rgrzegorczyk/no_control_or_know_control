--liquibase formatted sql
--changeset rafal:departments_seq_sequence runOnChange:false context:INITIAL_SYNC labels:INITIAL_SYNC
--comment Initial changeset for departments_seq_sequence
 CREATE SEQUENCE "RAFAL"."DEPARTMENTS_SEQ" MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE NOORDER NOCYCLE NOSCALE 
