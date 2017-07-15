package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.DocumentType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Map for "Типы документов".
 * 
 * @author Shafigullin Ildar
 */
public class DocumentTypeRm extends BaseRm<DocumentType> {

	public DocumentTypeRm() {
		super("DOT_");
	}

	@Override
	protected DocumentType map(ResultSetWrapper rsw) throws SQLException {
		DocumentType u = new DocumentType();
		u.setId(rsw.getLong(getAliasPrefix() + "ID"));
		u.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return u;
	}
}
