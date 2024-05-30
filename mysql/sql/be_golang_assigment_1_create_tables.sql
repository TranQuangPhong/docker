use be_golang;

create table professor (
	prof_id int not null primary key auto_increment,
    prof_lname varchar(50),
    prof_fname varchar(50)
) ENGINE=InnoDB;

create table student (
	stud_id int not null primary key auto_increment,
    stud_fname varchar(50),
    stud_lname varchar(50),
    stud_street varchar(255),
    stud_city varchar(50),
    stud_zip varchar(10)
) ENGINE=InnoDB;

create table class (
	class_id int not null primary key auto_increment,
    class_name varchar(255),
    prof_id int,
    course_id int,
    room_id int unique        -- add constrain later
) ENGINE=InnoDB;

create table course (
	course_id int not null primary key auto_increment,
    course_name varchar(255)
) ENGINE=InnoDB;

create table room (
	room_id int not null primary key auto_increment,
    room_loc varchar(50),
    class_id int unique        -- add constrain later
) ENGINE=InnoDB;

create table enroll (
	stud_id int not null,  -- add constrain later
	class_id int not null,  -- add constrain later
    grade varchar(3),
    primary key (stud_id, class_id)
) ENGINE=InnoDB;

-- ADD CONSTRAINTS

-- class table
alter table class add constraint FK_CLASS_PROFESSOR foreign key (prof_id) references professor(prof_id);
alter table class add constraint FK_CLASS_COURSE foreign key (course_id) references course(course_id);
alter table class add constraint FK_CLASS_ROOM foreign key (room_id) references room(room_id);

-- room table
alter table room add constraint FK_ROOM_CLASS foreign key (class_id) references class(class_id);

-- enroll table
alter table enroll add constraint FK_ENROLL_STUDENT foreign key (stud_id) references student(stud_id);
alter table enroll add constraint FK_ENROLL_CLASS foreign key (class_id) references class(class_id);










