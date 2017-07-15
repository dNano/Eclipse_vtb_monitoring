package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventChronology;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for "Хронология исполнения мероприятия".
 * 
 * @author Shafigullin Ildar
 * 
 */
public class KmEventChronologyRm extends BaseRm<KmEventChronology> {

	public KmEventChronologyRm() {
		super("ECH_");
	}

	@Override
	protected KmEventChronology map(ResultSetWrapper rsw) throws SQLException {
		KmEventChronology instance = new KmEventChronology();

		instance.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instance.setName(rsw.getString(getAliasPrefix() + "NAME"));
		instance.setPlanExecutionDate(rsw.getDate(getAliasPrefix() + "PLAN_DATE"));
		instance.setExecutedDate(rsw.getDate(getAliasPrefix() + "EXECUTED_DATE"));
		instance.setExecutor(new UserRm().map(rsw));
		instance.setStatus(new KmEventStatusRm().map(rsw));
		instance.setResult(new KmEventResultRm().map(rsw));

		return instance;
	}

}
