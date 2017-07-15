package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.Deal;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class DealRm extends BaseRm<Deal> {

	public DealRm() {
		super("D_");
	}

	@Override
	protected Deal map(ResultSetWrapper rsw) throws SQLException {
		Deal deal = new Deal();
		
		deal.setId(rsw.getLong(getAliasPrefix() + "ID"));
		deal.setAmount(rsw.getLong(getAliasPrefix() + "AMOUNT"));
		deal.setCurrency(new CurrencyRm().map(rsw));
		deal.setType(new DealTypeRm().map(rsw));
		deal.setValidTo(rsw.getDate(getAliasPrefix() + "VALID_TO"));
		deal.setSpkpNumber(rsw.getString(getAliasPrefix() + "SPKP_NUMBER"));
		deal.setPupProcessID(rsw.getLong(getAliasPrefix() + "PUP_PROCESS_ID"));
		deal.setContractNumber(rsw.getString(getAliasPrefix() + "NUMBER"));
		deal.setCrmCode(rsw.getString(getAliasPrefix() + "CRMCODE"));
		deal.setBorrower(new ContractorRm().map(rsw));
		
		return deal;
	}

}
