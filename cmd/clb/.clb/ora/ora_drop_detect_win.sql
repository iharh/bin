-- to remove a header
-- set head off;
-- set und off;
set pages 0; 
set feedback off; 
select 'drop user '||username||' cascade;' from win_ss.cb_datasource;
exit;
