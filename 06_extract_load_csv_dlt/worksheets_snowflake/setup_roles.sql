use role useradmin;

drop role movies_dlt_role;
drop role movies_reader;
create role if not exists movies_dlt_role;
create role if not exists movies_reader_role;

use role securityadmin;

grant role movies_dlt_role to user extract_loader;
grant role movies_reader_role to user ALEXH1985;

grant usage on warehouse dev_wh to role movies_dlt_role;
grant usage on database movies to role movies_dlt_role;
grant usage on schema movies.staging to role movies_dlt_role;

grant create table on schema movies.staging to role movies_dlt_role;
grant insert, update, delete on all tables in schema movies.staging to role movies_dlt_role;
grant insert, update, delete on future tables in schema movies.staging to role movies_dlt_role;

show grants on schema movies.staging;
show future grants in schema movies.staging;
show grants to role movies_dlt_role;
show grants to user extract_loader;

select current_role();

grant usage on warehouse dev_wh to role movies_reader_role;
grant usage on database movies to role movies_reader_role;
grant usage on schema movies.staging to role movies_reader_role;
grant select on all tables in schema movies.staging to role movies_reader_role;
grant select on future tables in database movies to role movies_reader_role;