drop table if exists `courseclass`;
create table `courseclass`
(
   course_id            int not null auto_increment,
   course_name          varchar(1024) not null,
   introduction         varchar(1024) not null,
   text_books           varchar(1024) not null,
   start_time           datetime not null,
   end_time             datetime not null,
   state                int not null,
   primary key (course_id)
);

drop table if exists `user`;
create table `user`
(
   user_id                 int not null auto_increment,
   user_type               int not null default 1,
   user_name                varchar(1024) not null,
   password                varchar(1024) not null,
   school                  varchar(1024) not null,
   ID                      varchar(1024) not null,
   phone                   varchar(1024),
   email                   varchar(1024) not null,
   name                    varchar(1024) not null,
   primary key (user_id)
);

drop table if exists `take`;
create table `take`
(
   user_id                 int not null,
   course_id            int not null ,
   role                  int not null,
   primary key (user_id, course_id)
);

INSERT INTO courseclass VALUES(1,	"CSE",	"计算机工程原理",	"Com. Sys. Eng.",	"2020-10-26",	"2020-12-03",1);

drop table if exists `homework`;
create table `homework`
(
   homework_id int not null auto_increment,
   course_id int not null,
   user_id  int not null,
   start_time datetime not null,
   end_time    datetime not null,
   title       varchar(1024) not null,
   state       int,
   answer_id int,
   primary key (homework_id)
);

drop table if exists `answer`;
create table `answer`
(
   answer_id   int not null auto_increment,
   commit_time    datetime not null,
   primary key (answer_id)
);

drop table if exists `check`;
create table `check`
(
   check_id                 int not null auto_increment,
   check_time               datetime not null,
   score                    int not null,
   primary key (check_id)
);

drop table if exists `message`;
create table `message`
(
   message_id                 int not null auto_increment,
   message_time               datetime not null,
   message_type               int not null,
   user_id                    int not null,
   course_id                  int not null,
   title                      varchar(1024) not null,
   state                      int not null,
   primary key (message_id)
);

drop table if exists `user_homework`;
create table `user_homework`
(
   homework_id                 int not null,
   user_id                     int not null,
   answer_id                   int ,
   check_id                    int ,
   state                       int not null,
   primary key (`homework_id`, `user_id`)
);
