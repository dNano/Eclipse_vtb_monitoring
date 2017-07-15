declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_event_calendar';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_event_calendar
            (
              id_event_calendar             number(38) not null,
              event_name                    varchar2(1024) not null,
              id_event_parent               number(38),
              id_mdtask                     number(38),
              id_organization               char(12),
              id_dep_create                 number(38),
              id_dep_exec                   number(38),
              id_event_type                 number(38) not null,
              id_repeat_type                number(38),
              id_document_group             number(38),
              id_document_type              number(38),
              repeat_period                 number(38),
              repeat_period_kind            number(38),
              repeat_period_weekend         number(1) default 0 not null,
              repeat_period_weekend_exclude number(1) default 0 not null,
              due_date_period               number(38),
              due_date_period_kind          number(38),
              notify_period                 number(38),
              notify_period_kind            number(38),
              notify_at_day                 number(1) default 0 not null,
              notify_after                  number(1) default 0 not null,
              notify_link_msg               number(1) default 0 not null,
              start_date                    date,
              end_date                      date,
              id_confirmation_type          number(38),              
              confirmation_type             varchar2(1024),
              documents_type                varchar2(1024),
              sanction_text                 varchar2(1024),
			  id_source_doc                 number(38),
			  source_doc_comment            varchar2(1024),
			  source_doc_number             varchar2(32),
			  source_doc_date               date,
			  id_punitive_measure           number(38),
			  punitive_measure_descr        varchar2(1024),
              fkr_cand_long                 number(3) default 10 not null
            )
            ';
        execute immediate 'comment on table KM_EVENT_CALENDAR is ''Плановое КМ (Экземпляр типа КМ)'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_event_calendar is ''id'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.event_name  is ''Наименование планового КМ'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_event_parent  is ''Ссылка на родительское КМ [для связанных КМ]'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_mdtask  is ''Ссылка на сделку, которой относится КМ'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_organization  is ''Ссылка на контрагента, к которому относится КМ'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_dep_create  is ''??? подразделение, где создается КМ ???'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_dep_exec  is ''??? подразделение, где исполняется КМ ???'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_event_type  is ''Тип КМ (ссылка)'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_repeat_type  is ''Тип повторяемости (ссылка)'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_document_group  is ''Требуемый документ [ссылка на document_group]'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_document_type  is ''Требуемый документ [ссылка на document_type]'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.due_date_period  is ''Срок выполнения КМ в днях'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.due_date_period_kind  is ''Тип срока выполнения: 0 - календарные дни, 1 -- рабочие дни'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.notify_period  is ''Периодичность нотификации (в днях): '' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.notify_period_kind  is ''За сколько дней начать информировать о наступлении мероприятия'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.start_date  is ''Дата старта планового КМ. Если дата пустая, то старт немедленно. Либо Дата исполнения одноразового мероприятия'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.end_date  is ''Дата окончания планового КМ. Если дата пустая, то плановое КМ действует бесконечно'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_confirmation_type  is ''ссылка на тип подтверждающего документа'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.confirmation_type  is ''???'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.documents_type  is ''???'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.sanction_text  is ''???'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.repeat_period_weekend  is ''учет выходных в периодичности: 0 - после, 1 - перед, 2 - точно'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.repeat_period_weekend_exclude  is ''флаг Исключать выходные в периодичности (для еженедельной): 0 - не исключать, 1 - исключать'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.notify_at_day  is ''Информировать в день мероприятия'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.notify_after  is ''Продолжить информировать после даты мероприятия, при неисполнении'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.notify_link_msg  is ''Включать ссылку на мероприятие в текст сообщения'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_source_doc  is ''Основание для создания мероприятия [ссылка на CD_KM_SOURCE_DOC]'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.source_doc_comment  is ''Уточнение для основания создания мероприятия'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.source_doc_number  is ''№ документа основания создания мероприятия'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.source_doc_date  is ''Дата документа-основания создания мероприятия'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.id_punitive_measure  is ''Штрафные санкции[ссылка на PUNITIVE_MEASURE]'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.punitive_measure_descr  is ''Описание штрафной санкции'' ';
        execute immediate 'comment on column KM_EVENT_CALENDAR.fkr_cand_long  is ''Статус Кандидат в ФКР длится XXX календарных (или рабочих) дней'' ';

        execute immediate 'alter table km_event_calendar add constraint km_event_calendar_pk primary key (id_event_calendar)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk01 foreign key (id_organization)
                  references crm_organization (id_org)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk02 foreign key (id_dep_create)
                  references departments (id_department)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk03 foreign key (id_dep_exec)
                  references departments (id_department)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk04 foreign key (id_event_parent)
                  references km_event_calendar (id_event_calendar)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk05 foreign key (id_event_type)
                  references cd_event_type (id_event_type)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk06 foreign key (id_repeat_type)
                  references cd_repeat_type (id_repeat_type)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk07 foreign key (id_mdtask)
                  references mdtask (id_mdtask)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk08 foreign key (id_confirmation_type)
                  references cd_confirmation_type (id_confirmation_type)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk09 foreign key (id_document_type)
                  references documents_type (id_document_type)';
        execute immediate 
            'alter table km_event_calendar
                  add constraint km_event_calendar_fk10 foreign key (id_document_group)
                  references document_group (id_group)';
      execute immediate
            'alter table km_event_calendar 
                  add constraint km_event_calendar_fk11 foreign key (id_source_doc)
                  references cd_km_source_doc (id_source_doc)';
      execute immediate
            'alter table km_event_calendar
				  add constraint km_event_calendar_fk12 foreign key (id_punitive_measure)
				  references punitive_measure (id_measure)';
       end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'km_event_calendar_seq';
    if counter = 0 then
     execute immediate 'create sequence km_event_calendar_seq nocycle order nocache';
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_event_calendar_dates';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_event_calendar_dates
             (
                id_event_calendar number(38) not null,
                plan_dt           date not null
              )
            ';
      execute immediate
         'comment on table km_event_calendar_dates is ''Плановая периодичность типа  График для таблицы KM_EVENT_CALENDAR'' ';
      execute immediate
         'comment on column km_event_calendar_dates.plan_dt is ''плановая дата исполнения мероприятия.''';
      execute immediate 
         'alter table km_event_calendar_dates add constraint km_event_calendar_dates_pk primary key (id_event_calendar, plan_dt)';
      execute immediate 
         'alter table km_event_calendar_dates
              add constraint km_event_calendar_dates_fk01 foreign key (id_event_calendar)
              references km_event_calendar (id_event_calendar) on delete cascade';
    end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_event_day_of_week';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_event_day_of_week
            (
              id_event_calendar number(38) not null,
              id_day_of_week    number(38) not null
            )
            ';
      execute immediate
        'comment on table KM_EVENT_DAY_OF_WEEK  is ''Join таблица, связывающая KM_EVENT_CALENDAR и KM_DAY_OF_WEEK.'' ';
      execute immediate 
            'alter table KM_EVENT_DAY_OF_WEEK add constraint KM_EVENT_DAY_OF_WEEK_PK primary key (ID_EVENT_CALENDAR, ID_DAY_OF_WEEK)';
      execute immediate 
            'alter table KM_EVENT_DAY_OF_WEEK
                  add constraint km_event_day_of_week_FK01 foreign key (ID_DAY_OF_WEEK)
                  references cd_DAY_OF_WEEK (ID_DAY_OF_WEEK)';
      execute immediate 
            'alter table KM_EVENT_DAY_OF_WEEK
                  add constraint km_event_day_of_week_fk02 foreign key (ID_EVENT_CALENDAR)
                  references KM_EVENT_CALENDAR (ID_EVENT_CALENDAR)';
   end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_event_status';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_event_status
            (
              id_event_status number(38) not null,
              event_status    varchar2(50)
            )
            ';
      execute immediate
        'comment on table km_event_status is ''Статус мероприятия'' ';
      execute immediate 
            'alter table km_event_status add constraint km_event_status_pk primary key (id_event_status)';
      end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_event_instance_status';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_event_instance_status
            (
              id   number(1) not null,
              name varchar2(64) not null
            )
            ';
      execute immediate
        'comment on table km_event_instance_status is ''Статусы контрольных мероприятий'' ';
      execute immediate 'alter table km_event_instance_status add constraint km_evinststatus_pk primary key (id)';
   end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_event';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_event
            (
              id_event          number(38) not null,
              id_event_calendar number(38) not null,
              id_event_result   number(38),
              id_event_status   number(38),
              id_executor       number(38),
              id_confirmation_type  number(38),
              id_document_group number(38),
              id_document_type  number(38),
              id_doc            varchar2(128),
              start_date        date,
              executed_date     date,
              plan_date         date not null,
              result_notes      varchar2(4000),
              
              sanction_text     varchar2(1024),
              
              is_sanction       number,
              sanction_date     date,
              sanction_value    number,
              sanction_currency varchar2(20),
              id_sanction_doc    varchar2(128),
              sanction_refused_by varchar2(256),
			  sanction_refused_docnum varchar2(64),
			  sanction_refused_date date,
			  id_sanction_refused_doc varchar2(128),

              id_source_doc         number(38),
              source_doc_comment    varchar2(1024),
              source_doc_number     varchar2(32),
              source_doc_date       date,
              id_punitive_measure   number(38),
              punitive_measure_descr varchar2(1024),
              fkr_cand_long         number(3) default 10 not null
            )
            ';
      execute immediate 'comment on table km_event is ''Контрольное мероприятие (КМ), назначенное на исполнение на конкретную дату'' ';
      execute immediate 'comment on column km_event.id_event_calendar is ''Ссылка на плановое мероприятие, породившее КМ'' ';
      execute immediate 'comment on column km_event.id_event_result is ''ссылка на тип результата исполнения КМ'' ';
      execute immediate 'comment on column km_event.id_executor is ''исполнитель мероприятия'' ';
      execute immediate 'comment on column km_event.start_date is ''дата начала фактического исполнения КМ (когда взято в работу)'' ';
      execute immediate 'comment on column km_event.executed_date is ''дата завершения исполнения КМ'' ';
      execute immediate 'comment on column km_event.plan_date is ''плановая дата КМ (генерируется при создании КМ согласно графику периодичности в плановом мероприятии)'' ';
      execute immediate 'comment on column km_event.id_confirmation_type  is ''ссылка на тип подтверждающего документа'' ';
      execute immediate 'comment on column km_event.id_document_group  is ''Требуемый документ [ссылка на document_group]'' ';
      execute immediate 'comment on column km_event.id_document_type  is ''Требуемый документ [ссылка на document_type]'' ';
      execute immediate 'comment on column km_event.id_doc  is ''Подтверждающий документ [ссылка на appfiles]'' ';
      execute immediate 'comment on column km_event.id_source_doc  is ''Основание для создания мероприятия [ссылка на CD_KM_SOURCE_DOC]'' ';
      execute immediate 'comment on column km_event.source_doc_comment  is ''Уточнение для основания создания мероприятия'' ';
      execute immediate 'comment on column km_event.source_doc_number  is ''№ документа основания создания мероприятия'' ';
      execute immediate 'comment on column km_event.source_doc_date  is ''Дата документа-основания создания мероприятия'' ';
      execute immediate 'comment on column km_event.id_punitive_measure  is ''Штрафные санкции[ссылка на PUNITIVE_MEASURE]'' ';
      execute immediate 'comment on column km_event.punitive_measure_descr  is ''Описание штрафной санкции'' ';
      execute immediate 'comment on column km_event.is_sanction  is ''null -- санкция не применяется, 1 - применяется, 0 - отменена.'' ';
      execute immediate 'comment on column km_event.sanction_date  is ''Санкция. Дата'' ';
      execute immediate 'comment on column km_event.sanction_value  is ''Санкция. Значение'' ';
      execute immediate 'comment on column km_event.sanction_currency  is ''Санкция. Валюта'' ';
      execute immediate 'comment on column km_event.id_sanction_doc  is ''документ по санкции [ссылка на appfiles]'' ';
      execute immediate 'comment on column km_event.sanction_refused_by  is ''уполномоченный орган (лицо), отменившее санкции'' ';
      execute immediate 'comment on column km_event.sanction_refused_docnum  is ''№ документа, отменяющего санкции'' ';
      execute immediate 'comment on column km_event.sanction_refused_date  is ''Дата документа, отменяющего санкции'' ';
      execute immediate 'comment on column km_event.id_sanction_refused_doc  is ''документ, отменяющий санкции [ссылка на appfiles]'' ';
      execute immediate 'comment on column km_event.fkr_cand_long  is ''Статус Кандидат в ФКР длится XXX календарных (или рабочих) дней'' ';

      execute immediate 
            'alter table km_event add constraint km_event_pk primary key (id_event)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk01 foreign key (id_event_calendar)
                  references km_event_calendar (id_event_calendar)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk02 foreign key (id_event_result)
                  references cd_event_result (id_event_result)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk03 foreign key (id_event_status)
                  references km_event_status (id_event_status)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk04 foreign key (id_executor)
                  references users (id_user)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk05 foreign key (id_confirmation_type)
                  references cd_confirmation_type (id_confirmation_type)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk06 foreign key (id_document_type)
                  references documents_type (id_document_type)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk07 foreign key (id_document_group)
                  references document_group (id_group)';
      execute immediate 
            'alter table km_event
                  add constraint km_event_fk08 foreign key (id_doc)
                  references appfiles (unid)';
      execute immediate
            'alter table km_event 
                  add constraint km_event_fk09 foreign key (id_source_doc)
                  references cd_km_source_doc (id_source_doc)';
      execute immediate
            'alter table km_event
                  add constraint km_event_fk10 foreign key (id_punitive_measure)
                  references punitive_measure (id_measure)';
      execute immediate
            'alter table km_event
                  add constraint km_event_fk11 foreign key (id_sanction_doc)
                  references appfiles (unid)';
      execute immediate
            'alter table km_event
                  add constraint km_event_fk12 foreign key (id_sanction_refused_doc)
                  references appfiles (unid)';
   end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'km_event_seq';
    if counter = 0 then
     execute immediate 'create sequence km_event_seq nocycle order nocache';
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_fkr_status';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_fkr_status
            (
              id_fkr_status number(38) not null,
              status    varchar2(50)
            )
            ';
      execute immediate
        'comment on table km_fkr_status is ''Статус ФКР'' ';
      execute immediate 
            'alter table km_fkr_status add constraint km_fkr_status_pk primary key (id_fkr_status)';
      end;
   end if;
end;
/
delete from km_fkr_status;
insert into km_fkr_status (id_fkr_status, status) values (1, 'выявлен');
insert into km_fkr_status (id_fkr_status, status) values (2, 'выявлен ошибочно');
insert into km_fkr_status (id_fkr_status, status) values (3, 'признан существенным');
insert into km_fkr_status (id_fkr_status, status) values (4, 'признан несущественным');
insert into km_fkr_status (id_fkr_status, status) values (5, 'урегулирован');
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_fkr';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_fkr
            (
              id_fkr          number(38) not null,
              id_fkr_type     number(38) not null,
              id_event        number(38),
              id_organization char(12),
              id_mdtask       number(38),
              notes           varchar2(2048),
              created         date,
              finished        date,
              is_significant  number(38) not null,
              id_fkr_status   number (38) not null default 1,
              who             varchar2(128),
              id_doc          varchar2(128),
              reg_reason      varchar2(2048)
            )
            ';
      execute immediate
        'comment on table KM_FKR is ''Экземпляры ФКР. ФКР связан с Клиентом или со Сделкой напрямую или через KM_EVENT'' ';
      execute immediate 'comment on column KM_FKR.id_fkr_type is ''Тип ФКР'' ';
      execute immediate 'comment on column KM_FKR.id_event is ''Привязка к событию мониторинга'' ';
      execute immediate 'comment on column KM_FKR.id_organization is ''Привязка к Клиенту'' ';
      execute immediate 'comment on column KM_FKR.id_mdtask is ''Привязка к Сделке'' ';
      execute immediate 'comment on column KM_FKR.notes is ''Описание ФКР''';
      execute immediate 'comment on column KM_FKR.created is ''Дата возникнования ФКР''';
      execute immediate 'comment on column KM_FKR.finished is ''Дата разрешения ФКР''';
      execute immediate 'comment on column KM_FKR.is_significant is ''Признак существенности''';
      execute immediate 'comment on column KM_FKR.id_fkr_status is ''Статус ФКР''';
      execute immediate 'comment on column KM_FKR.who is ''Кто выявил ФКР''';
      execute immediate 'comment on column KM_FKR.id_doc is ''Основание выявления ФКР[вложение документа, ссылка на appfiles]''';
      execute immediate 'comment on column KM_FKR.reg_reason is ''Основание для урегулирования ФКР''';

      execute immediate 
            'alter table KM_FKR add constraint KM_FKR_PK primary key (ID_FKR)';
      execute immediate 
            'alter table KM_FKR
              add constraint KM_FKR_CRM_ORG_FK foreign key (ID_ORGANIZATION)
              references CRM_ORGANIZATION (ID_ORG)';
      execute immediate 
            'alter table KM_FKR
                  add constraint km_fkr_fk01 foreign key (ID_EVENT)
                  references KM_EVENT (ID_EVENT) on delete set null';
      execute immediate 
            'alter table KM_FKR
                  add constraint km_fkr_fk02 foreign key (ID_FKR_TYPE)
                  references cd_FKR_TYPE (ID_FKR_TYPE)';
      execute immediate 
            'alter table KM_FKR
                  add constraint km_fkr_fk03 foreign key (ID_MDTASK)
                  references MDTASK (ID_MDTASK)';
      execute immediate 
            'alter table KM_FKR
                  add constraint km_fkr_fk04 foreign key (id_fkr_status)
                  references km_fkr_status (id_fkr_status)';
      execute immediate 
            'alter table km_fkr
                  add constraint km_fkr_fk05 foreign key (id_doc)
                  references appfiles (unid)';
      end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'km_fkr_seq';
    if counter = 0 then
     execute immediate 'create sequence km_fkr_seq nocycle order nocache';
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'km_fkr_status_change';
    if counter = 0 then 
    begin
        execute immediate
            'create table km_fkr_status_change
            (
              id              number(38) not null,
              id_fkr          number(38) not null,
              notes           varchar2(1048),
              who             varchar2(128),
              id_doc          varchar2(128),
              accepted        date,
              id_fkr_status   number (38) default 1 not null
            )
            ';
      execute immediate 'comment on table km_fkr_status_change is ''Изменение статуса ФКР'' ';
      execute immediate 'comment on column km_fkr_status_change.id_fkr is ''Ссылка на ФКР'' ';
      execute immediate 'comment on column km_fkr_status_change.notes is ''Комментарий к изменению статуса ФКР''';
      execute immediate 'comment on column km_fkr_status_change.who is ''Кем принято решение''';
      execute immediate 'comment on column km_fkr_status_change.id_doc is ''Основание [вложение документа, ссылка на appfiles]''';
      execute immediate 'comment on column km_fkr_status_change.accepted is ''Дата принятия решения по изменению статуса ФКР''';
      execute immediate 'comment on column km_fkr_status_change.id_fkr_status is ''Новый статус ФКР''';
      
      execute immediate 
            'alter table km_fkr_status_change add constraint km_fkr_sc_pk primary key (id)';
      execute immediate 
            'alter table km_fkr_status_change
              add constraint km_fkr_sc_fk01 foreign key (id_fkr)
              references km_fkr (id_fkr)';
      execute immediate 
            'alter table km_fkr_status_change
                  add constraint km_fkr_sc_fk02 foreign key (id_doc)
                  references appfiles (unid)';
      execute immediate 
            'alter table km_fkr_status_change
                  add constraint km_fkr_sc_fk03 foreign key (id_fkr_status)
                  references km_fkr_status (id_fkr_status)';
      end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'km_fkr_sc_seq';
    if counter = 0 then
     execute immediate 'create sequence km_fkr_sc_seq nocycle order nocache';
   end if;
end;
/