--This script prepares UAT database for Liquibase demo
/*
Log as an ADMIN into your UAT env
execute @demo.sql;

This script will not create any objects on UAT as it will be created using DEMO and Liquibase commands
*/

-- prompt the user to confirm before continuing
ACCEPT continue PROMPT 'This script will re-create schema on your UAT environemnt. Do you want to continue? [press ENTER if YES]'

set define '&'
set verify off

REM ##########
REM START preparing UAT environment
REM ##########

--default values for UAT environment
--schema name to create, TNS alias name and password
define NEW_USER=RAFAL
define UAT_ENV_TNS=rguat_low
define PASSWD=Qwerty12345$

--provide schema name and TNS or use default values
accept NEW_USER char default &NEW_USER prompt 'Name of the new UAT schema to re-create (should be same for DEV and UAT)      | default ->  [&NEW_USER] :'
accept UAT_ENV_TNS char default &UAT_ENV_TNS prompt 'Alias of your UAT env     | default ->  [&UAT_ENV_TNS] :'

--I'm using the same  password for both DEV and UAT
accept PASSWD CHAR default &PASSWD prompt 'Enter a password for newly created UAT schema    | default -> [&PASSWD]               :' HIDE

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

--no need to create objects on UAT
--it will be created later using Liquibase

/*If you want objects on UAT prepared earlier then uncomment below line */
/*Connect to newly created schema*/
--conn &NEW_USER/&PASSWD@&UAT_ENV_TNS
--@@sql/objects/create_objects.sql;