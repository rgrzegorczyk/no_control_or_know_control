--connect to your SQLcl 
--sql /nolog
--execute this script  @demo/prepare_demo/demo.sql

spool log_demo.log

--default values for my demo (change tns names for correct values of your environemnts)
define DEV_ENV_TNS=rgatp28_low
define UAT_ENV_TNS=rguat_low
define PASSWD_DEV=Qwerty12345$
define PASSWD_UAT=Qwerty12345$

--above are my default values for 2 separate databases in my free Oracle OCI

--provide tns name and password for you ADMIN user in DEV database
accept DEV_ENV_TNS char default &DEV_ENV_TNS prompt 'Alias/TNS of your DEV env for SYS as sysdba connection      | default -> [&DEV_ENV_TNS] :'
accept PASSWD_DEV CHAR default &PASSWD_DEV prompt 'Enter a password for SYS in DEV env in OCI    | default -> [&PASSWD_DEV]               :' HIDE

--provide tns name and password for you ADMIN user in UAT database
accept UAT_ENV_TNS char default &UAT_ENV_TNS prompt 'Alias/TNS of your UAT env for SYS as sysdba connection      | default -> [&UAT_ENV_TNS] :'
accept PASSWD_UAT CHAR default &PASSWD_UAT prompt 'Enter a password for ADMIN in UAT env in OCI   | default -> [&PASSWD_UAT]               :' HIDE

--connexct to ADMIN on DEV and execute demo_DEV script
conn SYS/&PASSWD_DEV@&DEV_ENV_TNS as sysdba

@@scripts/demo_DEV.sql;

--connect to ADMIN on UAT and execute demo_UAT script
conn SYS/&PASSWD_UAT@&UAT_ENV_TNS as sysdba
 
@@scripts/demo_UAT.sql;

spool off
disconnect

