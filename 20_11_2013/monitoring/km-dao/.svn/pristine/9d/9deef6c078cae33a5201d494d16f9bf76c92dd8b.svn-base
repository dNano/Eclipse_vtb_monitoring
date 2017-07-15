package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.PunitiveMeasure;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class KmEventInstanceRm extends BaseRm<KmEventInstance> {

	public KmEventInstanceRm() {
		super("EI_");
	}

	@Override
	protected KmEventInstance map(ResultSetWrapper rsw) throws SQLException {
		KmEventInstance instance = new KmEventInstance();

		instance.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instance.setPlanExecutionDate(rsw.getDate(getAliasPrefix() + "PLAN_DATE"));
		instance.setExecutedDate(rsw.getDate(getAliasPrefix() + "EXECUTED_DATE"));
		instance.setExecutor(new UserRm().map(rsw));
		instance.setEvent(new KmEventRm().map(rsw));
		instance.setContractor(new ContractorRm().map(rsw));
		instance.setContractorType(new ContractorTypeRm().map(rsw));
		instance.setStatus(new KmEventStatusRm().map(rsw));
		instance.setResult(new KmEventResultRm().map(rsw));
		instance.setConfirmationType(new KmConfirmationTypeRm().map(rsw));
		instance.setDocumentType(new DocumentTypeRm().map(rsw));
		instance.setDocumentGroup(new DocumentGroupRm().map(rsw));
		instance.setResultNote(rsw.getString(getAliasPrefix() + "RESULT_NOTE"));
		setSourceDoc(rsw, instance);
		instance.setPunitiveMeasure(new PunitiveMeasureRm().map(rsw));
		setPunishmentMeasureForPlanEvent("PM_E_", rsw, instance);
		instance.setPunitiveMeasureDescr(rsw.getString(getAliasPrefix() + "PUNITIVE_MEASURE_DESCR"));
		setSanction(rsw, instance);
		instance.setFkrCandLong(rsw.getLong(getAliasPrefix() + "FKR_CAND_LONG"));
		instance.setInfo(new OfficialInfoRm().map(rsw));
		
		return instance;
	}

	private void setSanction(ResultSetWrapper rsw, KmEventInstance instance) throws SQLException {
		instance.setIsSanction(rsw.getLong(getAliasPrefix() + "IS_SANCTION"));
		instance.setSanctionDate(rsw.getDate(getAliasPrefix() + "SANCTION_DATE"));
		instance.setSanctionValue(rsw.getLong(getAliasPrefix() + "SANCTION_VALUE"));
		instance.setSanctionCurrency(rsw.getString(getAliasPrefix() + "SANCTION_CURRENCY"));
		instance.setSanctionRefusedBy(rsw.getString(getAliasPrefix() + "SANCTION_REFUSED_BY"));
		instance.setSanctionRefusedDocNum(rsw.getString(getAliasPrefix() + "SANCTION_REFUSED_DOCNUM"));
		instance.setSanctionRefusedDate(rsw.getDate(getAliasPrefix() + "SANCTION_REFUSED_DATE"));
	}

	private void setSourceDoc(ResultSetWrapper rsw, KmEventInstance instance) throws SQLException {
		instance.setSourceDoc(new KmSourceDocRm().map(rsw));
		instance.setSourceDocComment(rsw.getString(getAliasPrefix() + "SOURCE_DOC_COMMENT"));
		instance.setSourceDocNumber(rsw.getString(getAliasPrefix() + "SOURCE_DOC_NUMBER"));
		instance.setSourceDocDate(rsw.getDate(getAliasPrefix() + "SOURCE_DOC_DATE"));
	}

	/**
	 * штрафные санкции планового мероприятия.
	 * 
	 * @param rsw
	 * @param instance
	 * @throws SQLException
	 */
	private void setPunishmentMeasureForPlanEvent(String aliasPrefix, ResultSetWrapper rsw, KmEventInstance instance) throws SQLException {
		PunitiveMeasure measure = new PunitiveMeasure();
		measure.setId(rsw.getLong(aliasPrefix + "ID"));
		measure.setName(rsw.getString(aliasPrefix + "NAME"));
		measure.setSumDesc(rsw.getString(aliasPrefix + "SUM_DESC"));
		instance.getEvent().setPunitiveMeasure(measure);
	}

}
