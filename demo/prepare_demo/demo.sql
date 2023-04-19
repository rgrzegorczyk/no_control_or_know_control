spool log_demo.log

--default values for my demo
define DEV_ENV_TNS=rgatp28_low
define UAT_ENV_TNS=rguat_low
define PASSWD_DEV=Qwerty12345$
define PASSWD_UAT=Qwerty12345$



accept DEV_ENV_TNS char default &DEV_ENV_TNS prompt 'Alias of your DEV env for ADMIN connection      [&DEV_ENV_TNS] :'
accept PASSWD_DEV CHAR default &PASSWD_DEV prompt 'Enter a password for ADMIN in DEV env in OCI    [&PASSWD_DEV]               :' HIDE

accept UAT_ENV_TNS char default &UAT_ENV_TNS prompt 'Alias of your UAT env for ADMIN connection      [&UAT_ENV_TNS] :'
accept PASSWD_UAT CHAR default &PASSWD_UAT prompt 'Enter a password for ADMIN in UAT env in OCI    [&PASSWD_UAT]               :' HIDE

conn ADMIN/&PASSWD_DEV@&DEV_ENV_TNS
@@scripts/demo_DEV.sql;

conn ADMIN/&PASSWD_UAT@&UAT_ENV_TNS
@@scripts/demo_UAT.sql;
spool off
disconnect

