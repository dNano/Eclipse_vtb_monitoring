-- тестовые данные!!!
delete from KM_EVENT_CALENDAR;
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (0, 'Актуализация состава групп взаимосвязанных Клиентов', null, 22596, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-1, 'Актуализация состава групп взаимосвязанных Клиентов', null, 22848, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-2, 'Актуализация состава групп взаимосвязанных Клиентов', null, 22873, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-3, 'Актуализация состава групп взаимосвязанных Клиентов', null, 23035, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-4, 'Актуализация состава групп взаимосвязанных Клиентов', null, 23080, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-5, 'Актуализация состава групп взаимосвязанных Клиентов', null, 23079, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-6, 'Актуализация состава групп взаимосвязанных Клиентов', null, 22813, null, null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);

delete from KM_FKR;
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (1, 1, 23035, 1, 'temp note 1');
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (2, 2, 23035, 0, 'temp note 2');
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (3, 3, 22813, 1, 'temp note 3');
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (4, 4, 22873, 0, 'temp note 4');
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (5, 5, 22813, 1, 'temp note 5');
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (6, 6, 22813, 0, 'temp note 6');
insert into KM_FKR (id_fkr, id_fkr_type, id_mdtask, is_significant, notes) values (8, 8, 23080, 1, 'temp note 7');

insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-7, 'Актуализация состава групп взаимосвязанных Клиентов', null, null, '16UJ9A004QWP', null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-8, 'Актуализация состава групп взаимосвязанных Клиентов', null, null, 'A6UJ9A004QPW', null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);
insert into KM_EVENT_CALENDAR (id_event_calendar, event_name, id_event_parent, id_mdtask, id_organization, id_dep_create, id_dep_exec, id_event_type, id_repeat_type, repeat_period, repeat_period_kind, repeat_period_weekend, repeat_period_weekend_exclude, due_date_period, due_date_period_kind, notify_period, notify_period_kind, notify_at_day, notify_after, notify_link_msg, start_date, end_date, confirmation_type, documents_type, sanction_text)
values (-9, 'Актуализация состава групп взаимосвязанных Клиентов', null, null, 'A6UJ1A004QWP', null, null, 5, null, null, null, 0, 0, null, null, null, null, 0, 0, 0, null, null, null, null, null);

insert into r_eventtype_fkr
select id_event_type, 3 as id_fkr_type
from cd_event_type;
insert into r_eventtype_fkr
select id_event_type, 13 as id_fkr_type
from cd_event_type;

insert into r_eventtype_roles
select id_event_type, 48 as id_role
from cd_event_type;
insert into r_eventtype_roles
select id_event_type, 49 as id_role
from cd_event_type;
insert into r_eventtype_roles
select id_event_type, 56 as id_role
from cd_event_type;
insert into r_eventtype_roles
select id_event_type, 57 as id_role
from cd_event_type;

commit;
