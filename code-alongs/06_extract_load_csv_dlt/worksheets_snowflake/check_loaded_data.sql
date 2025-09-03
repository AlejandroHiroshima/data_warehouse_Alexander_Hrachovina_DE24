use role movies_reader;

show databases;

use database movies;

describe database movies;

describe schema staging;

desc table staging.netflix;

select * from staging.netflix;

select count(*) from staging.netflix;