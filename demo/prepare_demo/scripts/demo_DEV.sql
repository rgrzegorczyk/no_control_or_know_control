--This script prepares DEV databas for Liquibase demo
/*
Log as an ADMIN into your DEV env
execute @demo_DEV.sql;
*/


set define '&'
set verify off
-- prompt the user to confirm before continuing
ACCEPT continue PROMPT 'This script will re-create schema on your DEV environemnt. Do you want to continue? [press ENTER is YES] '

REM ##########
REM START  preparing DEV environment
REM ##########

--default values for DEV environment
--schema name to create, TNS alias name and password
define NEW_USER=RAFAL
define DEV_ENV_TNS=rgatp28_low
define PASSWD=Qwerty12345$

--provide schema name and TNS or use default values
accept NEW_USER char default &NEW_USER prompt 'Name of the new DEV schema to re-create (recommended to name is same way for DEV and UAT)       | default -> [&NEW_USER] :'
accept DEV_ENV_TNS char default &DEV_ENV_TNS prompt 'Alias of your DEV env     | default ->  [&DEV_ENV_TNS] :'

--I'm using the same  password for both DEV and UAT
accept PASSWD CHAR default &PASSWD prompt 'Enter a password for newly created DEV schema  | default ->   [&PASSWD]               :' HIDE

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

/*on premise*/
--it will fail when executed on OCI, ignore it
ALTER USER &NEW_USER QUOTA UNLIMITED ON USERS;
grant create session,create view, create job, create table, create sequence, create trigger, create procedure, create any context to &NEW_USER


/*Connect to newly created schema*/
conn &NEW_USER/&PASSWD@&DEV_ENV_TNS
/*Create demo objects at DEV*/
@@sql/objects/create_objects.sql;