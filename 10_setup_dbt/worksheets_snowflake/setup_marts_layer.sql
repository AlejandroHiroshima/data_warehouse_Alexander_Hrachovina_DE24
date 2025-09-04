use role sysadmin;
use database job_ads;
create schema if not exists marts;
show schemas in database job_ads;

use role securityadmin;
grant usage, create table, create view on schema job_ads.marts to role job_ads_dbt_role;

grant select, insert, update, delete on all tables in schema job_ads.marts to role job_ads_dbt_role;
grant select on all views in schema job_ads.marts to role job_ads_dbt_role;

grant select, insert, update, delete on future tables in schema job_ads.marts to role job_ads_dbt_role;
grant select on future views in schema job_ads.marts to role job_ads_dbt_role;

use role job_ads_dbt_role;

show grants on schema job_ads.marts;

use schema job_ads.marts;
create table test (id INTEGER);
show tables;

drop table test;