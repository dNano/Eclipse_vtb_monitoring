package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.EventResult;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Исполнение контрольных мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class KmEventResultRm extends BaseRm<EventResult> {

	public KmEventResultRm() {
		super("ER_");
	}

	@Override
	protected EventResult map(ResultSetWrapper rsw) throws SQLException {
		EventResult er = new EventResult();
		er.setId(rsw.getLong(getAliasPrefix() + "ID"));
		er.setName(rsw.getString(getAliasPrefix() + "NAME"));
		er.setEventStatus(new KmEventStatusRm().map(rsw));
		if (rsw.getLong(getAliasPrefix() + "COMMENT_MANDATORY") != null) {
			er.setCommentMandatory(rsw.getLong(getAliasPrefix() + "COMMENT_MANDATORY") == 1);
		}
		if (rsw.getLong(getAliasPrefix() + "SANCTION") != null) {
			er.setSanction(rsw.getLong(getAliasPrefix() + "SANCTION") == 1);
		}
		if (rsw.getLong(getAliasPrefix() + "PROCESS_CRF") != null) {
			er.setProcessCRF(rsw.getLong(getAliasPrefix() + "PROCESS_CRF") == 1);
		}
		return er;
	}

}
