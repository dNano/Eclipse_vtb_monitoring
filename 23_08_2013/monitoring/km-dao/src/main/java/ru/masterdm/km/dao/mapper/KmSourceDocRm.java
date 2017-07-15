package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmSourceDoc;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Основание для создания мероприятия.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class KmSourceDocRm extends BaseRm<KmSourceDoc> {

	public KmSourceDocRm() {
		super("SD_");
	}

	@Override
	protected KmSourceDoc map(ResultSetWrapper rsw) throws SQLException {
		KmSourceDoc doc = new KmSourceDoc();
		doc.setId(rsw.getLong(getAliasPrefix() + "ID"));
		doc.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return doc;
	}

}
