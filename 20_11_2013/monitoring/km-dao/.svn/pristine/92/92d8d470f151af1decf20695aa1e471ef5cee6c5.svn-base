package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.OfficialInfo;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for "Основная информация договора(соглашения)".
 * 
 * @author Shafigullin Ildar
 * 
 */
public class OfficialInfoRm extends BaseRm<OfficialInfo> {
	public OfficialInfoRm() {
		super("I_");
	}

	@Override
	protected OfficialInfo map(ResultSetWrapper rsw) throws SQLException {
		OfficialInfo info = new OfficialInfo();
		info.setOfficialNumber(rsw.getString(getAliasPrefix() + "OFFICIAL_NUMBER"));
		info.setOfficialDate(rsw.getDate(getAliasPrefix() + "OFFICIAL_DATE"));
		info.setDocContractorNumber(rsw.getString(getAliasPrefix() + "DOC_CONTRACTOR_NUMBER"));
		return info;
	}
}
