drop table if exists `courseclass`;
create table `courseclass`
(
   course_id            int not null auto_increment,
   course_name          varchar(100) not null,
   introduction         varchar(1000),
   text_books            varchar(1000),
   start_time           date,
   end_time             date,
   primary key (course_id)
);

drop table if exists `user`;
create table `user`
(
   user_id                 int not null auto_increment,
   user_type               int not null default 1,
   user_name                varchar(100) not null,
   password                varchar(100) not null,
   school                  varchar(100) not null,
   ID                      varchar(100) not null,
   phone                   varchar(100),
   email                   varchar(100),
   primary key (user_id)
);

drop table if exists `take`;
create table `take`
(
   `user_id`                 int not null,
   `course_id`            int not null ,
   `role`                  int not null,
   primary key (`user_id`, `course_id`),
   foreign key (`user_id`) REFERENCES `user` (`user_id`),
   foreign key (`course_id`) REFERENCES `courseclass` (`course_id`)
);

