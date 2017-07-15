--<ScriptOptions statementTerminator=";"/>

CREATE TABLE R_EVENTTYPE_FKR (
		ID_EVENT_TYPE NUMBER(38 , 0) NOT NULL,
		ID_FKR_TYPE NUMBER(38 , 0) NOT NULL
	);

CREATE UNIQUE INDEX R_ETFKR_PK ON R_EVENTTYPE_FKR (ID_EVENT_TYPE ASC, ID_FKR_TYPE ASC);

ALTER TABLE R_EVENTTYPE_FKR ADD CONSTRAINT R_ETFKR_PK PRIMARY KEY (ID_EVENT_TYPE, ID_FKR_TYPE);

ALTER TABLE R_EVENTTYPE_FKR ADD CONSTRAINT R_ETFKR_FK01 FOREIGN KEY (ID_EVENT_TYPE)
	REFERENCES CD_EVENT_TYPE (ID_EVENT_TYPE)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE R_EVENTTYPE_FKR ADD CONSTRAINT R_ETFKR_FK02 FOREIGN KEY (ID_FKR_TYPE)
	REFERENCES CD_FKR_TYPE (ID_FKR_TYPE)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
	
	insert into R_EVENTTYPE_FKR values(10103, 3);
	insert into R_EVENTTYPE_FKR values(10103, 13);
	
	  select ft.id_fkr_type ft_id, ft.fkr_code || ' ' || ft.fkr_type ft_name,
			ft.fkr_kind ft_kind, ft.is_significant ft_is_significant,
			fg.id_fkr_group fg_id, fg.fkr_group fg_name
	  from cd_fkr_type ft
	  		inner join cd_fkr_group fg on ft.id_fkr_group = fg.id_fkr_group
	  		inner join r_eventtype_fkr etf on ft.id_fkr_type = etf.id_fkr_type
			inner join cd_event_type et on et.id_event_type = etf.id_event_type
	  where ft.id_fkr_group = 3 and et.id_event_type = 10103
	 	order by ft_name

select * from R_EVENTTYPE_FKR
select * from CD_EVENT_TYPE
select * from CD_FKR_TYPE
select * from cd_fkr_group

select id_fkr_group fg_id, fkr_group fg_name from cd_fkr_group
  	where id_fkr_group in
  	(
	  	select id_fkr_group from cd_fkr_type ft
	  	inner join r_eventtype_fkr etf on ft.id_fkr_type = etf.id_fkr_type
		inner join cd_event_type et on et.id_event_type = etf.id_event_type
		where et.id_event_type = 10103
	)
 	order by fkr_group