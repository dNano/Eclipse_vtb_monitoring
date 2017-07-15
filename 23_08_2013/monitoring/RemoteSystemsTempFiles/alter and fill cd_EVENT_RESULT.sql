select id_event_result er_id, event_result er_name, id_event kes_id, comment_mandatory er_comment_mandatory from cd_event_result

alter table cd_EVENT_RESULT add (id_event  number(38))

insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (1, 'Замечаний, ФКР, ФЗР не выявлено', null, null, null, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (2, 'Выявлены замечания, санкции не применяются', 1, null, null, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (3, 'По выявленным фактам применяются штрафные санкции', null, null, 1, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (4, 'Выявлены ФКР/ФЗР, без санкций', 1, 1, null, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (5, 'Выявлены ФКР/ФЗР, применяются санкции', 1, 1, 1, 3);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (6, 'Отменено', 1, null, null, 4);
insert into CD_EVENT_RESULT (id_event_result, event_result, comment_mandatory, process_crf, sanction, id_event)
values (7, 'Приостановлено', 1, null, null, 5);


select UNID, OWNER_TYPE from APPFILES where rownum < 5