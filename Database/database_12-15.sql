drop table if exists `courseclass`;
create table `courseclass`
(
   course_id            int not null auto_increment,
   course_name          varchar(100) not null,
   introduction         varchar(1000),
   text_books            varchar(1000),
   start_time           datetime,
   end_time             datetime,
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
   primary key (`user_id`, `course_id`)
);

INSERT INTO courseclass VALUES(1,	"CSE",	"计算机工程原理",	"Com. Sys. Eng.",	"2020-10-26",	"2020-12-03");

drop table if exists `homework`;
create table `homework`
(
   homework_id int not null auto_increment,
   course_id int not null,
   teacher_id  int not null,
   start_time datetime,
   end_time    datetime,
   primary key (homework_id)
);

drop table if exists `answer`;
create table `answer`
(
   answer_id   int not null auto_increment,
   homework_id int not null,
   student_id  int not null,
   status      int not null,
   commit_time    datetime,
   primary key (answer_id)
);

drop table if exists `check`;
create table `check`
(
   check_id                 int not null auto_increment,
   answer_id                int not null,
   homework_id              int not null,
   teacher_id               int not null,
   check_time               datetime,
   primary key (check_id)
);

