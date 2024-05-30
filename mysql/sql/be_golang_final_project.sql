use final_project;

create table `user`
(
	id int auto_increment primary key,
    hashed_password varchar(50) not null,
    salt varchar(20) not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth timestamp not null,
    email varchar(50) not null,
    user_name varchar(50) not null,
    INDEX idx_username (user_name)
);

create table `post`
(
	id int auto_increment primary key,
	content_text varchar(500),
	content_image_path varchar(255),
	user_id int not null,
	visible bool not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	deleted_at timestamp not null,
	foreign key (user_id) references user(id)
);

create table `like`
(
	user_id int not null,
	post_id int not null,
	created_at timestamp not null,
	updated_at timestamp not null,
	deleted_at timestamp not null,
    primary key (user_id, post_id),
    foreign key (user_id) references user(id),
    foreign key (post_id) references post(id)
);

create table `comment`
(
	id int auto_increment primary key,
    content varchar(255) not null,
 	created_at timestamp not null,
	updated_at timestamp not null,
	deleted_at timestamp not null,
	user_id int not null,
	post_id int not null,
    foreign key (user_id) references user(id),
    foreign key (post_id) references post(id)
);


create table `following`
(
	user_id int not null,
    friend_id int not null,
    foreign key (user_id) references user(id),
    foreign key (friend_id) references user(id),
    primary key (user_id, friend_id)
);






