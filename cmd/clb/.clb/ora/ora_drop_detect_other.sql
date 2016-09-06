-- to remove a header
-- set head off;
-- set und off;
set pages 0; 
set feedback off; 
select 'drop user '||username||' cascade;' from DBA_USERS where default_tablespace = 'USERS' and account_status='OPEN';
exit;
