use role useradmin;

create role if not exists job_ads_dlt_role;

use role securityadmin;

grant role job_ads_dlt_role to user extract_loader;
grant role job_ads_dlt_role to user alexh1985;

grant usage on warehouse dev_wh to role job_ads_dlt_role;
grant usage on database job_ads to role job_ads_dlt_role;
grant usage on schema job_ads.staging to role job_ads_dlt_role;
grant create table on schema job_ads.staging to role job_ads_dlt_role;

grant select, insert, update, delete on all tables in schema job_ads.staging to role job_ads_dlt_role;
grant select, insert, update, delete on future tables in schema job_ads.staging to role job_ads_dlt_role;

show grants on schema job_ads.staging;
show future grants in schema job_ads.staging;
show grants to role job_ads_dlt_role;
show grants to user extract_loader;