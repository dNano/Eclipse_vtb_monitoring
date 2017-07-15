package ru.masterdm.km.dao;

import static ru.masterdm.km.common.dictionary.KmFkrStatusDictionary.ADJUSTED;
import static ru.masterdm.km.common.dictionary.KmFkrStatusDictionary.NOT_SIGNIFICANT;
import static ru.masterdm.km.common.dictionary.KmFkrStatusDictionary.SIGNIFICANT;
import static ru.masterdm.km.common.dictionary.KmFkrStatusDictionary.IDENTIFY;
import static ru.masterdm.km.dao.FkrDaoSqlKey.FKR_INSTANCES;
import static ru.masterdm.km.dao.FkrDaoSqlKey.FKR_INSTANCE_COUNT;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import ru.masterdm.km.common.entity.AppFile;
import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.Deal;
import ru.masterdm.km.common.entity.FkrGroup;
import ru.masterdm.km.common.entity.FkrType;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.common.entity.KmFkrStatus;
import ru.masterdm.km.common.entity.KmFkrStatusChange;
import ru.masterdm.km.common.searchfilter.FkrFilter;
import ru.masterdm.km.dao.mapper.FkrGroupRm;
import ru.masterdm.km.dao.mapper.FkrTypeRm;
import ru.masterdm.km.dao.mapper.KmFkrInstanceRm;
import ru.masterdm.km.dao.mapper.KmFkrStatusChangeRm;
import ru.masterdm.km.util.BaseJdbcDao;
import ru.masterdm.km.util.query.SortCriterion;

/**
 * Реализация DAO интерфейса для сущности "ФКР".
 * 
 * @author Shafigullin Ildar
 */
public class FkrDaoImpl extends BaseJdbcDao<FkrDaoSqlKey> implements FkrDao {

	@Override
	public List<KmFkrInstance> getInstances(int startIndex, int amount, FkrFilter filter, List<SortCriterion> sortCriteria) {
		ArrayList<Object> params = new ArrayList<Object>();
		String query = "select v.* from (";
		query += sql.getValue(FKR_INSTANCES);
		String orderBy = getOrderBy(sortCriteria);
		query += ", row_number() over (order by " + orderBy + ") rn from km_fkr kf "
				+ "inner join cd_fkr_type ft on kf.id_fkr_type = ft.id_fkr_type "
				+ "inner join cd_fkr_group fg on ft.id_fkr_group = fg.id_fkr_group "
				+ "left outer join v_cps_credit_deal m on m.id_mdtask = kf.id_mdtask "
				+ "left outer join v_cps_credit_deal_number i on i.id_mdtask = kf.id_mdtask "
				+ "left outer join v_organisation o on m.id_borrower = o.crmid "
				+ "left outer join v_organisation org on kf.id_organization = org.crmid "
				+ "inner join km_fkr_status kfs on kf.id_fkr_status = kfs.id_fkr_status ";
		query = filterQuery(filter, query, params);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		params.add(startIndex);
		params.add(startIndex + amount);
		return queryForList(query, new KmFkrInstanceRm(), "Error selecting fkr instances.", params.toArray());

	}

	private String getOrderBy(List<SortCriterion> sortCriteria) {
		String orderBy = "o.organizationname, m.mdtask_number, ft.fkr_code desc";
		if (!sortCriteria.isEmpty()) {
			SortCriterion sortCriterion = sortCriteria.get(0);
			String propertyName = sortCriterion.getPropertyName();
			if ("fkrType".equalsIgnoreCase(propertyName)) {
				orderBy = "ft.fkr_code";
			} else if ("note".equalsIgnoreCase(propertyName)) {
				orderBy = "kf.notes";
			} else if ("sign".equalsIgnoreCase(propertyName)) {
				orderBy = "kf.is_significant";
			} else if ("created".equalsIgnoreCase(propertyName)) {
				orderBy = "kf.created";
			} else if ("finished".equalsIgnoreCase(propertyName)) {
				orderBy = "kf.finished";
			} else if ("client".equalsIgnoreCase(propertyName)) {
				orderBy = "o.organizationname";
			} else if ("status".equalsIgnoreCase(propertyName)) {
				orderBy = "kfs.status";
			} else if ("contractNumber".equalsIgnoreCase(propertyName)) {
				orderBy = "i.official_number";
			} else if ("spkpNumber".equalsIgnoreCase(propertyName)) {
				orderBy = "m.mdtask_number";				
			}
			orderBy += sortCriterion.getSortDirection().toStringForJpql();
		}
		return orderBy;
	}

	@Override
	public int getInstanceCount(FkrFilter filter) {
		String query = sql.getValue(FKR_INSTANCE_COUNT);
		ArrayList<Object> params = new ArrayList<Object>();
		query = filterQuery(filter, query, params);
		return queryForInt(query, "Error selecting fkr instance count.", params.toArray());
	}

	private String filterQuery(FkrFilter filter, String query, ArrayList<Object> params) {
		if (filter.getContractorName() != null) {
			if (filter.isShowClientForDeal()) {
				query += " AND ( lower(org.ORGANIZATIONNAME) like lower(?) ";
				query += " OR kf.id_mdtask IN (select id_mdtask from V_CPS_DEAL_CONTRACTOR where lower(name) like lower(?)) ) ";
				params.add("%" + filter.getContractorName() + "%");
				params.add("%" + filter.getContractorName() + "%");
			} else {
				query += " AND lower(org.ORGANIZATIONNAME) like lower(?) ";
				params.add("%" + filter.getContractorName() + "%");
			}
		}
		if (filter.getDealDate() != null) {
			query += " AND m.VALID_TO = ? ";
			params.add(new java.sql.Date(filter.getDealDate().getTime()));
		}
		if (filter.getSpkpNumber() != null) {
			query += " AND lower(m.MDTASK_NUMBER) like lower(?) ";
			params.add("%" + filter.getSpkpNumber() + "%");
		}
		if (filter.getDateCreatedFrom() != null) {
			query += " AND kf.created >= ? ";
			params.add(new java.sql.Date(filter.getDateCreatedFrom().getTime()));
		}
		if (filter.getDateCreatedTo() != null) {
			query += " AND kf.created <= ? ";
			params.add(new java.sql.Date(filter.getDateCreatedTo().getTime()));
		}
		if (filter.getDateFinishedFrom() != null) {
			query += " AND kf.finished >= ? ";
			params.add(new java.sql.Date(filter.getDateFinishedFrom().getTime()));
		}
		if (filter.getDateFinishedTo() != null) {
			query += " AND kf.finished <= ? ";
			params.add(new java.sql.Date(filter.getDateFinishedTo().getTime()));
		}
		if (filter.getFkrStatus() != null) {
			query += " AND kfs.status = ? ";
			params.add(filter.getFkrStatus().getName());
		}
		if (filter.getFkrGroup() != null) {
			if (filter.getFkrType() != null) {
				query += " AND ft.id_fkr_type = ? ";
				params.add(filter.getFkrType().getId());
			} else {
				query += " AND fg.id_fkr_group = ? ";
				params.add(filter.getFkrGroup().getId());
			}
		}
		return query;
	}

	@Override
	public KmFkrInstance getFkrInstance(long fkrID) {
		String query = sql.getValue(FkrDaoSqlKey.FKR_BY_ID);
		return queryForObject(query, new KmFkrInstanceRm(), "Error getFkrInstance", fkrID);
	}

	@Override
	public void saveFkrInstance(KmFkrInstance fkrInstance) {
		KmFkr fkr = fkrInstance.getFkr();
		KmFkrStatusChange change = fkrInstance.getChange();
		Long statusID = change.getStatus().getId();
		if (statusID != null) {
			saveDocFromFkr(fkrInstance);
			addChangeFkr(fkr, change);
			saveFkr(fkr, change);
		}
	}

	/**
	 * сохраняем приаттаченные доки:
	 * 
	 * @param fkr
	 * @param docGroupId
	 * @param docTypeId
	 */
	private void saveDocFromFkr(KmFkrInstance fkr) {
		AppFile doc = fkr.getDocFile();
		if (doc != null) {
			fkr.getFkr().setDocID(doc.getId());
			if (fkr.getChange() != null) {
				fkr.getChange().setDocID(doc.getId());
			}
			saveDoc(doc);
		}
	}

	private void saveDoc(AppFile doc) {
		String query = sql.getValue(FkrDaoSqlKey.ADD_APP_FILE);
		Long docGroupId = (doc.getDocGroup() != null) ? doc.getDocGroup().getId() : null;
		Long docTypeId = (doc.getDocType() != null) ? doc.getDocType().getId() : null;
		Long whoAddId = (doc.getWhoAdd() != null) ? doc.getWhoAdd().getId() : null;
		update(query, "Error in ADD_APP_FILE", doc.getId(), doc.getName(), doc.getData(), doc.getType(), doc.getOwnerID(), doc.getOwnerType(),
				whoAddId, doc.getDateOfAdd(), docGroupId, docTypeId);
	}

	private void saveFkr(KmFkr fkr, KmFkrStatusChange change) {
		Long statusID = change.getStatus().getId();
		String query = sql.getValue(FkrDaoSqlKey.FKR_SAVE);
		if (statusID.intValue() == SIGNIFICANT.getId()) {
			fkr.setSignificant(true);
		} else if (statusID.intValue() == NOT_SIGNIFICANT.getId()) {
			fkr.setSignificant(false);
		} else if (statusID.intValue() == ADJUSTED.getId()) {
			Date finished = (change.getAccepted() != null) ? change.getAccepted() : new Date();
			fkr.setFinished(finished);
			fkr.setRegReason(change.getNotes());
		}
		long sign = fkr.isSignificant() ? 1 : 0;
		update(query, "Error in saveFkr", statusID, sign, fkr.getRegReason(), fkr.getFinished(), fkr.getId());
	}

	private void addChangeFkr(KmFkr fkr, KmFkrStatusChange change) {
		KmFkrStatus status = change.getStatus();
		Long statusID = (status != null && status.getId() != null) ? status.getId() : IDENTIFY.getId();
		String query = sql.getValue(FkrDaoSqlKey.FKR_SAVE_CHANGE);
		update(query, "Error in saveChangeFkr", fkr.getId(), change.getNotes(), change.getWho(), change.getAccepted(), statusID, change.getDocID());
	}

	@Override
	public List<KmFkrStatusChange> getFkrChange(int startIndex, int amount, long fkrID) {
		String query = sql.getValue(FkrDaoSqlKey.FKR_CHANGE);
		return queryForList(query, new KmFkrStatusChangeRm(), "Error get Fkr change.", fkrID);
	}

	@Override
	public int getFkrChangeCount(long fkrID) {
		String query = sql.getValue(FkrDaoSqlKey.FKR_CHANGE_COUNT);
		return queryForInt(query, "Error selecting fkr change count.", fkrID);
	}

	@Override
	public void addFkrInstance(KmFkrInstance fkrIns) {
		String query = sql.getValue(FkrDaoSqlKey.FKR_ADD_SEQ);
		Long fkrID = queryForLong(query, "Error get sequences for km_fkr");
		KmFkr fkr = fkrIns.getFkr();
		fkr.setId(fkrID);
		saveDocFromFkr(fkrIns);
		addFkr(fkrIns, fkr);
		updateHistoryFkr(fkr);
	}

	private void updateHistoryFkr(KmFkr fkr) {
		KmFkrStatusChange change = new KmFkrStatusChange();
		change.setAccepted(fkr.getCreated());
		change.setNotes(fkr.getNotes());
		change.setWho(fkr.getWho());
		change.setDocID(fkr.getDocID());
		addChangeFkr(fkr, change);
	}

	private void addFkr(KmFkrInstance fkrIns, KmFkr fkr) {
		Deal deal = fkr.getDeal();
		Long dealID = (deal != null && deal.getId() != null) ? deal.getId() : null;
		Contractor client = fkrIns.getClient();
		String clientID = (client != null && client.getId() != null) ? client.getId() : null;
		KmEventInstance event = fkrIns.getEvent();
		Long eventID = (event != null && event.getId() != null) ? event.getId() : null;
		long sign = fkr.isSignificant() ? 1 : 0;
		String query = sql.getValue(FkrDaoSqlKey.FKR_ADD);
		update(query, "Error in addFkr", fkr.getId(), fkr.getType().getId(), dealID, clientID, eventID, sign, fkr.getNotes(), fkr.getCreated(),
				fkr.getWho(), fkr.getRegReason(), fkr.getDocID());
	}

	@Override
	public List<FkrGroup> getFkrGroupsForEvent(Long idEventType) {
		return queryForList(sql.getValue(FkrDaoSqlKey.FKR_GROUPS_FOR_EVENT), new FkrGroupRm(), "Error getFkrGroups.", idEventType);
	}

	@Override
	public List<FkrType> getFkrTypesForEvent(Long groupID, Long idEventType) {
		if (groupID != null && idEventType != null) {
			String query = sql.getValue(FkrDaoSqlKey.FKR_TYPES_FOR_EVENT);
			return queryForList(query, new FkrTypeRm(), "Error getFkrTypes.", groupID, idEventType);
		} else {
			return Collections.emptyList();
		}
	}
}
