--This script prepares DEV databas for Liquibase demo
/*
Log as an ADMIN into your DEV env
execute @demo_DEV.sql;
*/


set define '&'
set verify off
-- prompt the user to confirm before continuing
ACCEPT continue PROMPT 'This script will re-create schema on your DEV environemnt. Do you want to continue? [press ENTER] '

REM ##########
REM START  preparing DEV environment
REM ##########

--default values for my demo
define NEW_USER=RAFAL
define DEV_ENV_TNS=rgatp28_low
define PASSWD=Qwerty12345$

accept NEW_USER char default &NEW_USER prompt 'Name of the new DEV schema to re-create (should be same for DEV and UAT)       [&NEW_USER] :'
accept DEV_ENV_TNS char default &DEV_ENV_TNS prompt 'Alias of your DEV env      [&DEV_ENV_TNS] :'

--I'm using the same  password for both DEV and ENV
accept PASSWD CHAR default &PASSWD prompt 'Enter a password for newly created DEV schema    [&PASSWD]               :' HIDE

/*drop user if exists */
DECLARE
  user_exists NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO user_exists
  FROM all_users
  WHERE username = '&NEW_USER';

  IF user_exists = 1 THEN
    EXECUTE IMMEDIATE 'DROP USER ' || '&NEW_USER' || ' CASCADE';
    DBMS_OUTPUT.PUT_LINE('User ' || '&NEW_USER' || ' dropped successfully');
  ELSE
    DBMS_OUTPUT.PUT_LINE('User ' || '&NEW_USER'|| ' does not exist');
  END IF;
END;
/

/*create user */
CREATE user &NEW_USER identified by &PASSWD
/

--grants and privileges
--/*OCI
ALTER USER &NEW_USER DEFAULT TABLESPACE DATA TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK ;
ALTER USER &NEW_USER QUOTA UNLIMITED ON DATA;
GRANT DWROLE TO &NEW_USER;
--*/

/*on premise
ALTER USER &NEW_USER QUOTA UNLIMITED ON USERS;
grant create session,create view, create job, create table, create sequence, create trigger, create procedure, create any context to &NEW_USER
/
*/

/*Connect to newly created schema*/
conn &NEW_USER/&PASSWD@&DEV_ENV_TNS
/*Create demo objects*/
@@sql/objects/create_objects.sql;