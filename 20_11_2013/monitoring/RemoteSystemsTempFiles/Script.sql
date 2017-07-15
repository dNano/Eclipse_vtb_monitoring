--<ScriptOptions statementTerminator=";"/>

CREATE TABLE R_EVENTTYPE_PUNITIVE (
		ID_EVENT_TYPE NUMBER(38 , 0) NOT NULL,
		ID_MEASURE NUMBER(38 , 0) NOT NULL
	);

CREATE UNIQUE INDEX R_ETPM_PK ON R_EVENTTYPE_PUNITIVE (ID_EVENT_TYPE ASC, ID_MEASURE ASC);

ALTER TABLE R_EVENTTYPE_PUNITIVE ADD CONSTRAINT R_ETPM_PK PRIMARY KEY (ID_EVENT_TYPE, ID_MEASURE);

ALTER TABLE R_EVENTTYPE_PUNITIVE ADD CONSTRAINT R_ETPM_FK02 FOREIGN KEY (ID_MEASURE)
	REFERENCES PUNITIVE_MEASURE (ID_MEASURE)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE R_EVENTTYPE_PUNITIVE ADD CONSTRAINT R_ETPM_FK01 FOREIGN KEY (ID_EVENT_TYPE)
	REFERENCES CD_EVENT_TYPE (ID_EVENT_TYPE)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
	
insert into R_EVENTTYPE_PUNITIVE values(2, 46);	
insert into R_EVENTTYPE_PUNITIVE values(2, 47);	
insert into R_EVENTTYPE_PUNITIVE values(2, 52);	
insert into R_EVENTTYPE_PUNITIVE values(3, 51);	
insert into R_EVENTTYPE_PUNITIVE values(10103, 57);	

select * from R_EVENTTYPE_PUNITIVE
select * from CD_EVENT_TYPE
select * from PUNITIVE_MEASURE

   select pm.id_measure pm_id, name_measure pm_name, pm.sumdesc pm_sum_desc
            	from punitive_measure pm
            	inner join r_eventtype_punitive etp on pm.id_measure = etp.id_measure
            	inner join cd_event_type et on et.id_event_type = etp.id_event_type
            	where et.id_event_type = 1