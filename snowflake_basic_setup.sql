use role accountadmin;

create or replace warehouse power_house
warehouse_size='xsmall'
auto_suspend=60
auto_resume=TRUE
initially_suspended=TRUE
comment='demo warehouse created';

-- Raw schema -> raw level data
-- staging schema -> cleaning the data
-- marts schema-> facts and dimension table
-- analytics schema-> final table

show warehouses;

create database DE10_DB;

use DE10_DB;

create schema raw;

show databases;

show schemas;

create or replace table raw.customers(
customer_id number,
customer_name string
)

show tables;

insert into raw.customers values(1,'Ramesh'),(2,'Shankar');

select * from raw.customers;


-- view temp storage just a design -- not a real table 
create or replace view gold.vw_total_customer_ordered

create or replace table raw.events(
event_id number,
event_data variant
)

-- if creating a table like semi structured data like json -- api response -- json
insert into raw.events
select 1,parse_json('{"user":"Amit","event":"login","device":"Iphone 17 pro max"}');

select * from raw.events;

-- now how to convert this semi to structerd data

select 
event_data:user::string as user_name,
event_data:event::string as event_name,
event_data:device::string as device_name
from raw.events;

-- time travel concept
create or replace table raw.employees(
id number,
name string
)

insert into raw.employees values (1,'praveen'),(2,'sowmi');

select * from raw.employees;

delete from raw.employees;

-- how to retrive
select * from raw.employees before(statement => '01c4c851-000d-c22e-0000-4e71000cbd02'); -- query from query history copy that and paste here

create table employee_restore
clone employees
at(offset=> -60*5);

select * from raw.employee_restore;

-- fall safe ??
-- time travel(based on user ask)
-- if snowflake determines the time it is fallback

alter table employees set data_retention_time_in_days=7;

-- data exist
-- delete update insert'
-- time travel
-- fail safe
-- permanent purge {after that days you can't recover the data it's over'}


-- load csv file and use it.

-- create file format
-- create stagw - use the file format
-- create structure
-- fill that structure with stage data
