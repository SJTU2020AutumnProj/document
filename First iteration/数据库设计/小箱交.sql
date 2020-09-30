/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/9/30 9:13:05                            */
/*==============================================================*/


drop table if exists HomeWork;

drop table if exists assign;

drop table if exists consist;

drop table if exists contain;

drop table if exists course;

drop table if exists include;

drop table if exists mark;

drop table if exists message;

drop table if exists quesiton;

drop table if exists stu_answer;

drop table if exists subject;

drop table if exists submission;

drop table if exists submit;

drop table if exists take;

drop table if exists teach;

drop table if exists user;

drop table if exists wrong_hw_collection;

/*==============================================================*/
/* Table: HomeWork                                              */
/*==============================================================*/
create table HomeWork
(
   hw_id                int not null,
   release_date         timestamp comment '发布日期
            //并不一定是当时就发布，老师可以预设，或者先保存，直到老师点击发布按钮就发布，
            点击发布按钮即修改release_date，然后前端比较发布时间与当前时间，判断是否给学生显示当前作业',
   deadline             timestamp,
   primary key (hw_id)
);

alter table HomeWork comment '作业实体，老师可布置作业，学生可查看并完成作业
考虑到需要数据分析统计学生的错题集情况以及统计分析作业题目的';

/*==============================================================*/
/* Table: assign                                                */
/*==============================================================*/
create table assign
(
   u_id                 int not null,
   hw_id                int not null,
   course_id            int not null comment '与哪门课程有关',
   primary key (u_id, hw_id, course_id)
);

alter table assign comment '老师布置作业
';

/*==============================================================*/
/* Table: consist                                               */
/*==============================================================*/
create table consist
(
   sub_id               int not null,
   anw_id               int not null,
   primary key (sub_id, anw_id)
);

alter table consist comment '学生提交中包含的做题内容
';

/*==============================================================*/
/* Table: contain                                               */
/*==============================================================*/
create table contain
(
   hw_id                int not null,
   que_id               int not null,
   primary key (hw_id, que_id)
);

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course
(
   course_id            int not null comment '与哪门课程有关',
   class_id             int not null,
   subject              varchar(30) not null,
   grade                int not null,
   year                 int not null,
   semester             smallint not null default 1,
   primary key (course_id)
);

alter table course comment '课程实体，记录课程的开课时间以及开课周数';

/*==============================================================*/
/* Table: include                                               */
/*==============================================================*/
create table include
(
   wr_id                int not null,
   que_id               int not null,
   primary key (wr_id, que_id)
);

alter table include comment '与试题进行关联，方便学生可以从错题集生成新的练习试题，巩固学习内容
';

/*==============================================================*/
/* Table: mark                                                  */
/*==============================================================*/
create table mark
(
   u_id                 int not null,
   sub_id               int not null,
   mark_time            timestamp not null,
   primary key (u_id, sub_id)
);

alter table mark comment '教师批改作业';

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   mes_id               int not null,
   user                 int not null comment '留言的主人',
   friend               int not null comment '对方的ID',
   sender               int not null comment ' 留言发送者',
   reciever             int not null comment '留言接收者',
   type                 bool not null comment '留言类型（普通消息、系统消息）',
   content              varchar(200) not null comment '用json记录，
            {type:"html,content:"..."}',
   send_time            timestamp not null,
   read_time            timestamp not null,
   m_status             bool not null comment '留言的状态，是否被删除
            ',
   primary key (mes_id)
);

alter table message comment '留言，仿照oschina
https://www.oschina.net/question/12_70252';

/*==============================================================*/
/* Table: quesiton                                              */
/*==============================================================*/
create table quesiton
(
   que_id               int not null,
   content              text not null comment '用json记录，
            {type:"html,content:"..."}',
   answer               text comment '该问题的参考答案或者解析，也用json存储
            {explanation：“...”，answer:"..."}
            允许为空，例如作文题可以没有相关参考答案',
   subject              varchar(30) comment '属于什么学科',
   grade                int comment '年级
            ',
   primary key (que_id)
);

alter table quesiton comment '作业中的问题实体';

/*==============================================================*/
/* Table: stu_answer                                            */
/*==============================================================*/
create table stu_answer
(
   anw_id               int not null,
   an_content           text,
   primary key (anw_id)
);

alter table stu_answer comment '学生的答案';

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject
(
   subject              varchar(30) not null,
   primary key (subject)
);

alter table subject comment '课程';

/*==============================================================*/
/* Table: submission                                            */
/*==============================================================*/
create table submission
(
   sub_id               int not null,
   score                numeric(5,2),
   remark               varchar(150) comment '教师评语',
   primary key (sub_id)
);

alter table submission comment '学生提交的作业';

/*==============================================================*/
/* Table: submit                                                */
/*==============================================================*/
create table submit
(
   u_id                 int not null,
   hw_id                int not null,
   sub_id               int not null,
   submit_time          timestamp not null,
   status               bool not null comment '是否已经提交',
   count                int not null,
   primary key (u_id, hw_id, sub_id)
);

alter table submit comment '学生提交作业
学生做作业提交流程，对于每一个题目，都有自己的答题区域，这块区域内的内容，在系统自动保存或者学';

/*==============================================================*/
/* Table: take                                                  */
/*==============================================================*/
create table take
(
   u_id                 int not null,
   course_id            int not null comment '与哪门课程有关',
   primary key (u_id, course_id)
);

alter table take comment '学生上课
';

/*==============================================================*/
/* Table: teach                                                 */
/*==============================================================*/
create table teach
(
   u_id                 int not null,
   course_id            int not null comment '与哪门课程有关',
   role                 varchar(30) comment '教师管理班级的角色',
   primary key (u_id, course_id)
);

alter table teach comment '老师或助教管理课程
';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   u_id                 int not null,
   u_type               int not null default 1,
   name                 char(15) not null,
   password             char(18) not null,
   primary key (u_id)
);

alter table user comment '普通用户';

/*==============================================================*/
/* Table: wrong_hw_collection                                   */
/*==============================================================*/
create table wrong_hw_collection
(
   wr_id                int not null,
   wr_content           text not null comment '学生自己做过的题目记录，',
   primary key (wr_id)
);

alter table wrong_hw_collection comment '错题集，学生自己创建，系统也可以辅助生成';

alter table assign add constraint FK_assign foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table assign add constraint FK_assign2 foreign key (hw_id)
      references HomeWork (hw_id) on delete restrict on update restrict;

alter table assign add constraint FK_assign3 foreign key (course_id)
      references course (course_id) on delete restrict on update restrict;

alter table consist add constraint FK_consist foreign key (sub_id)
      references submission (sub_id) on delete restrict on update restrict;

alter table consist add constraint FK_consist2 foreign key (anw_id)
      references stu_answer (anw_id) on delete restrict on update restrict;

alter table contain add constraint FK_contain foreign key (hw_id)
      references HomeWork (hw_id) on delete restrict on update restrict;

alter table contain add constraint FK_contain2 foreign key (que_id)
      references quesiton (que_id) on delete restrict on update restrict;

alter table include add constraint FK_include foreign key (wr_id)
      references wrong_hw_collection (wr_id) on delete restrict on update restrict;

alter table include add constraint FK_include2 foreign key (que_id)
      references quesiton (que_id) on delete restrict on update restrict;

alter table mark add constraint FK_mark foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table mark add constraint FK_mark2 foreign key (sub_id)
      references submission (sub_id) on delete restrict on update restrict;

alter table submit add constraint FK_submit foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table submit add constraint FK_submit2 foreign key (hw_id)
      references HomeWork (hw_id) on delete restrict on update restrict;

alter table submit add constraint FK_submit3 foreign key (sub_id)
      references submission (sub_id) on delete restrict on update restrict;

alter table take add constraint FK_take foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table take add constraint FK_take2 foreign key (course_id)
      references course (course_id) on delete restrict on update restrict;

alter table teach add constraint FK_teach foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table teach add constraint FK_teach2 foreign key (course_id)
      references course (course_id) on delete restrict on update restrict;

