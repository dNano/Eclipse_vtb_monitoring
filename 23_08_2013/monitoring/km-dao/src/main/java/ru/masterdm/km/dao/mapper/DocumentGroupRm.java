package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.DocumentGroup;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Map for "Группа документов".
 * 
 * @author Shafigullin Ildar
 */
public class DocumentGroupRm extends BaseRm<DocumentGroup> {

	public DocumentGroupRm() {
		super("DG_");
	}

	@Override
	protected DocumentGroup map(ResultSetWrapper rsw) throws SQLException {
		DocumentGroup u = new DocumentGroup();
		u.setId(rsw.getLong(getAliasPrefix() + "ID"));
		u.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return u;
	}
}
