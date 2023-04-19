SET ECHO OFF
SET VERIFY OFF

ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;


-- create tables, sequences and constraint
@@1_structure.sql

-- procedures, triggers
@@2_code.sql

-- dml, test data
@@3_dml.sql