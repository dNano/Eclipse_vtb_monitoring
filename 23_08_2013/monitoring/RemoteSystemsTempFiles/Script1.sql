--<ScriptOptions statementTerminator=";"/>

CREATE TABLE TMP_KM_EVENT_INSTANCE (
		ID NUMBER(38 , 0) NOT NULL,
		EXECUTOR_ID NUMBER(38 , 0),
		PLAN_DATE TIMESTAMP(11),
		EVENT_ID NUMBER(38 , 0) NOT NULL
	);

CREATE UNIQUE INDEX TMP_KM_EVENT_INSTANCE_PK ON TMP_KM_EVENT_INSTANCE (ID ASC);

ALTER TABLE TMP_KM_EVENT_INSTANCE ADD CONSTRAINT TMP_KM_EVENT_INSTANCE_PK PRIMARY KEY (ID);

ALTER TABLE TMP_KM_EVENT_INSTANCE ADD CONSTRAINT TMP_KM_EVENT_INSTANCE_FK02 FOREIGN KEY (EVENT_ID)
	REFERENCES KM_EVENT_CALENDAR (ID_EVENT_CALENDAR)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;


select v.crmid, v.ORGANIZATIONNAME, t.id_contractor_type, t.name_contractor_type
from 
(SELECT r.ID_R, r.ID_CRMORG 
FROM R_ORG_MDTASK r where ID_MDTASK= ? and rownum < 2
order by ID_R ) d
left outer join v_organisation v on v.crmid = d.ID_CRMORG
left outer join r_contractor_type_mdtask rt on rt. id_r = d.id_r
left outer join contractor_type t on t.id_contractor_type = rt.id_contractor_type
where rownum < 2
order by t.id_contractor_type
[01.04.2013 10:09:18] Кузнецов Михаил: вяжется по id_mdtask к сделке.
Возвращает всегда одну строку. Реально ситуация сложнее, но мы ее сейчас опустим. 

Отобразить в списке "По сделке" два поля: имя клиента  и его тип
