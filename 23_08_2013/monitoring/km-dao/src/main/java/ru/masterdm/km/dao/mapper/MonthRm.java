package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.Month;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Map for Месяц.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class MonthRm extends BaseRm<Month> {

	public MonthRm() {
		super("M_");
	}

	@Override
	protected Month map(ResultSetWrapper rsw) throws SQLException {
		Month month = new Month();
		month.setId(rsw.getLong(getAliasPrefix() + "ID"));
		month.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return month;
	}

}
