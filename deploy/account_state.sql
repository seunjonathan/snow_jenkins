
// DATABASES and SCHEMAS
Create database if not exists SLF_ADMIN_ALL COMMENT = 'DBA ADT';
drop schema if exists SLF_ADMIN_ALL.PUBLIC;

Create schema if not exists SLF_ADMIN_ALL.SLF_ADMIN_SCHEMA;

Create schema if not exists SLF_ADMIN_ALL.MONITORING;


Create tag if not exists SLF_ADMIN_ALL.MONITORING.cost_center;

Create tag if not exists SLF_ADMIN_ALL.MONITORING.environment;


// WHs
create warehouse if not exists XS_WH_DEV comment ='wokload';