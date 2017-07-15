package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.DealCondition;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Сущность "Условия сделки".
 * 
 * @author Shafigullin Ildar
 */
public class DealConditionRm extends BaseRm<DealCondition> {

	public DealConditionRm() {
		super("DC_");
	}

	@Override
	protected DealCondition map(ResultSetWrapper rsw) throws SQLException {
		DealCondition dc = new DealCondition();
		dc.setId(rsw.getLong(getAliasPrefix() + "ID"));
		dc.setName(rsw.getString(getAliasPrefix() + "NAME"));
		dc.setType(new ConditionTypeRm().map(rsw));
		return dc;
	}

}
