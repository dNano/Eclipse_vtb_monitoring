-- полное пересоздание таблиц компендиума, используемых в Мониторинге...
begin
    PKG_DDL_UTILS.DROP_OBJECT('R_CONDITION_EVENTTYPE');
    PKG_DDL_UTILS.DROP_OBJECT('R_EVENT_GROUP_CONTRACTOR_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('R_EVENT_SET_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('R_KM_SOURCE_DOC_EVENT_GROUP');
    PKG_DDL_UTILS.DROP_OBJECT('KM_TYPE_DAY_OF_WEEK');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR'); 
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_GROUP_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_GROUP');
    PKG_DDL_UTILS.DROP_OBJECT('KM_LOG_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_LOG');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EXCEPTION_DAY_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EXCEPTION_DAY');
    PKG_DDL_UTILS.DROP_OBJECT('KM_SOURCE_DOC');
    PKG_DDL_UTILS.DROP_OBJECT('KM_SOURCE_DOC_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_GROUP_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_GROUP');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_STATUS_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_STATUS');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_SET_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_SET');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_RESULT_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_RESULT');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_DAY_OF_WEEK');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_CALENDAR_DATES');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_CALENDAR_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_CALENDAR');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT');
    PKG_DDL_UTILS.DROP_OBJECT('KM_DOC_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_DOC');
    PKG_DDL_UTILS.DROP_OBJECT('KM_DAY_OF_WEEK_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_DAY_OF_WEEK');
    PKG_DDL_UTILS.DROP_OBJECT('km_CONFIRMATION_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('km_CONFIRMATION_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('km_repeat_type');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('KM_MONITORED_OBJECT');
    PKG_DDL_UTILS.DROP_OBJECT('KM_MONTH');
    PKG_DDL_UTILS.DROP_OBJECT('TMP_KM_MONITORED_OBJECT_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_STATUS');
end;
/
begin
    PKG_DDL_UTILS.DROP_OBJECT('cd_CONFIRMATION_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_DAY_OF_WEEK_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_DOC_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_CALENDAR_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_RESULT_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_SET_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_STATUS_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EVENT_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_EXCEPTION_DAY_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_LOG_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_GROUP_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('KM_FKR_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('R_EGCT_SEQ');
end;
/
begin
    PKG_DDL_UTILS.DROP_OBJECT('r_type_day_of_week');
    PKG_DDL_UTILS.DROP_OBJECT('R_CONDITION_EVENTTYPE');
    PKG_DDL_UTILS.DROP_OBJECT('R_EVENT_SET_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('r_event_contractor_type');
    
    PKG_DDL_UTILS.DROP_OBJECT('CD_EVENT_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('CD_EVENT_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('cd_event_group_seq');
    PKG_DDL_UTILS.DROP_OBJECT('cd_event_group');
    PKG_DDL_UTILS.DROP_OBJECT('cd_monitored_object');

    PKG_DDL_UTILS.DROP_OBJECT('cd_CONFIRMATION_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('cd_CONFIRMATION_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('cd_repeat_type');
    PKG_DDL_UTILS.DROP_OBJECT('cd_day_of_week');

    PKG_DDL_UTILS.DROP_OBJECT('cd_EVENT_SET_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('cd_EVENT_SET');
    PKG_DDL_UTILS.DROP_OBJECT('cd_month');
    
    PKG_DDL_UTILS.DROP_OBJECT('cd_event_result');
    
    PKG_DDL_UTILS.DROP_OBJECT('cd_FKR_TYPE_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('cd_FKR_TYPE');
    PKG_DDL_UTILS.DROP_OBJECT('cd_FKR_GROUP_SEQ');
    PKG_DDL_UTILS.DROP_OBJECT('cd_FKR_GROUP');
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_monitored_object';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_monitored_object
             (
              id   number(1) not null,
              name varchar2(64) not null
             )
            ';
      execute immediate
         'comment on table cd_monitored_object is ''Классификатор мероприятий. Уровень 1. Тип объекта'' ';
      execute immediate 
         'alter table cd_monitored_object add constraint cd_monitored_object_type_pk primary key (id)';
    end;
   end if;
end;
/
delete from cd_MONITORED_OBJECT;
insert into cd_MONITORED_OBJECT (id, name) values (1, 'Контрагент');
insert into cd_MONITORED_OBJECT (id, name) values (2, 'Сделка');
insert into cd_MONITORED_OBJECT (id, name) values (3, 'Обеспечение');
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_event_group';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_event_group
             (
              id_event_group   number(38) not null,
              event_group_name varchar2(256) not null,
              class            number(1),
              class_descr      varchar2(256),
              id_object_type   number(38)
             )
            ';
      execute immediate
         'comment on table cd_EVENT_GROUP is ''Группа типов контрольных меропрятий (КМ). Каждый тип КМ входит в ту или иную группу (одну)'' ';
      execute immediate 
         'comment on column cd_EVENT_GROUP.class is ''Класс: 0 - Мониторинг. 1 - Операции, связанные с правами.обязательствами банка. По отношению к заключенным сделкам'' ';
      execute immediate 
         'comment on column cd_EVENT_GROUP.class_descr is ''Дублирует EVENT_GROUP_SIGN (не создаем отдельную таблицу)'' ';
      execute immediate 
      'alter table cd_event_group add constraint cd_event_group_pk primary key (id_event_group)';   
      execute immediate 
         'alter table cd_event_group add constraint cd_event_group_fk01 foreign key (id_object_type) references cd_monitored_object (id)';
   end;
   end if;
end;
/
delete from cd_EVENT_GROUP;
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10017, 'Прочие условия', 0, '1', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (1, 'Мониторинг групп взаимосвязанных Контрагентов', 0, 'Мониторинг', 1);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (2, 'Мониторинг финансового состояния и рейтинга Контрагента', 0, 'Мониторинг', 1);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (3, 'Мониторинг факторов отраслевого риска', 0, 'Мониторинг', 1);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (4, 'Мониторинг прочих факторов, связанных с деятельностью контрагента (Мониторинг деятельности Клиентов с позиций экономической и репутационной безопасности Банка)', 0, 'Мониторинг', 1);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (5, 'Мониторинг платежных обязательств по Сделке', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (6, 'Мониторинг неплатежных обязательства Контрагента', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (7, 'Мониторинг целевого использования кредита', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (8, 'Мониторинг  операций по банковскому счету Контрагента', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (9, 'Мониторинг залогового обеспечения', 0, 'Мониторинг', 3);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10, 'Мониторинг с целью планового изменения параметров Сделки', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (11, 'Заключение Д/С с Контрагентами по Сделке', 1, 'Операции, связанные с правами/ обязательствами Банка', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (12, 'Заключение Д/С с третьими лицами (сторонними организациями)', 1, 'Операции, связанные с правами/ обязательствами Банка', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10003, 'Дополнительные условия', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10004, 'Индивидуальные условия', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10005, 'Отклонения от установленных стандартов', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10001, 'Отлагательные условия заключения сделки', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10002, 'Отлагательные условия использования средств', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10009, 'Отлагательные условия открытия аккредитива / выдачи гарантии', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10006, 'Прочие дефолтные условия', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10007, 'Стоимостные параметры сделки', 0, 'Мониторинг', 2);
insert into cd_EVENT_GROUP (id_event_group, event_group_name, class, class_descr, id_object_type) values (10008, 'Целевое назначение', 0, 'Мониторинг', 2);
commit;
/
begin
   pkg_ddl_utils.recreate_sequence_for_table('cd_event_group', 'id_event_group', 'cd_event_group_seq');
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_CONFIRMATION_TYPE';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_CONFIRMATION_TYPE
             (
                id_confirmation_type number(38) not null,
                confirmation_type    varchar2(1024) not null,
                is_doc               number(1) not null
             )
            ';
      execute immediate
         'comment on table cd_CONFIRMATION_TYPE is ''Виды подтверждения исполнения КМ'' ';
      execute immediate 
         'comment on column cd_CONFIRMATION_TYPE.is_doc is ''является ли документом: 1 - да, 0 - нет'' ';
      execute immediate 
         'alter table cd_CONFIRMATION_TYPE add constraint cd_CONFIRMATION_TYPE_pk primary key (id_confirmation_type)';
   end;
   end if;
end;
/
delete from cd_CONFIRMATION_TYPE;
insert into cd_CONFIRMATION_TYPE (id_confirmation_type, confirmation_type, is_doc) values (1, 'Документ  Контрагента', 1);
insert into cd_CONFIRMATION_TYPE (id_confirmation_type, confirmation_type, is_doc) values (2, 'Документ Банка', 1);
insert into cd_CONFIRMATION_TYPE (id_confirmation_type, confirmation_type, is_doc) values (3, 'Договор, соглашение', 1);
insert into cd_CONFIRMATION_TYPE (id_confirmation_type, confirmation_type, is_doc) values (4, 'Прочие документы', 1);
insert into cd_CONFIRMATION_TYPE (id_confirmation_type, confirmation_type, is_doc) values (5, 'Только отметка об исполнении КМ', 0);
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_repeat_type';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_repeat_type
             (
               id_repeat_type number(38) not null,
               repeat_type    varchar2(64) not null
             )
            ';
      execute immediate
         'comment on table cd_repeat_type is ''Тип периодичности исполнения мероприятия'' ';
      execute immediate 
         'alter table cd_repeat_type add constraint cd_repeat_type_pk primary key (id_repeat_type)';
   end;
   end if;
end;
/
delete from cd_repeat_type;
insert into cd_repeat_type (id_repeat_type, repeat_type) values (1, 'однократно');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (2, 'ежедневно');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (3, 'еженедельно');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (4, 'ежемесячно');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (5, 'ежеквартально');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (6, 'каждые полгода');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (7, 'ежегодно');
insert into cd_repeat_type (id_repeat_type, repeat_type) values (8, 'набор дат');
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_event_type';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_event_type
             (
              id_event_type                 number(38) not null,
              event_type_name               varchar2(1024) not null,
              id_event_group                number(38) not null,              
              id_confirmation_type          number(38),
              id_documents_type             number(38),
              id_punitive_measure           number(38),
              id_repeat_type                number(38),
              id_query_creation             number(38),
              id_km_creation                number(38),
              id_km_execution               number(38),
              id_km_approval                number(38),           
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
              event_cause                   varchar2(1024),
              cause_doc_number              varchar2(50),
              cause_doc_date                date,
              is_sanction_possible          number(38),
              cp_stage                      varchar2(1024),
              crf_process                   varchar2(1024),
              drf_process                   varchar2(1024),
              id_role                       number(38),
              standard                      number(1) default 0 not null,
              fkr_cand_long                 number(3) default 10 not null,
              is_active                     varchar2(1)
             )
            ';
       execute immediate
         'comment on table cd_EVENT_TYPE is ''Тип контрольного меропрятия (КМ). Поля типа КМ используются как значения по умолчанию при создании экземпляра КМ -пользователем.'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.event_type_name is ''Наименование мероприятия'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.id_repeat_type is ''Тип периодичности'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.repeat_period is ''Повторять каждый XXX день (неделю, месяц)'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.repeat_period_kind is ''День месяца 01...31'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.notify_period is ''Периодичность нотификации (в днях): '' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.notify_period_kind is ''За сколько дней начать информировать о наступлении мероприятия'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.is_sanction_possible is ''Возможны санкции: 0 -- нет, 1 - да'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.cp_stage is ''Этап кредитного процесса. Пока - текст. Что потом, посмотрим.'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.crf_process is ''Вызывает ФКР (если не NULL) Имя подпроцесса или набора мероприятий'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.drf_process is ''Вызывает ФЗР. Имя подпроцесса или набора мероприятий'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.id_query_creation is ''Формирование запроса о проведении КМ [Ссылка на подразделение\группу, пока не решено, куда и не используется]'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.id_km_creation is ''[Ссылка на подразделение\группу, пока не решено, куда и не используется]'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.id_km_execution is ''[Ссылка на подразделение\группу, пока не решено, куда и не используется]'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.id_km_approval is ''[Ссылка на подразделение\группу, пока не решено, куда и не используется]'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.repeat_period_weekend  is ''учет выходных в периодичности: 0 - после, 1 - перед, 2 - точно'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.repeat_period_weekend_exclude is ''флаг Исключать выходные в периодичности (для еженедельной): 0 - не исключать, 1 - исключать'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.notify_at_day  is ''Информировать в день мероприятия'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.notify_after is ''Продолжить информировать после даты мероприятия, при неисполнении'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.notify_link_msg  is ''Включать ссылку на мероприятие в текст сообщения'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.id_role  is ''Роль, могущая работать с данным мероприятием'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.standard  is ''стандартное мероприятие - 1, нестандартное - 0'' ';
      execute immediate
         'comment on column cd_EVENT_TYPE.fkr_cand_long  is ''Статус Кандидат в ФКР длится XXX календарных (или рабочих) дней'' ';
      execute immediate
          'alter table cd_event_type add constraint cd_event_type_pk primary key (id_event_type)';
      execute immediate
          'alter table cd_event_type
          add constraint cd_event_type_fk01 foreign key (id_event_group)
          references cd_event_group (id_event_group)';
      execute immediate
          'alter table cd_event_type
          add constraint cd_event_type_fk02 foreign key (id_confirmation_type)
          references cd_CONFIRMATION_TYPE (id_confirmation_type)';
      execute immediate
          'alter table cd_event_type
          add constraint cd_event_type_fk03 foreign key (id_repeat_type)
          references cd_repeat_type (id_repeat_type)';
      execute immediate
          'alter table cd_event_type
          add constraint cd_event_type_fk04 foreign key (id_role)
          references cps_role (id_role)';
   end;
   end if;
end;
/
delete from cd_EVENT_TYPE;
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10151, 'тест', null, null, null, 3, 15, 12, null, null, 12, 4, null, null, null, null, 11, null, null, null, null, null, null, null, '1', 0, 1, 1, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10143, 'Контроль выполнения мероприятий календарного плана реализации проекта, показателей бизнес-плана и т.д.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 6, null, null, null, null, null, null, null, '0', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10142, 'Анализ финансового состояния ГСЗ ', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null, null, null, '0', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10146, 'тест', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 2, null, null, null, null, null, null, null, '0', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10147, 'тест', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1, null, null, null, null, null, null, null, '0', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10148, 'Мониторинг факторов отраслевого риска', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 3, null, null, null, null, null, null, null, '0', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (1, 'Заключение Договора залога', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 11, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (2, 'Заключение Договора поручительства', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 11, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (3, 'Заключение Кредитного соглашения между Банком и гос.организацией', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 12, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (4, 'Заключение Кредитного соглашения между Банком и другой кредитной организацией', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 12, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (5, 'Актуализация состава групп взаимосвязанных Клиентов', null, null, null, null, 1, 0, 0, 0, 2, 0, null, null, null, 0, 1, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (6, 'Расчет рейтинга Клиента', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 2, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (7, 'Проведение отраслевого анализа', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 3, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (8, 'Проверка Клиента подразделением по обеспечению безопасности', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 4, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (9, 'Контроль оплаты процентов, комиссии', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10, 'Контроль частичного/полного погашения основного долга', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (11, 'Контроль оплаты неустоек/штрафов', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (12, 'Контроль возмещения Принципалом суммы платежа, выплаченной по банковской гарантии', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (13, 'Контроль возмещения Приказодателем суммы платежа по аккредитиву, произведенному Банком за счет собственных средств', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (14, 'Контроль предоставления Клиентом документов – финансовой отчетности и пр. документов для целей определения фин.положения и рейтинга Клиента', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (15, 'Контроль предоставления Клиентом документов, связанных с условиями Сделки', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (16, 'Контроль выполнения мероприятий  календарного плана реализации проекта, показателей бизнес-плана и иных обязательств по инвестиционным проектам', null, null, null, null, 1, 0, 0, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (17, 'Заключение договоров/доп. соглашений между Банком, Клиентом и третьими лицами', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (18, 'Контроль соблюдения необходимого уровня финансовых показателей', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (19, 'Контроль целевого использования кредита', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 7, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (20, 'Контроль выполнения обязательств по оборотам по счету Клиента', null, null, null, null, 1, 0, 0, 0, 2, 0, null, null, null, 0, 8, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (21, 'Контроль динамики оборотов по счету Клиента', null, null, null, null, 1, 0, 0, 0, 2, 0, null, null, null, 0, 8, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (22, 'Контроль поступления выручки по финансируемым контрактам', null, null, null, null, 1, 0, 0, 0, 2, 0, null, null, null, 0, 8, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (23, 'Контроль наличия, состояния и условий хранения предмета залога', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (24, 'Контроль количества обремененных акций, учтенных Депозитарием', null, null, null, null, 1, 0, 0, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (25, 'Контроль наступления события Margin call по заложенным ценным бумагам', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (26, 'Изменение %% ставки', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 11, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (27, 'Изменение суммы Сделки (основного долга) при капитализации %%', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 10, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (28, 'Изменение Лимита овердрафта', null, null, null, null, 0, 0, 0, 0, 2, 0, null, null, null, 0, 10, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10128, 'Предоставление в Банк один раз в полгода (начиная с даты заключения договора о залоге) обновленного отчета об оценке предмета залога. Согласование обновленных отчетов с подразделением по анализу рисков', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10130, 'Контроль обеспечения соотношения EBITDA/(interest+debt) не менее х', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10129, 'Контроль за состоянием долговой нагрузки заемщика/ принципала/ приказодателя/ Группы путем оценки соблюдения установленной величины соотношения EBITDA/ (Interest+debt)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10131, 'Предоставление форм бухгалтерской и прочей отчетности не позднее 10- го числа месяца, следующего за отчетным', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10132, 'Контроль погашения задолженности по основному долгу по ранее предоставленному кредиту/кредитам в сумме использования не позднее даты использования кредитных средств', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10116, 'Согласование первого отчета надзорной компании с подразделением по анализу рисков ГО', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10114, 'Назначение надзорной компании', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10115, 'Согласование надзорной компании и технического задания на осуществление надзора с Подразделением по анализу рисков ГО', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10117, 'При оформлении кредитной и обеспечительной документации на иностранном языке инициирующее подразделение обеспечивает предоставление перевода текста кредитной и обеспечительной документации', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10118, 'При заключении сделки с нерезидентами - предоставление служебной записки Юридического департамента о согласовании заключения внешних юридических консультантов по вопросам правоспособности нерезидентов', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10119, 'Открытие заемщиком / приказодателем / принципалом (кроме физических лиц) расчетного счетав Банке и предоставление Банку права безакцептного списания с данного счета', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10120, 'Предоставление заемщиком документов, в соответствии с которыми может быть определено, проконтролировано и подтверждено целевое использование кредитных средств', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10121, 'Подтверждение Казначейством соблюдения  норматива Н6 по группе компаний, взаимосвязанных с основным заемщиком', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10122, 'Открытие в Банке паспорта сделки по Договору (в случаях предусмотренных законодательством)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10123, 'Сроки использования по кредитам, кредитным линиям с лимитом выдачи могут превышать 14 дней с даты заключения кредитного соглашения', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10004, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10124, 'Предоставление в Банк документов, подтверждающих право собственности на  приобретенное имущество и передачу имущества залогодателю', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10125, 'Предоставление документов, подтверждающих оплату имущества', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10126, 'Регистрация залога имущества в органах Гостехнадзора', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10127, 'Все расчеты по  финансируемым контрактам должны проводиться через счета в Банке', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 8, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10112, 'Предоставление финансовой отчетности за последний отчетный период', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10113, 'Предоставление документов по правовому статусу Клиента', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10083, 'Предоставление документов, подтверждающих полномочия лиц, подписывающих кредитную и обеспечительную документацию со стороны клиента', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10084, 'Предоставление нотариально удостоверенного согласия залогодателя на внесудебный порядок обращения взыскания на имущество в случаях, предусмотренных законодательством Российской Федерации,', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10085, 'Если рыночная стоимость предмета залога определяется на основании оценки независимого оценщика – предоставление приемлемого для Банка отчета об оценке предмета залога. ', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10086, 'Категория качества ссуды и приравненной ссудной задолженности - не хуже 2 категории.', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 2, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10087, 'Предоставление в Банк справки  ФНС России, подтверждающей отсутствие задолженности и недоимки перед федеральным бюджетом, бюджетами субъектов Российской Федерации, местными бюджетами в размере более 5% чистых активов.', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10088, 'Предоставление в Банк справок из ПФР и Фонда социального страхования Российской Федерации, подтверждающих отсутствие задолженности и недоимки перед внебюджетными фондами в размере более 5% чистых активов.', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10089, 'Предоставление решений уполномоченных органов управления заемщика/ залогодателя/ поручителя/ принципала/приказодателя - третьих лиц об одобрении (совершении) сделок/ согласий собственников имущества ', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10090, 'Предоставление письма за подписью уполномоченного лица заемщика/ залогодателя/ поручителя/ принципала/приказодателя о получении/ неполучении заемщиком/ залогодателем/ поручителем/ принципалом/приказодателем добровольных или обязательных предложений в соответствии со статей 84.1. и 84.2. Федерального закона «Об акционерных обществах» если сумма сделки составляет 10% и более балансовой стоимости активов общества, определенной по данным бухгалтерской отчетности на последнюю отчетную дату (для открытых акционерных обществ),', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10001, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10091, 'Вступление в силу договора/договоров поручительства с указанным лицом/лицами', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10092, 'Передача в Банк паспорта транспортного средства (при залоге автотранспортных средств)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10093, 'Предоставление  документов, подтверждающих регистрацию залога тракторов, самоходных дорожно-строительных и иных машин и прицепов к ним, регистрируемых органами государственного надзора за техническим состоянием самоходных машин и других видов техники в Российской Федерации ', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10094, 'Вступление в силу кредитного соглашения между фондирующим банком и Банком, если при проведении расчетов предусматривается привлечение внешнего фондирования', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10095, 'Предоставление Заемщиком документов, в соответствии с которыми может быть определено, проконтролировано и подтверждено целевое использование кредитных средств', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 7, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10096, 'Уплата комиссии/комиссий, срок уплаты которых установлен ранее или в дату предоставления кредита/ открытия кредитной линии/ открытия аккредитива/выдачи гарантии', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10134, 'Тестовое отлагательное условие открытия аккредетива', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10009, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10135, 'Еще одно тестовое отлагательное условие. Выдачи гарантии...', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10009, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10099, 'Подписание кредитного соглашения, регулирующего предоставление кредита/кредитной линии на цели формирования покрытия для осуществления платежа по аккредитиву (отлагательное условие открытия аккредитива)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10100, 'Государственная регистрация договора об ипотеке (при кредитовании/предоставлении гарантии/открытии непокрытого аккредитива с отсрочкой платежа под залог объектов недвижимости)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10101, 'Вступление в силу договора/договоров о залоге (при кредитовании/предоставлении гарантии/открытии непокрытого аккредитива под залог иного имущества)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10102, 'Открытие в Банке паспорта сделки в случаях, установленных действующим валютным законодательством Российской Федерации', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10103, 'Нотариальное удостоверение договора о залоге', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10104, 'Страхование предмета залога с назначением Банка выгодоприобретателем и предоставление в Банк договора/полиса страхования и копий документов, подтверждающих оплату страховой премии', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 9, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10105, 'Предоставление заявления Клиента на открытие аккредитива', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 10002, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10106, 'Контроль ежемесячного (ежеквартального) кредитового оборота по счетам в Банке в таком объеме, чтобы его доля в суммарных кредитовых оборотах заемщика в банках соответствовала доле задолженности заемщика перед Банком в общей сумме задолженности заемщика перед банками.', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10107, 'Клиент обязуется предоставлять не позднее 10 рабочего дня каждого месяца (первого месяца квартала): детализированную выписку о кредитовых оборотах заемщика по расчетным/валютным счетам во всех банках за отчетный (предыдущий) месяц (квартал) либо расшифровку балансовых счетов 51, 52 за соответствующий период, заверенную печатью организации и подписью главного бухгалтера;', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 6, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10108, 'Контроль поддержания ежемесячного (ежеквартального) кредитового оборота по счетам в Банке в размере: не менее ___ % от среднемесячных совокупных поступлений (за период мес.)', null, null, null, null, 0, 0, 2, 0, 2, 0, null, null, null, 0, 5, null, null, null, null, null, null, null, '1', 0, 0, 0, 0, 0);
insert into cd_EVENT_TYPE (id_event_type, event_type_name, id_confirmation_type, id_documents_type, id_punitive_measure, id_repeat_type, repeat_period, repeat_period_kind, due_date_period, due_date_period_kind, notify_period, notify_period_kind, event_cause, cause_doc_number, cause_doc_date, is_sanction_possible, id_event_group, cp_stage, crf_process, drf_process, id_query_creation, id_km_creation, id_km_execution, id_km_approval, is_active, repeat_period_weekend, repeat_period_weekend_exclude, notify_at_day, notify_after, notify_link_msg)
values (10149, 'Анализ финансового состояния Группы Связанных Заемщиков', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 2, null, null, null, null, null, null, null, '0', 0, 0, 0, 0, 0);
commit;
begin
    pkg_ddl_utils.recreate_sequence_for_table('cd_event_type', 'id_event_type', 'cd_event_type_seq');
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_repeat_type';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_repeat_type
             (
               id_repeat_type number(38) not null,
               repeat_type    varchar2(64) not null
             )
            ';
      execute immediate
         'comment on table cd_repeat_type is ''Тип периодичности исполнения мероприятия'' ';
      execute immediate 
         'alter table cd_repeat_type add constraint cd_repeat_type_pk primary key (id_repeat_type)';
   end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_condition_eventtype';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_condition_eventtype
             (
               id_condition  number(38) not null,
               id_event_type number(38) not null
             )
            ';
      execute immediate
         'comment on table r_condition_eventtype is ''Связь условий с классификатормо контрольных мероприятий'' ';
      execute immediate 
         'alter table r_condition_eventtype
          add constraint r_condition_pk primary key (id_condition, id_event_type)';
      execute immediate 
         'alter table r_condition_eventtype
            add constraint r_condition_fk01 foreign key (id_condition)
            references condition (id_condition)';
      execute immediate 
         'alter table r_condition_eventtype
            add constraint r_condition_fk02 foreign key (id_event_type)
            references cd_event_type (id_event_type)';
     end;
   end if;
end;
/
-- TODO : remove from VTB version!!!
delete from R_CONDITION_EVENTTYPE;
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (83, 10083);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (84, 10084);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (85, 10085);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (86, 10086);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (87, 10087);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (88, 10088);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (89, 10089);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (90, 10090);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (91, 10091);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (92, 10092);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (93, 10093);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (94, 10094);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (95, 10095);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (96, 10096);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (99, 10099);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (100, 10100);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (101, 10101);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (102, 10102);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (103, 10103);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (104, 10104);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (105, 10105);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (106, 10106);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (107, 10107);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (108, 10108);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (112, 10112);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (113, 10113);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (114, 10114);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (115, 10115);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (116, 10116);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (117, 10117);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (118, 10118);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (119, 10119);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (120, 10120);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (121, 10121);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (122, 10122);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (123, 10123);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (124, 10124);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (125, 10125);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (126, 10126);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (127, 10127);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (128, 10128);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (129, 10129);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (130, 10130);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (131, 10131);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (132, 10132);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (134, 10134);
insert into R_CONDITION_EVENTTYPE (id_condition, id_event_type) values (135, 10135);
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_day_of_week';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_day_of_week
            (
              id_day_of_week number(38) not null,
              day_of_week    varchar2(12)
            )
            ';
      execute immediate
         'comment on table cd_day_of_week is ''ДНИ НЕДЕЛИ.'' ';
      execute immediate 
         'alter table cd_day_of_week add constraint cd_day_of_week_PK primary key (ID_DAY_OF_WEEK)';
     end;
   end if;
end;
/
delete from cd_day_of_week;
insert into cd_day_of_week (id_day_of_week, day_of_week) values (1, 'Понедельник');
insert into cd_day_of_week (id_day_of_week, day_of_week) values (2, 'Вторник');
insert into cd_day_of_week (id_day_of_week, day_of_week) values (3, 'Среда');
insert into cd_day_of_week (id_day_of_week, day_of_week) values (4, 'Четверг');
insert into cd_day_of_week (id_day_of_week, day_of_week) values (5, 'Пятница');
insert into cd_day_of_week (id_day_of_week, day_of_week) values (6, 'Суббота');
insert into cd_day_of_week (id_day_of_week, day_of_week) values (7, 'Воскресенье');
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_type_day_of_week';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_type_day_of_week
            (
              id_event_type  number(38) not null,
              id_day_of_week number(38) not null
            )
            ';
      execute immediate
         'comment on table r_type_day_of_week is ''join таблица, связывающая cd_event_type и cd_day_of_week.'' ';
      execute immediate 
         'alter table r_type_day_of_week add constraint r_type_day_of_week_pk primary key (id_event_type, id_day_of_week)';
      execute immediate 
         'alter table r_type_day_of_week
              add constraint cd_type_day_fk01 foreign key (id_day_of_week)
              references cd_day_of_week (id_day_of_week)';
      execute immediate 
         'alter table r_type_day_of_week
              add constraint cd_type_day_fk02 foreign key (id_event_type)
              references cd_event_type (id_event_type)';
     end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'r_type_day_of_week_seq';
    if counter = 0 then
     execute immediate 'create sequence r_type_day_of_week_seq nocycle order nocache';
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_event_set';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_event_set
            (
              id_event_set   number(38) not null,
              event_set_name varchar2(256)
            )
            ';
      execute immediate
         'comment on table cd_EVENT_SET is ''Набор КМ - именованный набор типов КМ, используемый для одновременного ввода в систему нескольких КМ, связанных со сделкой или другим бизнес – объектом.'' ';
      execute immediate 
         'alter table cd_event_set  add constraint cd_event_set_pk primary key (id_event_set)';
     end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'cd_event_set_seq';
    if counter = 0 then
     execute immediate 'create sequence cd_event_set_seq nocycle order nocache';
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_event_set_type';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_event_set_type
            (
              id_event_set  number(38) not null,
              id_event_type number(38) not null
            )
            ';
      execute immediate
         'comment on table r_event_set_type is ''Список контрольных мероприятий из классификатора, входящих в набор КМ.'' ';
      execute immediate 
         'alter table r_event_set_type add constraint r_event_set_type_pk primary key (id_event_set, id_event_type)';
      execute immediate 
         'alter table r_event_set_type
              add constraint r_event_set_fk1 foreign key (id_event_set)
              references cd_event_set (id_event_set)';
      execute immediate 
         'alter table r_event_set_type
              add constraint r_event_set_fk2 foreign key (id_event_type)
              references cd_event_type (id_event_type)';
   end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_month';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_month
            (
              id_month number(38) not null,
              month    varchar2(20) not null
            )
            ';
      execute immediate
         'comment on table cd_month is ''Месяцы года'' ';
      execute immediate 
         'comment on column cd_month.month is ''название месяца'' ';
      execute immediate 
         'alter table cd_month add constraint cd_month_pk primary key (id_month)';
   end;
   end if;
end;
/
delete from cd_month;
insert into cd_month (id_month, month) values (1, 'Январь');
insert into cd_month (id_month, month) values (2, 'Февраль');
insert into cd_month (id_month, month) values (3, 'Март');
insert into cd_month (id_month, month) values (4, 'Апрель');
insert into cd_month (id_month, month) values (5, 'Май');
insert into cd_month (id_month, month) values (6, 'Июнь');
insert into cd_month (id_month, month) values (7, 'Июль');
insert into cd_month (id_month, month) values (8, 'Август');
insert into cd_month (id_month, month) values (9, 'Сентябрь');
insert into cd_month (id_month, month) values (10, 'Октябрь');
insert into cd_month (id_month, month) values (11, 'Ноябрь');
insert into cd_month (id_month, month) values (12, 'Декабрь');
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_fkr_group';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_fkr_group
                (
                  id_fkr_group   number(38) not null,
                  fkr_group      varchar2(256) not null
                )
            ';
      execute immediate
        'comment on table cd_FKR_GROUP is ''Группы типов ФКР'' ';
      execute immediate
        'comment on column cd_FKR_GROUP.FKR_GROUP  is ''Текстовое описание группы ФКР''';
      execute immediate 'alter table cd_FKR_GROUP add constraint cd_fkr_group_pk primary key (ID_FKR_GROUP)';
   end;
   end if;
  
   select count(*) into counter from user_objects where lower(object_name) = 'cd_fkr_group_seq';
    if counter = 0 then
     execute immediate 'create sequence cd_fkr_group_seq nocycle order nocache';
   end if;
end;
/
delete from cd_FKR_GROUP;
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (1, 'Финансовое состояние и рейтинг Клиента');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (2, 'Платежные обязательства по Кредитной сделке');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (3, 'Целевое использование кредита');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (4, 'Операции по банковскому счету Клиента');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (5, 'Неплатежные обязательства Клиента');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (6, 'Платежные обязательства Клиента (за исключением платежных обязательств по Кредитной сделке)');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (7, 'События, связанные с деятельностью Клиента');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (8, 'Факторы залогового риска');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (9, 'Факторы отраслевого риска');
insert into cd_FKR_GROUP (id_fkr_group, fkr_group) values (10, 'Прочие факторы');
commit;
begin
   pkg_ddl_utils.recreate_sequence_for_table('cd_fkr_group', 'id_fkr_group', 'cd_fkr_group_seq');
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_fkr_type';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_fkr_type
			(
			  id_fkr_type    number(38) not null,
			  fkr_type       varchar2(2048) not null,
			  id_fkr_group   number(38),
			  fkr_code       varchar2(32),
			  fkr_kind       number(38),
			  is_significant number(38) not null,
			  is_active      number(38) default 1 not null
			)
            ';
      execute immediate 
          'comment on table cd_FKR_TYPE is ''Тип ФКР'' ';
      execute immediate 
          'comment on column cd_FKR_TYPE.fkr_type is ''Текстовое описание ФКР'' ';
      execute immediate 
          'comment on column cd_FKR_TYPE.fkr_code is ''Код ФКР в соответствии с ТЗ'' ';
      execute immediate 
          'comment on column cd_FKR_TYPE.fkr_kind is ''ФКР - 0, ФЗР (устарело) - 1'' ';
      execute immediate 
          'comment on column cd_FKR_TYPE.is_significant is ''Признак существенности'' ';
      execute immediate 
          'comment on column cd_FKR_TYPE.is_active is ''Признак активности'' ';
      execute immediate 
         'alter table cd_FKR_TYPE add constraint cd_FKR_TYPE_PK primary key (ID_FKR_TYPE)';
      execute immediate 
         'alter table cd_FKR_TYPE
			  add constraint cd_fkr_type_fk01 foreign key (ID_FKR_GROUP)
			  references cd_FKR_GROUP (ID_FKR_GROUP)';
    end;
   end if;
   select count(*) into counter from user_objects where lower(object_name) = 'cd_fkr_type_seq';
    if counter = 0 then
     execute immediate 'create sequence cd_fkr_type_seq nocycle order nocache';
   end if;
end;
/
delete from cd_FKR_TYPE;
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (1, 'Ухудшение категории качества ссудной и приравненной к ней задолженности Клиента/элемента расчета базы резерва на возможные потери до IV или V категории.', 1, '1.1.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (2, 'Ухудшение категории качества ссудной и приравненной к ней задолженности Клиента/элемента расчета базы резерва на возможные потери до III категории.', 1, '1.2.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (3, 'Снижение (расчетного) рейтинга Клиента до рейтинга «Е».', 1, '1.3.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (4, 'Снижение (расчетного) рейтинга Клиента более чем на 15 баллов* и присвоение нового расчетного рейтинга от «С3» до «D3».', 1, '1.4.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (5, 'Возникновение у Клиента просроченной задолженности перед другими кредитными организациями сроком более 3-х дней.', 1, '1.7.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (6, 'Возникновение у Клиента просроченной задолженности перед налоговыми органами, фондами в сумме более 10% чистых активов Клиента', 1, '1.8.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (7, 'Возникновение у Клиента просроченной задолженности перед контрагентами (кроме налоговых органов и кредитных организаций) в сумме более 30% от общей суммы соответствующей задолженности и более 2% валюты баланса', 1, '1.9.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (8, 'Возникновение у Клиента просроченной дебиторской задолженности в сумме более 30% от общей суммы дебиторской задолженности и более 2% валюты баланса', 1, '1.10.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (9, 'Рост задолженности по кредитам и займам(с учетом внебалансовых обязательств кредитного характера), за исключением Кредитных сделок с Банком, на 30% по сравнению с предыдущей отчетной датой', 1, '1.11.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (10, 'Снижение выручки более чем на 20%, по сравнению с выручкой за аналогичный период прошлого года (1 квартал, 1  полугодие, 9 месяцев, год)', 1, '1.12.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (11, 'Обращение Заемщика с просьбой о пролонгации кредита в связи с отсутствием источников для погашения задолженности в срок', 1, '1.13', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (12, 'Ухудшение имущественного состояния Клиента вследствие форс-мажорных обстоятельств (пожар, наводнение, землетрясение и т.п.)', 1, '1.14.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (13, 'Просроченная задолженность по погашению основного долга (транша) перед Банком по Кредитной сделке', 2, '2.1.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (14, 'Просроченная задолженность по уплате процентов / комиссий перед Банком по Кредитной сделке в сумме свыше 300 000 руб. (или эквивалент в валюте)', 1, '2.2.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (15, 'Просроченная задолженность по уплате неустойки перед Банком по Кредитной сделке', 2, '2.3.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (16, 'Неоплата Принципалом / Приказодателем суммы комиссии/вознаграждения и иных платежей по выданной Банком гарантии / открытому аккредитиву', 2, '2.4.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (17, 'Невозмещение Принципалом суммы платежа, выплаченной по банковской гарантии', 2, '2.5.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (18, 'Невозмещение Приказодателем суммы платежа по аккредитиву, произведенному Банком за счет собственных средств', 2, '2.6.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (19, 'Нецелевое использование Клиентом кредитных средств', 3, '3.1.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (20, 'Невыполнение обязательства по поддержанию оборотов по счету Клиента в Банке, предусмотренное в рамках Кредитной сделки', 4, '4.1.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (21, 'Снижение уровня оборотов  за месяц по счету Клиента в Банке по сравнению с предыдущим месяцем более чем на 20%', 4, '4.2.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (22, 'Снижающаяся динамика оборотов по счету Клиента в Банке за 3 последних месяца более 30%', 4, '4.3.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (23, 'Задержка исполнения контракта на срок свыше 30 календарных дней или аннулирование контракта в рамках проекта/внешнеэкономической сделки, выручка по которому является источником погашения Кредитной сделки', 4, '4.4.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (24, 'Непредставление Клиентом финансовой отчетности   на 10 рабочий день от даты, установленной Кредитной документацией', 5, '5.1.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (25, 'Неисполнение иных дополнительных условий Кредитной сделки, за исключением указанных в п.5.1 и 5.5', 5, '5.2.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (26, 'Непредставление документов по требованию Банка', 5, '5.3.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (27, 'Невыполнение мероприятий, заявленных Клиентом на стадии рассмотрения Кредитной заявки (нарушение сроков календарного плана реализации проекта свыше 30 календарных дней, невыполнение показателей бизнес-плана свыше 10% от запланированной величины и иных существенных обязательств, в случае если отклонения при выполнении мероприятий ранее не были одобрены Уполномоченным органом/ Уполномоченным лицом Банка)', 5, '5.4.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (28, 'Нарушение Клиентом установленных условиями Кредитной сделки финансовых ковенант, а также непредставление в Банк необходимой информации (нераскрытие информации в публичных источниках) для расчета соответствующих показателей ', 5, '5.5.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (29, 'Предъявление инкассовых требований и исполнительных листов к счетам Клиентов, открытым в Банке, и/или наложение ареста на денежные средства, находящиеся на указанных выше счетах, в размере, превышающем 5% валюты баланса и/или 10 % чистых активов на последнюю отчетную дату.', 6, '6.1.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (30, 'Предъявление инкассовых требований и исполнительных листов к счетам Клиентов, открытым в других кредитных организациях, и/или наложение ареста на денежные средства, находящиеся на указанных выше счетах, в размере, превышающем 5% валюты баланса и/или 10 % чистых активов на последнюю отчетную дату.', 6, '6.2.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (31, 'Приостановление операций по счетам Клиента, открытым в Банке, уполномоченными государственными органами', 6, '6.3.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (32, 'Приостановление операций по счетам Клиента, открытым в других кредитных организациях, уполномоченными государственными органами', 6, '6.4.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (33, 'В отношении Клиента возбуждено дело о банкротстве или подано в суд заявление о признании Клиента несостоятельным (банкротом)', 7, '7.1.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (34, 'В отношении Клиента возбуждено дело об отзыве лицензии, разрешающей осуществление профилирующей для Клиента деятельности', 7, '7.2.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (35, 'Арест или принятие иных запретительных мер в отношении имущества Клиента (за исключением случаев, указанных в п.п. 6.1-6.4)', 7, '7.3.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (36, 'В отношении Клиента подан иск в суд на сумму, превышающую 10% чистых активов Клиента на последнюю отчетную дату', 7, '7.4.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (37, 'Возбуждение уголовного дела в отношении руководящих лиц и/или акционеров/участников Клиента, владеющих более 5% акций/долей уставного капитала', 7, '7.5.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (38, 'Начало процесса реорганизации Клиента (в случае если процесс реорганизации ранее не согласован Уполномоченным органом/ Уполномоченным лицом Банка).', 7, '7.6.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (39, 'Начало процесса ликвидации ', 7, '7.7.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (40, 'Частая смена руководящего состава', 7, '7.8.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (41, 'Наличие негативной информации о деловой репутации Клиента', 7, '7.9.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (42, 'Выявление обстоятельств, которые могут свидетельствовать о возникновении корпоративного спора или о возможности «недружественного слияния/ поглощения»', 7, '7.10', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (43, 'Риск акционерного капитала Клиента (смена основного акционера/учредителя, выход из группы компаний, вхождение в другую группу компаний, иное связанное с переделом долей (более 50%) владения компанией Клиента)', 7, '7.11.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (44, 'Уклонение руководителей Клиента от контактов с представителями Банка', 7, '7.12.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (45, 'Предоставление Клиентом искаженной, недостоверной информации', 7, '7.13.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (46, 'Изменение тарифного и таможенного регулирования, оказывающего существенное влияние на результат деятельности Клиента ', 7, '7.14.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (47, 'Прекращение отношений с контрагентом, занимающим существенную долю (более 25%) в товарообороте (предоставлении услуг)', 7, '7.15.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (48, 'Кризисные явления на рынке деятельности Клиента, негативные тенденции в развитии конкуренции и др.', 9, '9.1.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (49, 'Факты направления в Федеральную службу по финансовому мониторингу (ФСФМ) сведений о подозрительных операциях', 10, '10.1.', 1, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (50, 'Отсутствие по месту фактического нахождения, заявленному Банку,  постоянно действующего органа управления Клиента, иного органа или лица, которые имеют право действовать от имени юридического лица без доверенности', 10, '10.2.', 0, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (51, 'Невозможность связаться по контактным телефонам и факсам с Клиентом  в течение 3-х рабочих дней', 10, '10.3.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (52, 'Неисполнение обязательств юридических лиц и/или физических лиц, являющихся связанными с Клиентами Банка, перед третьими лицами', 10, '10.4.', 0, 0, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (53, 'Иные существенные события, которые могут повлиять на исполнение обязательств Клиента', 10, '10.5.', 1, 1, 1);
insert into cd_FKR_TYPE (id_fkr_type, fkr_type, id_fkr_group, fkr_code, fkr_kind, is_significant, is_active)
values (54, 'Иные события, которые могут повлиять на исполнение обязательств Клиента', 10, '10.6.', 0, 0, 1);
commit;
begin
   pkg_ddl_utils.recreate_sequence_for_table('cd_fkr_type', 'id_fkr_type', 'cd_fkr_type_seq');
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
delete from KM_EVENT_STATUS;
insert into KM_EVENT_STATUS (id_event_status, event_status) values (1, 'Ожидает обработки');
insert into KM_EVENT_STATUS (id_event_status, event_status) values (2, 'В работе');
insert into KM_EVENT_STATUS (id_event_status, event_status) values (3, 'Исполнено');
insert into KM_EVENT_STATUS (id_event_status, event_status) values (4, 'Отменено');
insert into KM_EVENT_STATUS (id_event_status, event_status) values (5, 'Приостановлено');
commit;
begin 
    PKG_DDL_UTILS.DROP_OBJECT('cd_event_result');
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'cd_event_result';
    if counter = 0 then 
    begin
        execute immediate
            'create table cd_event_result
                (
                  id_event_result   number(38) not null,
                  id_event          NUMBER(1) not null,
                  event_result      varchar2(1024) not null,
                  comment_mandatory number(1),
                  process_crf       number(1),
                  sanction          number(1)
                )
            ';
      execute immediate
        'comment on table cd_EVENT_RESULT is ''Справочник Результаты исполнения мероприятий'' ';
      execute immediate
        'comment on column cd_EVENT_RESULT.id_event is ''Ссылка на таблицу статусов исполнения мероприятия'' ';
      execute immediate
        'comment on column cd_EVENT_RESULT.comment_mandatory is ''обязателен ли комментарий [карточка контрольного мероприятия]: 1 - да, 0 - нет'' ';
      execute immediate
        'comment on column cd_EVENT_RESULT.process_crf is ''Выполняется ли обработка ФКР: 1 - да, 0 - нет'' ';
      execute immediate
        'comment on column cd_EVENT_RESULT.sanction is ''Применимы ли санкции: 1 - да, 0 - нет'' ';
      execute immediate 'alter table cd_EVENT_RESULT add constraint cd_EVENT_RESULT_PK primary key (ID_EVENT_RESULT)';
      execute immediate 
         'alter table cd_event_result 
              add constraint cd_event_result_fk01 foreign key (id_event)
              references km_event_status (id_event_status)';
   end;
   end if;
end;
/
delete from cd_event_result;
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (1, 'Замечаний и ФКР не выявлено', null, null, null, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (2, 'Выявлены замечания, санкции не применяются', 1, null, null, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (3, 'По выявленным фактам применяются штрафные санкции', null, null, 1, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (4, 'Выявлены ФКР, без санкций', 1, 1, null, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (5, 'Выявлены ФКР, применяются санкции', 1, 1, 1, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (6, 'Отменено', 1, null, null, 4);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (7, 'Приостановлено', 1, null, null, 5);
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_event_contractor_type';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_event_contractor_type
			(
			  id_event_type      number(38) not null,
			  id_contractor_type number(38) not null
			)
            ';
      execute immediate
        'comment on table r_event_contractor_type is ''Связующая таблица типов мероприятий и типов контрагентов'' ';
      execute immediate
        'alter table r_event_contractor_type
			  add constraint r_ect_fk01 foreign key (id_event_type)
			  references cd_event_type (id_event_type)';
      execute immediate
        'alter table r_event_contractor_type
              add constraint r_ect_fk02 foreign key (id_contractor_type)
              references contractor_type (id_contractor_type)';
   end;
   end if;
end;
/
commit;
drop table CD_KM_SOURCE_DOC cascade constraints;
create table CD_KM_SOURCE_DOC
(
  id_source_doc    NUMBER(38) not null,
  source_name      VARCHAR2(256) not null,
  type             NUMBER(1) not null,
  type_txt         VARCHAR2(256) not null,
  id_cond_category NUMBER(38)
);
comment on table CD_KM_SOURCE_DOC is 'Источники – основания для мероприятий';
comment on column CD_KM_SOURCE_DOC.source_name is 'Источник-основание для создания мероприятий';
comment on column CD_KM_SOURCE_DOC.type is 'Тип источника. 0 - Д/С, 1 - ОРД';
comment on column CD_KM_SOURCE_DOC.type_txt is 'Дубль поля TYPE в виде текста';
comment on column CD_KM_SOURCE_DOC.id_cond_category is 'Ссылка на категорию условия';
alter table CD_KM_SOURCE_DOC add constraint CD_KM_SOURCE_DOC_PK primary key (id_source_doc);
alter table CD_KM_SOURCE_DOC add constraint CD_KM_SOURCE_DOC_FK1 foreign key (ID_COND_CATEGORY)
  references CONDITION_TYPES (ID_TYPE);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (1, 'Кредитное соглашение (Дополнительные условия)', 0, 'Д/С', 3);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (2, 'Кредитное соглашение (Стоимостные параметры сделки)', 0, 'Д/С', 7);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (3, 'Кредитное соглашение (Отлагательные условия использования средств)', 0, 'Д/С', 2);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (4, 'Кредитное соглашение (Цели кредитования)', 0, 'Д/С', 8);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (5, 'Кредитное соглашение (Прочие условия)', 0, 'Д/С', 6);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (6, 'Договор залога', 0, 'Д/С', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (7, 'Договор поручительства', 0, 'Д/С', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (8, 'Другие договорные документы', 0, 'Д/С', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (9, 'Инструкция о порядке проведения мониторинга кредитных сделок', 1, 'ОРД', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (10, 'Методические указания по проведению мониторинга заложенного имущества', 1, 'ОРД', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (11, 'Решения УО/УЛ', 1, 'ОРД', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (12, 'Другие ОРД', 1, 'ОРД', null);
insert into CD_KM_SOURCE_DOC (id_source_doc, source_name, type, type_txt, id_cond_category)
values (13, 'Инструкция о порядке проведения мониторинга кредитных сделок', 1, 'ОРД', null);
commit;
drop table r_source_doc_event_group cascade constraints;
create table r_source_doc_event_group
(
  id             number(38) not null,
  id_event_group number(38) not null,
  id_source_doc  number(38) not null
);
comment on table r_source_doc_event_group
  is 'Соответствие между CD_KM_SOURCE_DOC и km_event_group';
alter table r_source_doc_event_group
  add constraint r_km_source_group_pk primary key (id);
alter table r_source_doc_event_group
  add constraint fk2 foreign key (id_source_doc)
  references cd_km_source_doc (id_source_doc);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (1, 2, 9);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (2, 4, 9);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (3, 3, 9);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (4, 1, 9);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (5, 5, 2);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (6, 5, 1);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (7, 6, 1);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (8, 7, 4);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (9, 8, 1);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (10, 10, 2);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (11, 10, 1);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (12, 9, 10);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (13, 11, 1);
insert into R_SOURCE_DOC_EVENT_GROUP (id, id_event_group, id_source_doc) values (14, 12, 11);
commit;
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_eventtype_punitive';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_eventtype_punitive
             (
               id_event_type number(38) not null,
               id_measure number(38) not null
             )
            ';
      execute immediate
         'comment on table r_eventtype_punitive is ''Штрафные санкции контрольного мероприятия'' ';
      execute immediate 
         'alter table r_eventtype_punitive
          add constraint r_etpm_pk primary key (id_event_type, id_measure)';
      execute immediate 
         'alter table r_eventtype_punitive
            add constraint r_etpm_fk01 foreign key (id_event_type)
            references cd_event_type (id_event_type)';
      execute immediate 
         'alter table r_eventtype_punitive
            add constraint r_etpm_fk02 foreign key (id_measure)
            references punitive_measure (id_measure)';
     end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_eventtype_fkr';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_eventtype_fkr
             (
               id_event_type number(38) not null,
               id_fkr_type number(38) not null
             )
            ';
      execute immediate
         'comment on table r_eventtype_fkr is ''ФКР, которые может вызвать контрольное мероприятие'' ';
      execute immediate 
         'alter table r_eventtype_fkr
          add constraint r_etfkr_pk primary key (id_event_type, id_fkr_type)';
      execute immediate 
         'alter table r_eventtype_fkr
            add constraint r_etfkr_fk01 foreign key (id_event_type)
            references cd_event_type (id_event_type)';
      execute immediate 
         'alter table r_eventtype_fkr
            add constraint r_etfkr_fk02 foreign key (id_fkr_type)
            references cd_fkr_type (id_fkr_type)';
     end;
   end if;
end;
/
declare
    counter int;
begin
    select count(*) into counter from user_objects where lower(object_name) = 'r_eventtype_roles';
    if counter = 0 then 
    begin
        execute immediate
            'create table r_eventtype_roles
             (
               id_event_type number(38) not null,
               id_role number(38) not null
             )
            ';
      execute immediate
         'comment on table r_eventtype_roles is ''Роли, исполняющие контрольное мероприятие'' ';
      execute immediate 
         'alter table r_eventtype_roles
          add constraint r_etrls_pk primary key (id_event_type, id_role)';
      execute immediate 
         'alter table r_eventtype_roles
            add constraint r_etrls_fk01 foreign key (id_event_type)
            references cd_event_type (id_event_type)';
      execute immediate 
         'alter table r_eventtype_roles
            add constraint r_etrls_fk02 foreign key (id_role)
            references cps_role (id_role)';
     end;
   end if;
end;
/