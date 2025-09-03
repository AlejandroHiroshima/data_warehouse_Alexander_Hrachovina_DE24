-- switch to an appropriate role

USE ROLE useradmin;

-- create dlt user

CREATE USER extract_loader
    PASSWORD = 'apa123apa'
    DEFAULT_WAREHOUSE = COMPUTE_WH;

-- create dlt role

CREATE ROLE movies_dlt_role;

-- switch to an appropriate role to grant privileges to role & grant role to user
USE ROLE SECURITYADMIN;

-- grant role to user

GRANT ROLE movies_dlt_role TO USER extract_loader;

-- grant privileges to role
-- this role needs to use warehouse, db, schema

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE movies_dlt_role;
GRANT USAGE ON DATABASE movies TO ROLE movies_dlt_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_dlt_role;

-- this role needs some special usages for the db and schema

GRANT CREATE TABLE ON SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;

SHOW GRANTS TO ROLE movies_dlt_role;

-----

USE ROLE useradmin;

CREATE ROLE IF NOT EXISTS movies_reader;

USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE movies_reader;

GRANT USAGE ON DATABASE movies TO ROLE movies_reader;

GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_reader;

GRANT SELECT ON FUTURE TABLES IN DATABASE movies TO ROLE movies_reader;

GRANT ROLE movies_reader TO USER ALEXH1985;

grant role movies_dlt_role to user alexh1985;

SHOW GRANTS TO ROLE movies_reader;