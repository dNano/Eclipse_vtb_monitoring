package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventStatus;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Статус мероприятия(KM).
 * 
 * @author Shafigullin Ildar
 */
public class KmEventStatusRm extends BaseRm<KmEventStatus> {

	public KmEventStatusRm() {
		super("KES_");
	}

	@Override
	protected KmEventStatus map(ResultSetWrapper rsw) throws SQLException {
		KmEventStatus c = new KmEventStatus();
		c.setId(rsw.getLong(getAliasPrefix() + "ID"));
		c.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return c;
	}

}
