package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmFkrStatusChange;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Статус change ФКР.
 * 
 * @author Shafigullin Ildar
 */
public class KmFkrStatusChangeRm extends BaseRm<KmFkrStatusChange> {

	public KmFkrStatusChangeRm() {
		super("KFSC_");
	}

	@Override
	protected KmFkrStatusChange map(ResultSetWrapper rsw) throws SQLException {
		KmFkrStatusChange c = new KmFkrStatusChange();
		c.setId(rsw.getLong(getAliasPrefix() + "ID"));
		c.setStatus(new KmFkrStatusRm().map(rsw));
		c.setWho(rsw.getString(getAliasPrefix() + "WHO"));
		c.setNotes(rsw.getString(getAliasPrefix() + "NOTES"));
		c.setAccepted(rsw.getDate(getAliasPrefix() + "ACCEPTED"));
		c.setDocID(rsw.getString(getAliasPrefix() + "ID_DOC"));
		return c;
	}

}
