select 'drop owned by ' ||username|| ' cascade; drop role '||username||';' from lin_ss.cb_datasource;
