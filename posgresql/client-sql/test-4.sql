select ss.staff_id, ss.shift_id, ss.date,
to_char(s.first_entry_time, 'HH24:MM:ss'), to_char(s.start_break_time, 'HH24:MM:ss'),
s.end_break_time, to_char(s.last_leave_time, 'HH24:MM:ss')
from staff_shift ss
join shift s
on s.shift_id = ss.shift_id and s.status = true
where ss.status = true and date = '2022-08-25';


SELECT ss.staff_id, ss.shift_id, ss.date,
s.first_entry_time, s.start_break_time,
s.end_break_time, s.last_leave_time
FROM staff_shift ss
JOIN shift s
ON s.shift_id = ss.shift_id AND s.status = true
WHERE ss.status = true AND date = '2022-08-25';


select * from check_in_data
where
staff_id = 'id_no0' 
and date = '2022-08-25'
order by date desc;

select * from request;
select * from event_info;
select * from check_in_data
where date = '2022-08-19'
order by date desc;

select * from time_management
where
staff_id = 'id_no0' and
date = '2022-08-25'
order by id desc;
-- delete from time_management where created_by = 'anonymous';
select * from explanation_reminder 
where
staff_id = 'id_no0' and
date = '2022-08-25'
order by id desc;
-- delete from explanation_reminder where created_by = 'anonymous';
select max(id) from time_management; --100
select max(id) from explanation_reminder; --19

select * from child_leave_state;
select * from request where staff_id = 'id_no2';

-- alter table check_in_data
-- alter COLUMN created_at type timestamp without time zone,
-- alter COLUMN updated_at type timestamp without time zone;



-- alter table time_management alter column total drop not null;
-- alter table time_management alter column explanation_type_id drop not null;
-- alter table explanation_reminder alter column time_management_id drop not null;

-- alter table check_in_data add column check_in_date_time timestamp without time zone;
-- update check_in_data set check_in_date_time = date + check_in_time;
-- alter table explanation_reminder alter column late_coming_type type character varying(255);

-- insert into events (id, created_at, device_id, device_port, id_no, is_attendance_check, serial_no, tr_date, tr_time, updated_at, user_id)
-- select nextval('events_id_seq'::regclass), created_at, null, null, null, is_attendance_check, null, date, check_in_time, updated_at, staff_id
-- from check_in_data cid
-- where not EXISTS
-- (select 1 from events e where e.user_id = cid.staff_id and e.tr_date = cid.date and e.tr_time = cid.check_in_time);

select * from event_info;
select max(id) from check_in_data;
select * from check_in_data
where
staff_id = 'id_no0' 
and date = '2022-08-25'
order by date desc;

select * from request_reminders;
-- delete from request_reminders;

select
first_entry_time, start_break_time, end_break_time, last_leave_time,
*
from time_management
where
staff_id = 'id_no0' and
date = '2022-08-25'
order by id desc;

select * from explanation_reminder 
where
staff_id = 'id_no0' and
date = '2022-08-25'
order by id desc;

select max(id) from events;

select * from events
where
user_id = 'id_no0' 
and (tr_date = '2022-08-25'
     or tr_date = '2022-08-26'
--      or tr_date = '2022-08-24'
    )
order by id desc;

select * from request_type;

select * from request
where
staff_id = 'id_no0' 
order by date desc;

select * from shift;
select * from staff_shift 
where
staff_id = 'id_no0'
and
(date = '2022-08-25'
or date = '2022-08-24'
or date = '2022-08-26')
order by id desc;

update staff_shift set sync_status_check_in_job = 0;
update events set is_attendance_check = false;


select * from leave_type;
-- update leave_type set "type" = leave_type_code where "type" is null;

select max(id) from request;

select * from child_leave_state
where request_code = 'abcd';



select * from staff_shift 
where
-- staff_id = 'id_no0'
-- and
(date = '2022-09-09')
order by id desc;