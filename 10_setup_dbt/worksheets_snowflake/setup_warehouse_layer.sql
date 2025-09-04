use role sysadmin;
use database job_ads;
create schema if not exists warehouse;
show schemas in database job_ads;
use role securityadmin;

grant role job_ads_dlt_role to role job_ads_dbt_role;
show grants to role job_ads_dbt_role;
use role job_ads_dbt_role;

grant usage, create table, create view on schema job_ads.warehouse to role job_ads_dbt_role;

grant select, insert, update, delete on all tables in schema job_ads.warehouse to role job_ads_dbt_role;
grant select on all views in schema job_ads.warehouse to role job_ads_dbt_role;

grant select, insert, update, delete on future tables in schema job_ads.warehouse to role job_ads_dbt_role;
grant select on future views in schema job_ads.warehouse to role job_ads_dbt_role;

use role job_ads_dbt_role;

select * from job_ads.staging.data_fields_job_ads limit 10;

show grants on schema job_ads.warehouse;

use schema job_ads.warehouse;

create table test (id INTEGER);

show tables;

drop table test;