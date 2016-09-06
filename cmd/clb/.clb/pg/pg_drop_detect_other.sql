-- select * from pg_catalog.pg_namespace where nspowner <> (select oid from pg_catalog.pg_authid where rolname='postgres');
-- select schema_name from information_schema.schemata where schema_owner<>'postgres';
select 'drop owned by ' ||schema_name|| ' cascade; drop role '||schema_name||';' from information_schema.schemata where schema_owner<>'postgres';

