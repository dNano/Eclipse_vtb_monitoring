package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmRepeatType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Периодичность(тип периодичности) мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class KmRepeatTypeRm extends BaseRm<KmRepeatType> {

	public KmRepeatTypeRm() {
		super("RT_");
	}

	@Override
	protected KmRepeatType map(ResultSetWrapper rsw) throws SQLException {
		KmRepeatType rType = new KmRepeatType();
		rType.setId(rsw.getLong(getAliasPrefix() + "ID"));
		rType.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return rType;
	}

}
