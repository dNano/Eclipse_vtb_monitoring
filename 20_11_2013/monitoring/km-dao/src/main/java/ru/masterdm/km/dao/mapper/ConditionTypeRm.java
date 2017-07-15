package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.ConditionType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Сущность "Тип условия".
 * 
 * @author Shafigullin Ildar
 */
public class ConditionTypeRm extends BaseRm<ConditionType> {

	public ConditionTypeRm() {
		super("COND_T_");
	}

	@Override
	protected ConditionType map(ResultSetWrapper rsw) throws SQLException {
		ConditionType ct = new ConditionType();
		ct.setId(rsw.getLong(getAliasPrefix() + "ID"));
		ct.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return ct;
	}
}
