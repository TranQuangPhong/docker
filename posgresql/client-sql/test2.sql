select * from request;
-- delete from request;

-- alter table time_management add column sync_status character varying,
-- add column sync_message_error character varying,
-- add column retry_count integer;
-- alter table staff_shift add column sync_status character varying,
-- add column sync_message_error character varying,
-- add column retry_count integer;
update time_management set retry_count = 0;

select * from check_in_data where staff_id = 'id_no1' and date = '2022-08-19' order by date desc;

select * from time_management  where date = '2022-08-19' order by date desc;
select * from time_management  where staff_id = 'id_no1' and date = '2022-08-19' order by date desc;
select * from explanation_reminder where date = '2022-08-19' order by date desc;
select * from explanation_type;
select * from staff_shift where staff_id = 'id_no1' and date = '2022-08-19' order by date desc;
select * from check_in_data where date = '2022-08-19' order by date, staff_id desc;
select * from shift;
-- create table request_backup as select * from request;
select * from time_shift_valid_data;

-- Alter table staff_shift add column sync_status_check_in_job SMALLINT;
update staff_shift set sync_status_check_in_job = 0;
update check_in_data set is_attendance_check = false;
