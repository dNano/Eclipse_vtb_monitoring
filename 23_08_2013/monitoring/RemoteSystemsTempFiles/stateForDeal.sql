	select m.ID_MDTASK d_id, m.MDTASK_NUMBER d_spkp_number, m.MDTASK_SUM d_amount, m.MDTASK_SUM_CURRENCY C_CODE,
			m.VALID_TO di_date, -1 dt_id, m.PRODUCT_NAME dt_name, m.BORROWER_NAME co_name,
	   		(select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK) fkr_count,
	   		row_number() over (order by m.ID_MDTASK) rn
	from V_CED_CREDIT_DEAL m
	where m.IS_MDTASK_CONFIRMED = 1 and m.IS_MDTASK_CREDIT_DEAL = 1
	and (((select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK and is_significant = 1) = 0) and
		((select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK and is_significant = 0) > 0))

	select * from KM_FKR