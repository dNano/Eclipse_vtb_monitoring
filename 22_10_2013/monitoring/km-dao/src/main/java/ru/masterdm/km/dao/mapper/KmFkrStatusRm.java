package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmFkrStatus;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Статус ФКР.
 * 
 * @author Shafigullin Ildar
 */
public class KmFkrStatusRm extends BaseRm<KmFkrStatus> {

	public KmFkrStatusRm() {
		super("KFS_");
	}

	@Override
	protected KmFkrStatus map(ResultSetWrapper rsw) throws SQLException {
		KmFkrStatus c = new KmFkrStatus();
		c.setId(rsw.getLong(getAliasPrefix() + "ID"));
		c.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return c;
	}

}
