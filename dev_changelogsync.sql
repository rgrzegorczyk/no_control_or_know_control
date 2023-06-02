-- *********************************************************************
-- SQL to add all changesets to database history table
-- *********************************************************************
-- Change Log: controller.xml
-- Ran at: 02.06.2023, 15:22
-- Against: RAFAL@jdbc:oracle:thin:@rgatp28_low
-- Liquibase version: 4.19.0
-- *********************************************************************

-- Lock Database
UPDATE RAFAL.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'localhost (192.168.8.117)', LOCKGRANTED = SYSTIMESTAMP WHERE ID = 1 AND LOCKED = 0;

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('departments_seq_sequence', 'rafal', 'sequence/departments_seq_sequence.sql', SYSTIMESTAMP, 1, '8:bcc540288cccd8b4a427e8eaac8ea99f', 'sql', 'Initial changeset for departments_seq_sequence', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('regions_table', 'rafal', 'table/regions_table.sql', SYSTIMESTAMP, 2, '8:354320f6bc1be8e2c73015d88c1596dd', 'sql', 'Initial changeset for regions_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('departments_table', 'rafal', 'table/departments_table.sql', SYSTIMESTAMP, 3, '8:dac97fa1cbf82e35426cae68960ac6c8', 'sql', 'Initial changeset for departments_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('application_params_table', 'rafal', 'table/application_params_table.sql', SYSTIMESTAMP, 4, '8:f94a4bb81d6d69b7d24df342ec559b9b', 'sql', 'Initial changeset for application_params_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('secure_dml_procedure', 'rafal', 'procedure/secure_dml_procedure.sql', SYSTIMESTAMP, 5, '8:a8bb9833fc4677860f5e96cdd36ee240', 'sql', 'Initial changeset for secure_dml_procedure', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('countries_table', 'rafal', 'table/countries_table.sql', SYSTIMESTAMP, 6, '8:c9e46bb6ed0f4ac6c9305b715e254ca9', 'sql', 'Initial changeset for countries_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('locations_table', 'rafal', 'table/locations_table.sql', SYSTIMESTAMP, 7, '8:9eebc3c8cfe2590b163fe85d41700dee', 'sql', 'Initial changeset for locations_table', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('emp_details_view_view', 'rafal', 'view/emp_details_view_view.sql', SYSTIMESTAMP, 8, '8:ec420a9a958b7407c9352d65c68b2696', 'sql', 'Initial changeset for emp_details_view_view', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('secure_countries_trigger', 'rafal', 'trigger/secure_countries_trigger.sql', SYSTIMESTAMP, 9, '8:cbcccab17d19329a17cd61aa4c4c8dc3', 'sql', 'Initial changeset for secure_countries_trigger', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('secure_regions_trigger', 'rafal', 'trigger/secure_regions_trigger.sql', SYSTIMESTAMP, 10, '8:5481eba35a7f1679853911f6e61cdd7e', 'sql', 'Initial changeset for secure_regions_trigger', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('regions_comments', 'rafal', 'comment/regions_comments.sql', SYSTIMESTAMP, 11, '8:291b8e68e1dfcfb9c385f3285ce939d4', 'sql', 'Initial changeset for regions_comments', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

INSERT INTO RAFAL.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('countries_comments', 'rafal', 'comment/countries_comments.sql', SYSTIMESTAMP, 12, '8:73f6c3719a40648710a6a552d383f668', 'sql', 'Initial changeset for countries_comments', 'EXECUTED', 'INITIAL_SYNC', 'initial_sync', '4.19.0', '5712188107');

-- Release Database Lock
UPDATE RAFAL.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

