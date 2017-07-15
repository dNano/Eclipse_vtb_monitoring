package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.dictionary.ContractorStatus;
import ru.masterdm.km.common.entity.ContractorInstance;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Маппер для полей БД на сущность клиент
 * 
 * @author Shafigullin Ildar
 */
public class ContractorInstanceRm extends BaseRm<ContractorInstance> {

	public ContractorInstanceRm() {
		super("СI_");
	}

	@Override
	protected ContractorInstance map(ResultSetWrapper rsw) throws SQLException {
		ContractorInstance instance = new ContractorInstance();
		// instance.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instance.setContractor(new ContractorRm().map(rsw));
		setStatus(rsw, instance);

		return instance;
	}

	private void setStatus(ResultSetWrapper rsw, ContractorInstance instance) throws SQLException {
		int countFkr = rsw.getInt("FKR_COUNT");
		int countExpared = rsw.getInt("EXPARED_COUNT");
		if (countFkr > 0) {
			instance.setStatus(ContractorStatus.FKR);
		} else if (countExpared > 0) {
			instance.setStatus(ContractorStatus.EXPARED);
		} else {
			instance.setStatus(ContractorStatus.ACTIVE);
		}		
	}

}
