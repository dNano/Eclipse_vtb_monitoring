package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.ContractorTypeInstance;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Сущность типа клиентов.
 * 
 * @author Shafigullin Ildar
 */
public class ContractorTypeInstanceRm extends BaseRm<ContractorTypeInstance> {

	public ContractorTypeInstanceRm() {
		super("CT_");
	}

	@Override
	protected ContractorTypeInstance map(ResultSetWrapper rsw) throws SQLException {
		ContractorTypeInstance ct = new ContractorTypeInstance();
		ct.setId(rsw.getLong(getAliasPrefix() + "ID"));
		ct.setName(rsw.getString(getAliasPrefix() + "NAME"));
		ct.setContractor(new ContractorRm().map(rsw));
		return ct;
	}
}
