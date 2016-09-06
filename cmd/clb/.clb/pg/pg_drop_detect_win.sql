select 'drop owned by ' ||username|| ' cascade; drop role '||username||';' from win_ss.cb_datasource;
