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
   release_date         timestamp comment '��������
            //����һ���ǵ�ʱ�ͷ�������ʦ����Ԥ�裬�����ȱ��棬ֱ����ʦ���������ť�ͷ�����
            ���������ť���޸�release_date��Ȼ��ǰ�˱ȽϷ���ʱ���뵱ǰʱ�䣬�ж��Ƿ��ѧ����ʾ��ǰ��ҵ',
   deadline             timestamp,
   primary key (hw_id)
);

alter table HomeWork comment '��ҵʵ�壬��ʦ�ɲ�����ҵ��ѧ���ɲ鿴�������ҵ
���ǵ���Ҫ���ݷ���ͳ��ѧ���Ĵ��⼯����Լ�ͳ�Ʒ�����ҵ��Ŀ��';

/*==============================================================*/
/* Table: assign                                                */
/*==============================================================*/
create table assign
(
   u_id                 int not null,
   hw_id                int not null,
   course_id            int not null comment '�����ſγ��й�',
   primary key (u_id, hw_id, course_id)
);

alter table assign comment '��ʦ������ҵ
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

alter table consist comment 'ѧ���ύ�а�������������
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
   course_id            int not null comment '�����ſγ��й�',
   class_id             int not null,
   subject              varchar(30) not null,
   grade                int not null,
   year                 int not null,
   semester             smallint not null default 1,
   primary key (course_id)
);

alter table course comment '�γ�ʵ�壬��¼�γ̵Ŀ���ʱ���Լ���������';

/*==============================================================*/
/* Table: include                                               */
/*==============================================================*/
create table include
(
   wr_id                int not null,
   que_id               int not null,
   primary key (wr_id, que_id)
);

alter table include comment '��������й���������ѧ�����ԴӴ��⼯�����µ���ϰ���⣬����ѧϰ����
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

alter table mark comment '��ʦ������ҵ';

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   mes_id               int not null,
   user                 int not null comment '���Ե�����',
   friend               int not null comment '�Է���ID',
   sender               int not null comment ' ���Է�����',
   reciever             int not null comment '���Խ�����',
   type                 bool not null comment '�������ͣ���ͨ��Ϣ��ϵͳ��Ϣ��',
   content              varchar(200) not null comment '��json��¼��
            {type:"html,content:"..."}',
   send_time            timestamp not null,
   read_time            timestamp not null,
   m_status             bool not null comment '���Ե�״̬���Ƿ�ɾ��
            ',
   primary key (mes_id)
);

alter table message comment '���ԣ�����oschina
https://www.oschina.net/question/12_70252';

/*==============================================================*/
/* Table: quesiton                                              */
/*==============================================================*/
create table quesiton
(
   que_id               int not null,
   content              text not null comment '��json��¼��
            {type:"html,content:"..."}',
   answer               text comment '������Ĳο��𰸻��߽�����Ҳ��json�洢
            {explanation����...����answer:"..."}
            ����Ϊ�գ��������������û����زο���',
   subject              varchar(30) comment '����ʲôѧ��',
   grade                int comment '�꼶
            ',
   primary key (que_id)
);

alter table quesiton comment '��ҵ�е�����ʵ��';

/*==============================================================*/
/* Table: stu_answer                                            */
/*==============================================================*/
create table stu_answer
(
   anw_id               int not null,
   an_content           text,
   primary key (anw_id)
);

alter table stu_answer comment 'ѧ���Ĵ�';

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject
(
   subject              varchar(30) not null,
   primary key (subject)
);

alter table subject comment '�γ�';

/*==============================================================*/
/* Table: submission                                            */
/*==============================================================*/
create table submission
(
   sub_id               int not null,
   score                numeric(5,2),
   remark               varchar(150) comment '��ʦ����',
   primary key (sub_id)
);

alter table submission comment 'ѧ���ύ����ҵ';

/*==============================================================*/
/* Table: submit                                                */
/*==============================================================*/
create table submit
(
   u_id                 int not null,
   hw_id                int not null,
   sub_id               int not null,
   submit_time          timestamp not null,
   status               bool not null comment '�Ƿ��Ѿ��ύ',
   count                int not null,
   primary key (u_id, hw_id, sub_id)
);

alter table submit comment 'ѧ���ύ��ҵ
ѧ������ҵ�ύ���̣�����ÿһ����Ŀ�������Լ��Ĵ���������������ڵ����ݣ���ϵͳ�Զ��������ѧ';

/*==============================================================*/
/* Table: take                                                  */
/*==============================================================*/
create table take
(
   u_id                 int not null,
   course_id            int not null comment '�����ſγ��й�',
   primary key (u_id, course_id)
);

alter table take comment 'ѧ���Ͽ�
';

/*==============================================================*/
/* Table: teach                                                 */
/*==============================================================*/
create table teach
(
   u_id                 int not null,
   course_id            int not null comment '�����ſγ��й�',
   role                 varchar(30) comment '��ʦ����༶�Ľ�ɫ',
   primary key (u_id, course_id)
);

alter table teach comment '��ʦ�����̹���γ�
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

alter table user comment '��ͨ�û�';

/*==============================================================*/
/* Table: wrong_hw_collection                                   */
/*==============================================================*/
create table wrong_hw_collection
(
   wr_id                int not null,
   wr_content           text not null comment 'ѧ���Լ���������Ŀ��¼��',
   primary key (wr_id)
);

alter table wrong_hw_collection comment '���⼯��ѧ���Լ�������ϵͳҲ���Ը�������';

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

