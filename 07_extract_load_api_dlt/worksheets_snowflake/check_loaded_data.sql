use role job_ads_dlt_role;

use database job_ads;

show schemas;

show tables in schema staging;

describe table staging.data_fields_job_ads;

select headline, employer__workplace, description__text from staging.data_fields_job_ads;

select * from staging.data_fields_job_ads where employer__workplace = 'ATG'