package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for ФКР.
 * 
 * @author Shafgullin Ildar
 * 
 */
public class KmFkrRm extends BaseRm<KmFkr> {

	public KmFkrRm() {
		super("KF_");
	}

	@Override
	protected KmFkr map(ResultSetWrapper rsw) throws SQLException {
		KmFkr instanse = new KmFkr();

		instanse.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instanse.setType(new FkrTypeRm().map(rsw));
		instanse.setDeal(new DealRm().map(rsw));
		instanse.setNotes(rsw.getString(getAliasPrefix() + "NOTE"));
		if (rsw.getLong("IS_SIGNIFICANT") != null) {
			instanse.setSignificant(rsw.getLong("IS_SIGNIFICANT") == 1);
		}
		instanse.setCreated(rsw.getDate(getAliasPrefix() + "CREATED"));
		instanse.setFinished(rsw.getDate(getAliasPrefix() + "FINISHED"));
		instanse.setStatus(new KmFkrStatusRm().map(rsw));
		instanse.setWho(rsw.getString(getAliasPrefix() + "WHO"));
		instanse.setDocID(rsw.getString(getAliasPrefix() + "ID_DOC"));

		return instanse;
	}

}
