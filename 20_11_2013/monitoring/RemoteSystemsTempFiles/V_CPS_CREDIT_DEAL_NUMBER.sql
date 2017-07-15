--<ScriptOptions statementTerminator=";"/>

CREATE VIEW V_CPS_CREDIT_DEAL_NUMBER (ID_MDTASK, OFFICIAL_DATE, OFFICIAL_NUMBER, DOC_CONTRACTOR_NUMBER, ID_CREDIT_DOCUMENTATION, ID_COMMON_DEAL_CONCLUSION) 
WITH CASCADED CHECK OPTION;


select count(m.ID_MDTASK) from V_CPS_CREDIT_DEAL m
                            	inner join crm_organization o on m.id_borrower = o.id_org
                            	left outer join v_cps_credit_deal_number i on m.id_mdtask = i.id_mdtask
                            	where m.IS_MDTASK_CONFIRMED = 1 and m.MDTASK_TYPE_KEY = 'DEAL'

select * from V_CPS_DEAL_CONTRACTOR where rownum < 10

select * from users where rownum < 10

select * from users where login='adminwf'                            	