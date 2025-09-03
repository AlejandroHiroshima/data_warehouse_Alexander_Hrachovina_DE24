use role sysadmin;


drop database movies;

create database if not exists movies;

create schema if not exists movies.staging;

describe database movies;

show warehouses;