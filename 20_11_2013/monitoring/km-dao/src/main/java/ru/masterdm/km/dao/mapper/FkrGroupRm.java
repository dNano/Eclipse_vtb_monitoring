package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.FkrGroup;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for группы ФКР.
 * 
 * @author Shafgullin Ildar
 * 
 */
public class FkrGroupRm extends BaseRm<FkrGroup> {

	public FkrGroupRm() {
		super("FG_");
	}
	@Override
	protected FkrGroup map(ResultSetWrapper rsw) throws SQLException {
		FkrGroup instanse = new FkrGroup();
		instanse.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instanse.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return instanse;
	}


}
