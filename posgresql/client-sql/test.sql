
SELECT id, name FROM shift WHERE id = 1;

select * from time_management;
select * from shift;
select * from request;
select * from request_type;
select * from explanation_reminder;
select * from explanation_type;

select staff_id, STRING_AGG(cast(date as varchar), ', ') from time_management group by staff_id;

select cast('2022-06-22' as date) - make_interval(0,0,0,1);

SELECT STRING_AGG (COALESCE(description, ''), ', ') FROM explanation;

select distinct staff_id from staff_shift order by staff_id;
select * from explanation_reminder where date = '2022-09-09';
select * from events where tr_date = '2022-09-09';
select * from staff_shift where date = '2022-09-09';
select * from time_management where date = '2022-09-09';

-- insert into staff_shift 
-- select nextval('staff_shift_id_seq'::regclass), cast(now() as date), 'created_by', cast(now() as date), 'updated_by',
--                               '2022-09-09', 'shift_1', 'id_no_' || i,
--                               true, null, null, null, 0
--                               FROM generate_series(100,10000) i;

-- -- first entry time
-- insert into events (id, created_at, device_id, device_port, id_no, is_attendance_check, serial_no, tr_date, tr_time, updated_at, user_id)
-- select nextval('events_id_seq'::regclass), cast(now() as date), null, null, null,
-- false, null, '2022-09-09', '08:00:00', cast(now() as date), 'id_no_' || i
-- from generate_series(100,10000) i
-- where not EXISTS
-- (select 1 from events e where e.user_id = 'id_no_' || i and e.tr_date = '2022-09-09' and e.tr_time = '08:00:00');
-- -- start break time
-- insert into events (id, created_at, device_id, device_port, id_no, is_attendance_check, serial_no, tr_date, tr_time, updated_at, user_id)
-- select nextval('events_id_seq'::regclass), cast(now() as date), null, null, null,
-- false, null, '2022-09-09', '12:00:00', cast(now() as date), 'id_no_' || i
-- from generate_series(100,10000) i
-- where not EXISTS
-- (select 1 from events e where e.user_id = 'id_no_' || i and e.tr_date = '2022-09-09' and e.tr_time = '12:00:00');
-- -- end break time
-- insert into events (id, created_at, device_id, device_port, id_no, is_attendance_check, serial_no, tr_date, tr_time, updated_at, user_id)
-- select nextval('events_id_seq'::regclass), cast(now() as date), null, null, null,
-- false, null, '2022-09-09', '13:00:00', cast(now() as date), 'id_no_' || i
-- from generate_series(100,10000) i
-- where not EXISTS
-- (select 1 from events e where e.user_id = 'id_no_' || i and e.tr_date = '2022-09-09' and e.tr_time = '13:00:00');
-- --last leave time
-- insert into events (id, created_at, device_id, device_port, id_no, is_attendance_check, serial_no, tr_date, tr_time, updated_at, user_id)
-- select nextval('events_id_seq'::regclass), cast(now() as date), null, null, null,
-- false, null, '2022-09-09', '17:00:00', cast(now() as date), 'id_no_' || i
-- from generate_series(100,10000) i
-- where not EXISTS
-- (select 1 from events e where e.user_id = 'id_no_' || i and e.tr_date = '2022-09-09' and e.tr_time = '17:00:00');

insert into time_management values(nextval('time_management_id_seq'::regclass), 
                                   '2022-06-21','phong3', '2022-06-21', 'phong3', 
                                   cast('2022-06-24' as date), 1, cast(now() as time), cast(now() as time),
                                   cast(now() as time), 1, 2, cast(now() as time), true
                                  );
                                  
insert into shift values(nextval('shift_id_seq'::regclass), 
                                   '2022-06-21','phong3', '2022-06-21', 'phong3', 'desc3',
                                   cast(now() as time), cast(now() as time),
                                   cast(now() as time), 'shift_2', cast(now() as time), true
                                  );


insert into request values(nextval('request_id_seq'::regclass), 
                                   '2022-06-21','phong1', '2022-06-21', 'phong2',
                                   1, 1, cast(now() as time), cast(now() as time), 'content2',
                           1, 1, 2, '2022-06-27', 1, 'request_name_2', 1, 1, 1,
                           '2022-06-22', true
                                  );

insert into request_type values(nextval('request_type_id_seq'::regclass), 
                                   '2022-06-21','phong3', '2022-06-21', 'phong3',
                                'desc2', 'request_type_name_2', true
                                  );
                                  
insert into explanation_type values(nextval('explanation_type_id_seq'::regclass), 
                                   '2022-06-21','phong1', '2022-06-21', 'phong1',
                                'content', 'explanation_name_2', true
                                  );
insert into explanation_reminder values(nextval('explanation_reminder_id_seq'::regclass), 
                                   '2022-06-21','phong1', '2022-06-21', 'phong1',
                                    1, true, 2
                                  );
