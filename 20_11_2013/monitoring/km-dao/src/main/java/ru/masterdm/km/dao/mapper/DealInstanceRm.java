package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.dictionary.DealStatus;
import ru.masterdm.km.common.entity.DealInstance;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Маппер для полей БД на сущность сделка
 * 
 * @author Shafigullin Ildar
 */
public class DealInstanceRm extends BaseRm<DealInstance> {

	public DealInstanceRm() {
		super("DI_");
	}

	@Override
	protected DealInstance map(ResultSetWrapper rsw) throws SQLException {
		DealInstance instance = new DealInstance();
		instance.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instance.setDeal(new DealRm().map(rsw));
		instance.setDate(rsw.getDate(getAliasPrefix() + "DATE"));
		instance.setContractor(new ContractorRm().map(rsw));
		setStatus(rsw, instance);
		// instance.setExecutor(new UserRm().map(rsw));
		instance.setInfo(new OfficialInfoRm().map(rsw));
		return instance;
	}

	private void setStatus(ResultSetWrapper rsw, DealInstance instance) throws SQLException {
		if (rsw.getInt("FKR_COUNT") != null && rsw.getInt("EXPARED_COUNT") != null) {
			int countFkr = rsw.getInt("FKR_COUNT");
			int countExpared = rsw.getInt("EXPARED_COUNT");
			if (countFkr > 0) {
				instance.setStatus(DealStatus.FKR);
			} else if (countExpared > 0) {
				instance.setStatus(DealStatus.EXPARED);
			} else {
				instance.setStatus(DealStatus.ACTIVE);
			}
		}
	}

}
