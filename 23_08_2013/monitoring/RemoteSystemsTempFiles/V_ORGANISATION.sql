--<ScriptOptions statementTerminator=";"/>

--CREATE VIEW V_ORGANISATION (SPOID, CRMID, ORGANIZATIONNAME, FULLORGANIZATIONNAME, WORKPHONE, FAX, RATING, EMAIL, EMPLOYEESCOUNT,
--BUSINESSDESCRIPTION, ID_OKOPF, ID_REGION, ID_INDUSTRY, INN, KPP, CLIENTCATEGORY, SECTOR, DATEOFREGISTRATION, DEPARTMENT, DIVISION,
--TYPE, CORP_BLOCK, OGRN, INDUSTRYNAME, OPFNAME, REG_DIRECTION, IS_ACTIVE) 
--WITH CASCADED CHECK OPTION;
 select kf.id_fkr kf_id, kf.notes kf_note, kf.is_significant is_significant, kf.created kf_created,
                            	   	ft.id_fkr_type ft_id, ft.fkr_code || ' ' || ft.fkr_type ft_name, ft.fkr_kind ft_kind,
                            	   	kf.finished kf_finished, fg.id_fkr_group fg_id, fg.fkr_group fg_name,
                            	   	kf.id_fkr_status kfs_id, kfs.status kfs_name 
                            	   	from km_fkr kf
                              			inner join km_fkr_status kfs on kf.id_fkr_status = kfs.id_fkr_status
                              			inner join cd_fkr_type ft on kf.id_fkr_type = ft.id_fkr_type
                              			inner join cd_fkr_group fg on ft.id_fkr_group = fg.id_fkr_group
                              		where kf.id_event = 219  

select ct.id_contractor_type ct_id, ct.name_contractor_type ct_name,
	c.id_crmorg co_id, c.name co_name
from v_cps_deal_contractor c
left join v_cps_deal_contractor_type ctl on ctl.id_r = c.id_r
left join contractor_type ct on ct.id_contractor_type = ctl.id_contractor_type
	where c.id_person is null and c.id_mdtask = 2725
	order by c.name

select count(ID_MDTASK) from V_CPS_CREDIT_DEAL m inner join crm_organization o on m.id_borrower = o.id_org
	where m.IS_MDTASK_CONFIRMED = 1 and m.MDTASK_TYPE_KEY = 'DEAL'
	
select count(*) from V_ORGANISATION o
	where o.organizationname IN (select distinct name from V_CPS_DEAL_CONTRACTOR vc
									inner join V_CPS_CREDIT_DEAL vd on vc.id_mdtask = vd.id_mdtask
									and vd.IS_MDTASK_CONFIRMED = 1 and vd.MDTASK_TYPE_KEY = 'DEAL')

select * from V_CPS_CREDIT_DEAL where rownum<6
select * from V_CPS_DEAL_CONTRACTOR where rownum<6 and id_person is null
select * from V_CPS_DEAL_CONTRACTOR where rownum<6 and id_crmorg is null
select id_mdtask from V_CPS_DEAL_CONTRACTOR where id_crmorg='A6UJ9A004QOL'
select count(distinct id_person) from V_CPS_DEAL_CONTRACTOR
select count(distinct id_crmorg) from V_CPS_DEAL_CONTRACTOR
select * from V_CPS_DEAL_CONTRACTOR_TYPE where rownum<6
select * from CONTRACTOR_TYPE where rownum<6

select * from cd_fkr_type where is_SIGNIFICANT = 1

select count(*) from V_ORGANISATION o
	where o.organizationname IN (select distinct name from V_CPS_DEAL_CONTRACTOR)


select co.id_crmorg co_id, co.name co_name
								from v_cps_deal_contractor co
									where id_mdtask = 1055
									
select distinct ct.id_contractor_type ct_id, ct.name_contractor_type ct_name
	from v_cps_deal_contractor c
	left join v_cps_deal_contractor_type ctl on ctl.id_r = c.id_r
	left join contractor_type ct on ct.id_contractor_type = ctl.id_contractor_type
		where c.id_crmorg = '?'	 and id_mdtask = 1								

SELECT C.ID_R ID, C.ID_CRMORG ORG_ID, C.NAME, CT.NAME_CONTRACTOR_TYPE TYPE_IN_CREDIT_DEAL
    FROM V_CPS_DEAL_CONTRACTOR C
    LEFT JOIN V_CPS_DEAL_CONTRACTOR_TYPE CTL ON CTL.ID_R = C.ID_R
    LEFT JOIN CONTRACTOR_TYPE CT ON CT.ID_CONTRACTOR_TYPE = CTL.ID_CONTRACTOR_TYPE
    where C.ID_CRMORG = ? 

select count(ID_MDTASK) from V_CPS_CREDIT_DEAL m inner join crm_organization o on m.id_borrower = o.id_org
                            	where m.IS_MDTASK_CONFIRMED = 1 and m.MDTASK_TYPE_KEY = 'DEAL'

   select ft.id_fkr_type ft_id, ft.fkr_code || ' ' || ft.fkr_type ft_name,
		fg.id_fkr_group fg_id, fg.fkr_group fg_name
  from cd_fkr_type ft
  		inner join cd_fkr_group fg on ft.id_fkr_group = fg.id_fkr_group
  where ft.id_fkr_group = 1
 	order by ft_name

 	delete from KM_FKR  where id_event = 184
select * from KM_FKR  where id_event is not null
select * from CD_FKR_TYPE

select * from crm_organization  where rownum < 5

select * from V_ORGANISATION where rownum < 5

select count(*) from V_ORGANISATION o
	where (o.crmid IN (select distinct id_crmorg from V_CPS_DEAL_CONTRACTOR) OR o.crmid IN (select distinct id_person from V_CPS_DEAL_CONTRACTOR))


	select o.id_org CO_ID, o.organization_name CO_NAME
   		from crm_organization o
   		where exists (select id_event_calendar from KM_EVENT_CALENDAR e where e.id_organization = o.id_org)
   		
	select o.CRMID CO_ID, o.ORGANIZATIONNAME CO_NAME, o.inn, o.CRMID 
   		from V_ORGANISATION o
   		where ORGANIZATIONNAME = 'Тил'
   		
   	select * from cd_km_source_doc
   	
   	select * from punitive_measure
   	
   		     select ei.id_event ei_id, ei.plan_date ei_plan_date, ei.result_notes ei_result_note, ei.source_doc_comment ei_source_doc_comment,
						     		ei.source_doc_number ei_source_doc_number, ei.source_doc_date ei_source_doc_date,
						     		ei.id_event_status kes_id, kes.event_status kes_name,
						     		ei.id_event_result er_id, cer.event_result er_name,
						     		ei.id_document_group dg_id, dg.name_document_group dg_name,
						     		ei.id_document_type dot_id, dot.name_document_type dot_name,
						     		ei.id_confirmation_type kct_id, kct.confirmation_type kct_name,
						            u.id_user u_id, u.name u_first_name, u.surname u_last_name, u.patronymic u_patronymic, u.mail_user u_email,
						            e.id_event_calendar e_id, e.event_name e_name, e.start_date E_START_DATE, e.end_date E_END_DATE,
						            e.repeat_period E_REPEAT_PERIOD, e.repeat_period_kind E_REPEAT_PERIOD_KIND, e.repeat_period_weekend E_REPEAT_PERIOD_WEEKEND,
						        	t.id_event_type as ET_ID, t.event_type_name ET_NAME, 
									mo.id as MO_ID, mo.name as MO_NAME, 
									g.id_event_group as ETG_ID, g.event_group_name as ETG_NAME,
									rt.id_repeat_type as RT_ID, rt.repeat_type as RT_NAME,					            
						            e.id_mdtask d_id, m.mdtask_number d_number, m.mdtask_sum d_amount, m.currency c_code, m.validto d_valid_to,
						            m.id_pup_process d_pup_process_id, m.crmcode d_crmcode,
						            v.crmid co_id, v.organizationname co_name, ct.id_contractor_type ct_id, ct.name_contractor_type ct_name,
						            p.productId dt_id, p.name dt_name,
						            ksd.id_source_doc sd_id, ksd.source_name sd_name,
						            pm_ei.id_measure pm_id, pm_ei.name_measure pm_name, pm_ei.sumdesc pm_sum_desc, 
						            pm_e.id_measure pm_e_id, pm_e.name_measure pm_e_name, pm_e.sumdesc pm_e_sum_desc 
						     from km_event ei 
				    			  left join users u on u.id_user = ei.id_executor
				    			  left join km_event_status kes on kes.id_event_status = ei.id_event_status
				    			  left join cd_event_result cer on cer.id_event_result = ei.id_event_result
				    			  left join cd_confirmation_type kct on kct.id_confirmation_type = ei.id_confirmation_type
				    			  left join documents_type dot on dot.id_document_type = ei.id_document_type
				    			  left join document_group dg on dg.id_group = ei.id_document_group
				                  left join km_event_calendar e on e.id_event_calendar = ei.id_event_calendar
				                  inner join cd_event_type t on e.id_event_type = t.id_event_type 
								  inner join cd_event_group g on t.id_event_group = g.id_event_group
								  inner join cd_monitored_object mo on mo.id = g.id_object_type
								  left join cd_repeat_type rt on e.id_repeat_type = rt.id_repeat_type						                   
				                  left join mdtask m on m.id_mdtask = e.id_mdtask
				                  left join r_org_mdtask r on r.id_mdtask = m.id_mdtask
				                  left join v_organisation v on v.crmid = r.id_crmorg
				                  left join r_contractor_type_mdtask rct on rct.id_r = r.id_r
				                  left join contractor_type ct on ct.id_contractor_type = rct.id_contractor_type
				                  left join r_mdtask_opp_type rmot on m.id_mdtask = rmot.id_mdtask
					       		  left outer join v_spo_product p on rmot.id_opp_type = p.productId
					       		  left join cd_km_source_doc ksd on ksd.id_source_doc = ei.id_source_doc
					       		  left join punitive_measure pm_ei on pm_ei.id_measure = ei.id_punitive_measure				                  
					       		  left join punitive_measure pm_e on pm_e.id_measure = e.id_punitive_measure				                  
						 	 where ei.id_event = 183 and rownum < 2
                    
