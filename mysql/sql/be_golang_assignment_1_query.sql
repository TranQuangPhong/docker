use be_golang;

-- disable ONLY_FULL_GROUP_BY
SELECT @@sql_mode;
SET sql_mode=REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', '');


-- những cặp student-professor có dạy học nhau và số lớp mà họ có liên quan
select CONCAT(p.prof_fname, " ", p.prof_lname) professor, CONCAT(s.stud_fname, " ", s.stud_lname) student, count(c.class_id) no_of_classes
from class c
join enroll e on c.class_id = e.class_id
join professor p on c.prof_id = p.prof_id
join student s on e.stud_id = s.stud_id
group by CONCAT(p.prof_fname, " ", p.prof_lname), CONCAT(s.stud_fname, " ", s.stud_lname);

-- những course (distinct) mà 1 professor cụ thể đang dạy
select professor, course
from (
select distinct(co.course_name) course, CONCAT(p.prof_fname, " ", p.prof_lname) professor
from class c
join professor p on c.prof_id = p.prof_id
join course co on c.course_id = co.course_id
) t;


-- những course (distinct) mà 1 student cụ thể đang học
select student, course
from (
select distinct(co.course_name) course, CONCAT(s.stud_fname, " ", s.stud_lname) student
from class c
join enroll e on c.class_id = e.class_id
join student s on e.stud_id = s.stud_id
join course co on c.course_id = co.course_id
) t;


-- điểm số là A, B, C, D, E, F tương đương với 10, 8, 6, 4, 2, 0
-- điểm số trung bình của 1 học sinh cụ thể (quy ra lại theo chữ cái, và xếp loại học lực (weak nếu avg < 5, average nếu >=5 < 8, good nếu >=8 )

select student, 
(case
when grade < 5 then "weak"
when grade >= 8 then "good"
else "average"
end) as grade
from (
select CONCAT(s.stud_fname, " ", s.stud_lname) student, 
avg( case (grade)
when "A" then 10
when "B" then 8
when "C" then 6
when "D" then 4
when "E" then 2
when "F" then 0
end) grade
from enroll e
join student s on e.stud_id = s.stud_id
group by CONCAT(s.stud_fname, " ", s.stud_lname)
) t;



-- điểm số trung bình của các class (quy ra lại theo chữ cái)

select c.class_name class, 
avg (case (grade)
when "A" then 10
when "B" then 8
when "C" then 6
when "D" then 4
when "E" then 2
when "F" then 0
end) grade
from enroll e
join class c on e.class_id = c.class_id
group by c.class_name;

-- điểm số trung bình của các course (quy ra lại theo chữ cái)

select co.course_name class, 
avg (case (grade)
when "A" then 10
when "B" then 8
when "C" then 6
when "D" then 4
when "E" then 2
when "F" then 0
end) grade
from enroll e
join class c on e.class_id = c.class_id
join course co on co.course_id = c.course_id
group by co.course_name;










