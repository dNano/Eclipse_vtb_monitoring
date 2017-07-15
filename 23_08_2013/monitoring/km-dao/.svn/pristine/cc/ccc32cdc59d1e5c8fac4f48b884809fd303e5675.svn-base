package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmConfirmationType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Вид подтверждения KM.
 * 
 * @author Shafigullin Ildar
 */
public class KmConfirmationTypeRm extends BaseRm<KmConfirmationType> {

	public KmConfirmationTypeRm() {
		super("KCT_");
	}

	@Override
	protected KmConfirmationType map(ResultSetWrapper rsw) throws SQLException {
		KmConfirmationType ct = new KmConfirmationType();
		ct.setId(rsw.getLong(getAliasPrefix() + "ID"));
		ct.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return ct;
	}

}
