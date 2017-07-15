-- таблицы, которые пока не используются, но могут быть добавлены в будущем.
prompt PL/SQL Developer import file
prompt Created on 19 Апрель 2013 г. by Admin
set feedback off
set define off
prompt Dropping KM_LOG...
drop table KM_LOG cascade constraints;
prompt Creating KM_LOG...
create table KM_LOG
(
  id_log    NUMBER(38) not null,
  id_user   NUMBER(38),
  id_event  NUMBER(38),
  id_fkr    NUMBER(38),
  date_time TIMESTAMP(6),
  message   VARCHAR2(2000)
)
;
comment on table KM_LOG
  is 'Лог действий пользователя с операцией или со связанным бизнес - объектом.';
alter table KM_LOG
  add constraint KM_LOG_PK primary key (ID_LOG);
alter table KM_LOG
  add constraint KM_LOG_EVENT_FK foreign key (ID_EVENT)
  references KM_EVENT (ID_EVENT);
alter table KM_LOG
  add constraint KM_LOG_FKR_FK foreign key (ID_FKR)
  references KM_FKR (ID_FKR);
alter table KM_LOG
  add constraint KM_LOG_USERS_FK foreign key (ID_USER)
  references USERS (ID_USER);

prompt Loading KM_LOG...
prompt Table is empty
set feedback on
set define on
prompt Done.


prompt PL/SQL Developer import file
prompt Created on 19 Апрель 2013 г. by Admin
set feedback off
set define off
prompt Dropping KM_EXCEPTION_DAY...
drop table KM_EXCEPTION_DAY cascade constraints;
prompt Creating KM_EXCEPTION_DAY...
create table KM_EXCEPTION_DAY
(
  id_exception_day NUMBER(38) not null,
  day              DATE,
  is_working       NUMBER(38)
)
;
comment on table KM_EXCEPTION_DAY
  is 'Праздничные дни и выходные, на которые перенесены рабочие дни.';
alter table KM_EXCEPTION_DAY
  add constraint KM_EXCEPTION_DAY_PK primary key (ID_EXCEPTION_DAY);

prompt Loading KM_EXCEPTION_DAY...
prompt Table is empty
set feedback on
set define on
prompt Done.



prompt PL/SQL Developer import file
prompt Created on 19 Апрель 2013 г. by Admin
set feedback off
set define off
prompt Dropping KM_DOC...
drop table KM_DOC cascade constraints;
prompt Creating KM_DOC...
create table KM_DOC
(
  id_doc      NUMBER(38) not null,
  id_event    NUMBER(38),
  id_appfiles VARCHAR2(128),
  id_doc_type NUMBER(38)
)
;
alter table KM_DOC
  add constraint KM_DOC_PK primary key (ID_DOC);
alter table KM_DOC
  add constraint KM_DOC_APPFILES_FK foreign key (ID_APPFILES)
  references APPFILES (UNID);
alter table KM_DOC
  add constraint KM_DOC_DOC_TYPE_FK foreign key (ID_DOC_TYPE)
  references DOCUMENTS_TYPE (ID_DOCUMENT_TYPE);
alter table KM_DOC
  add constraint KM_DOC_EVENT_FK foreign key (ID_EVENT)
  references KM_EVENT (ID_EVENT);

prompt Loading KM_DOC...
prompt Table is empty
set feedback on
set define on
prompt Done.


 
  