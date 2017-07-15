--<ScriptOptions statementTerminator=";"/>

--CREATE VIEW V_CED_CREDIT_DEAL (MDTASK_TYPE, ID_MDTASK, CRM_CODE, MDTASK_SUM_CURRENCY, ID_PUP_PROCESS, INIT_DEPARTMENT, MDTASK_NUMBER, MDTASK_SUM, PERIOD, MDTASK_PLANNED_AGREEMENT_DATE, STATUS_RETURN, USE_DATE, VALID_TO, STATUS_RETURN_DATE, ID_STATUS, ID_TYPE_PROCESS, IS_MDTASK_ENDED, IS_MDTASK_CONFIRMED, IS_MDTASK_CREDIT_DEAL, IS_CREDIT_LINE, DESCRIPTION_PROCESS, STATUS, INIT_DEPARTMENT_SHORT_NAME, PRODUCT_NAME, FULL_BORROWER_NAME, BORROWER_NAME) 
--WITH CASCADED CHECK OPTION;
select count(*) from mdtask

select * from V_CED_CREDIT_DEAL where crm_code is not null

select m.ID_MDTASK d_id, m.MDTASK_NUMBER d_spkp_number, m.MDTASK_SUM d_amount, m.CURRENCY C_CODE,
		m.VALIDTO di_date, r.id_opp_type dt_id, p.name dt_name,
   		(select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK) fkr_count 
from MDTASK m
   		left outer join R_MDTASK_OPP_TYPE r on m.ID_MDTASK = r.ID_MDTASK
   		left outer join v_spo_product p on r.id_opp_type = p.productId
    where exists (select id_event_calendar from KM_EVENT_CALENDAR e where e.id_mdtask = m.id_mdtask)


select m.ID_MDTASK d_id, m.MDTASK_NUMBER d_spkp_number, m.MDTASK_SUM d_amount, m.MDTASK_SUM_CURRENCY C_CODE,
		m.VALID_TO di_date, -1 dt_id, m.MDTASK_TYPE dt_name,
   		(select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK) fkr_count
from V_CED_CREDIT_DEAL m
where rownum < 10

