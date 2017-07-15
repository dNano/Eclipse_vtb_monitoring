--<ScriptOptions statementTerminator=";"/>

select * from (select FILENAME, DATE_OF_ADDITION, FILEtype, row_number() over (order by DATE_OF_ADDITION desc) rn from APPFILES) where rn < 10

select count(*) from V_CED_CREDIT_DEAL where product_name = 'Кредит'

select count(*) from cd_FKR_TYPE

select * from km_event e
	inner join km_event_calendar c on c.id_event_calendar = e.id_event_calendar
	
	select * from users where rownum < 5

select * from V_ORGANISATION where rownum < 5

    select kf.id_fkr KF_ID, kf.notes KF_NOTE, kf.is_significant IS_SIGNIFICANT,
    	   ft.id_fkr_type FT_ID, ft.fkr_type FT_NAME,
           row_number() over (order by ft.fkr_type desc) rn
      from KM_FKR kf
      	   inner join  cd_fkr_type ft on kf.id_fkr_type = ft.id_fkr_type
      where kf.id_organization = '1' 

   select id_fkr_group fg_id, fkr_group fg_name
              from cd_fkr_group
             	order by fkr_group
             	
    select id_fkr_type ft_id, fkr_type ft_name
      from cd_fkr_type
     	order by fkr_type                             	

select * from KM_FKR 
delete from KM_FKR where id_mdtask=22195
select * from cd_FKR_TYPE
select * from cd_fkr_group

select count(id_event) from km_event e
	inner join km_event_calendar c on c.id_event_calendar = e.id_event_calendar
where c.id_mdtask = 1

select m.ID_MDTASK d_id, m.MDTASK_NUMBER d_spkp_number, m.MDTASK_SUM d_amount, m.MDTASK_SUM_CURRENCY C_CODE,
		m.VALID_TO di_date, -1 dt_id, m.PRODUCT_NAME dt_name, m.BORROWER_NAME co_name,
   		(select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK) fkr_count,
   		(select count(id_event) from km_event e
					inner join km_event_calendar c on c.id_event_calendar = e.id_event_calendar
					where c.id_mdtask = m.ID_MDTASK and e.executed_date is null
						and e.plan_date < sysdate) expared_count,
   		row_number() over (order by m.ID_MDTASK) rn
from V_CED_CREDIT_DEAL m
where m.IS_MDTASK_CONFIRMED = 1 and m.IS_MDTASK_CREDIT_DEAL = 1

--insert into APPFILES(UNID, FILENAME, FILEDATA, FILETYPE, ID_OWNER, OWNER_TYPE, WHO_ADD, DATE_OF_ADDITION, ID_GROUP, ID_DOCUMENT_TYPE) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)


--CREATE TABLE APPFILES (
		UNID VARCHAR2(128) NOT NULL,
		FILENAME VARCHAR2(256),
		FILEDATA BLOB,
		FILETYPE VARCHAR2(256),
		ID_OWNER VARCHAR2(64),
		OWNER_TYPE NUMBER(22 , 0),
		WHO_ADD NUMBER(22 , 0),
		DATE_OF_ADDITION DATE,
		DATE_OF_EXPIRATION DATE,
		ISACCEPTED NUMBER(22 , 0),
		WHOACCEPTED NUMBER(22 , 0),
		DATE_OF_ACCEPT DATE,
		SIGNATURE BLOB,
		ID_APPL NUMBER(22 , 0),
		ID_GROUP NUMBER(22 , 0),
		FORCC CHAR(1) DEFAULT 'y',
		CONTENTTYPE VARCHAR2(256) DEFAULT 'application/octet-stream'  NOT NULL,
		ID_DOCUMENT_TYPE NUMBER(38 , 0) DEFAULT null,
		FILEURL VARCHAR2(512),
		WHO_DEL NUMBER(22 , 0),
		DATE_OF_DEL DATE,
		ACCEPT_SIGNATURE BLOB
	);

CREATE INDEX APPFILES_FK03_I ON APPFILES (ID_DOCUMENT_TYPE ASC);

CREATE INDEX APPFILES_FK2_I ON APPFILES (WHOACCEPTED ASC);

CREATE INDEX APPFILES_FK1_I ON APPFILES (WHO_ADD ASC);

CREATE INDEX APPFILES_FK4_I ON APPFILES (ID_GROUP ASC);

CREATE UNIQUE INDEX PK_APPFILES ON APPFILES (UNID ASC);

ALTER TABLE APPFILES ADD CONSTRAINT PK_APPFILES PRIMARY KEY (UNID);

ALTER TABLE APPFILES ADD CONSTRAINT APPFILES_FK03 FOREIGN KEY (ID_DOCUMENT_TYPE)
	REFERENCES DOCUMENTS_TYPE (ID_DOCUMENT_TYPE)
	ON DELETE SET NULL
	ON UPDATE CASCADE;

ALTER TABLE APPFILES ADD CONSTRAINT APPFILES_FK2 FOREIGN KEY (WHOACCEPTED)
	REFERENCES USERS (ID_USER)
	ON DELETE SET NULL
	ON UPDATE CASCADE;

ALTER TABLE APPFILES ADD CONSTRAINT APPFILES_FK1 FOREIGN KEY (WHO_ADD)
	REFERENCES USERS (ID_USER)
	ON DELETE SET NULL
	ON UPDATE CASCADE;

ALTER TABLE APPFILES ADD CONSTRAINT APPFILES_FK4 FOREIGN KEY (ID_GROUP)
	REFERENCES DOCUMENT_GROUP (ID_GROUP)
	ON DELETE SET NULL
	ON UPDATE CASCADE;

