package ru.masterdm.km.dao;

//import static ru.masterdm.km.common.dictionary.EventResultDictionary.FKR;
//import static ru.masterdm.km.common.dictionary.EventResultDictionary.SANCTION_FKR;
import static ru.masterdm.km.dao.EventDaoSqlKey.EVENT_INSTANCES;
import static ru.masterdm.km.dao.EventDaoSqlKey.EVENT_INSTANCE_COUNT;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import ru.masterdm.km.common.dictionary.EventInstanceStatusDictionary;
import ru.masterdm.km.common.dictionary.EventRepeatTypeDictionary;
import ru.masterdm.km.common.dictionary.KmEventStatusDictionary;
import ru.masterdm.km.common.entity.AppFile;
import ru.masterdm.km.common.entity.DayOfWeek;
import ru.masterdm.km.common.entity.EventResult;
import ru.masterdm.km.common.entity.KmEventChronology;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmEventInstanceStatus;
import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.common.entity.KmRepeatType;
import ru.masterdm.km.common.entity.PunitiveMeasure;
import ru.masterdm.km.common.searchfilter.EventsByDateFilter;
import ru.masterdm.km.dao.mapper.DayOfWeekRm;
import ru.masterdm.km.dao.mapper.KmEventChronologyRm;
import ru.masterdm.km.dao.mapper.KmEventInstanceRm;
import ru.masterdm.km.dao.mapper.KmEventResultRm;
import ru.masterdm.km.dao.mapper.KmFkrRm;
import ru.masterdm.km.dao.mapper.PunitiveMeasureRm;
import ru.masterdm.km.util.BaseJdbcDao;
import ru.masterdm.km.util.query.SortCriterion;
//import ru.masterdm.km.common.dictionary.EventResultDictionary;
//import ru.masterdm.km.common.entity.KmFkr;

/**
 * 
 * @author Alexey Chalov
 */
public class EventDaoImpl extends BaseJdbcDao<EventDaoSqlKey> implements EventDao {
	private List<EventResult> eventResults;

	@Override
	public int getInstanceCount(EventsByDateFilter filter) {
		String query = sql.getValue(EVENT_INSTANCE_COUNT);
		ArrayList<Object> params = new ArrayList<Object>();
		query = filterQuery(filter, query, params);
		return queryForInt(query, "Error selecting event instance count.", params.toArray());
	}

	@Override
	public List<KmEventInstance> getInstances(int startIndex, int amount, EventsByDateFilter filter, List<SortCriterion> sortCriteria) {
		ArrayList<Object> params = new ArrayList<Object>();
		String query = "select v.* from (";
		query += sql.getValue(EVENT_INSTANCES);
		String orderBy = getOrderBy(sortCriteria);
		query += ", row_number() over (order by " + orderBy + ") rn from km_event ei left join users u on u.id_user = ei.id_executor "
				+ "inner join km_event_calendar e on e.id_event_calendar = ei.id_event_calendar "
				+ "left join mdtask m on m.id_mdtask = e.id_mdtask left join crm_organization o on o.id_org = e.id_organization "
				+ "left join cd_event_result cer on cer.id_event_result = ei.id_event_result "
				+ "left join km_event_status kes on kes.id_event_status = ei.id_event_status where 1=1 ";
		query = filterQuery(filter, query, params);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		params.add(startIndex);
		params.add(startIndex + amount);
		return queryForList(query, new KmEventInstanceRm(), "Error selecting event instances.", params.toArray());
	}

	private String getOrderBy(List<SortCriterion> sortCriteria) {
		String orderBy = "ei.plan_date desc";
		if (!sortCriteria.isEmpty()) {
			SortCriterion sortCriterion = sortCriteria.get(0);
			String propertyName = sortCriterion.getPropertyName();
			if ("planExecutionDate".equalsIgnoreCase(propertyName)) {
				orderBy = "ei.plan_date";
			} else if ("eventName".equalsIgnoreCase(propertyName)) {
				orderBy = "e.event_name";
			} else if ("contractNumber".equalsIgnoreCase(propertyName)) {
				orderBy = "e.id_mdtask";
			} else if ("spkpNumber".equalsIgnoreCase(propertyName)) {
				orderBy = "m.mdtask_number";
			} else if ("contractorName".equalsIgnoreCase(propertyName)) {
				orderBy = "o.organization_name";
			} else if ("amount".equalsIgnoreCase(propertyName)) {
				orderBy = "m.mdtask_sum";
			} else if ("currency".equalsIgnoreCase(propertyName)) {
				orderBy = "m.currency";
			} else if ("executor".equalsIgnoreCase(propertyName)) {
				orderBy = "u.surname";
			} else if ("dealDate".equalsIgnoreCase(propertyName)) {
				orderBy = "m.validTo";
			} else if ("executedDate".equalsIgnoreCase(propertyName)) {
				orderBy = "ei.executed_date";
			}
			orderBy += sortCriterion.getSortDirection().toStringForJpql();
		}
		return orderBy;
	}

	private String filterQuery(EventsByDateFilter filter, String query, ArrayList<Object> params) {
		if (filter.getCurrency() != null) {
			query += " AND m.currency = '" + filter.getCurrency().getId() + "'";
		}
		if (filter.getAmountFrom() != null) {
			query += " AND m.MDTASK_SUM >= " + filter.getAmountFrom();
		}
		if (filter.getAmountTo() != null) {
			query += " AND m.MDTASK_SUM <= " + filter.getAmountTo();
		}
		if (filter.getDateFrom() != null) {
			query += " AND ei.plan_date >= ? ";
			params.add(new java.sql.Date(filter.getDateFrom().getTime()));
		}
		if (filter.getDateTo() != null) {
			query += " AND ei.plan_date <= ? ";
			params.add(new java.sql.Date(filter.getDateTo().getTime()));
		}
		if (filter.getExecDateFrom() != null) {
			query += " AND ei.executed_date >= ? ";
			params.add(new java.sql.Date(filter.getExecDateFrom().getTime()));
		}
		if (filter.getExecDateTo() != null) {
			query += " AND ei.executed_date <= ? ";
			params.add(new java.sql.Date(filter.getExecDateTo().getTime()));
		}
		if (filter.getContractor() != null) {
			query += " AND (e.id_organization = ? ";
			query += " OR e.id_mdtask IN (select id_mdtask from V_CPS_DEAL_CONTRACTOR where id_crmorg=?)) ";
			params.add(filter.getContractor().getId());
			params.add(filter.getContractor().getId());
		}
		if (filter.getSpkpNumber() != null) {
			query += " AND lower(m.MDTASK_NUMBER) like lower(?) ";
			params.add("%" + filter.getSpkpNumber() + "%");
		}
		if (filter.getStatuses() != null && !filter.getStatuses().isEmpty()) {
			query = filterStatuses(filter, query, params);
		}
		return query;
	}

	private String filterStatuses(EventsByDateFilter filter, String query, ArrayList<Object> params) {
		String countFKR = "select count(id_fkr) from KM_FKR where id_event = ei.id_event";
		boolean isAll_FKR = hasStatus(filter, EventInstanceStatusDictionary.CREDIT_RISK_DETECTED);
		boolean isExpared = hasStatus(filter, EventInstanceStatusDictionary.EXPIRED);
		boolean isNotExecuted = hasStatus(filter, EventInstanceStatusDictionary.NOT_EXECUTED);
		boolean isExecuted = hasStatus(filter, EventInstanceStatusDictionary.EXECUTED);
		if (isAll_FKR) {
			query += " AND (" + countFKR + ") > 0 ";
		}
		if (isExpared) {
			query += " AND ei.executed_date is null AND ei.plan_date < sysdate ";
		}
		if (isNotExecuted) {
			query += " AND ei.executed_date is null  ";
		}
		if (isExecuted) {
			query += " AND ei.executed_date is not null ";
		}
		return query;
	}

	private boolean hasStatus(EventsByDateFilter filter, EventInstanceStatusDictionary status) {
		for (KmEventInstanceStatus eventStatus : filter.getStatuses()) {
			if (eventStatus.getId() == status.getId()) {
				return true;
			}
		}
		return false;
	}

	@Override
	public KmEventInstance getEventForExecute(long eventID) {
		String query = sql.getValue(EventDaoSqlKey.EVENT_FOR_EXECUTE);
		KmEventInstance instance = queryForObject(query, new KmEventInstanceRm(), "Error in getEventForExecute", eventID);
		KmRepeatType repeatType = instance.getEvent().getRepeatType();
		if (repeatType != null && EventRepeatTypeDictionary.EVERY_WEEK.getId().equals(repeatType.getId())) {
			query = sql.getValue(EventDaoSqlKey.DAYS_OF_WEEK_FOR_PLAN_EVENT);
			List<DayOfWeek> daysOfWeek = queryForList(query, new DayOfWeekRm(), "Error in getEventForExecute.", instance.getEvent().getId());
			instance.getEvent().setDaysOfWeek(daysOfWeek);
		}
		if (repeatType != null && EventRepeatTypeDictionary.RANDOM.getId().equals(repeatType.getId())) {
			query = sql.getValue(EventDaoSqlKey.SCHEDULE_FOR_PLAN_EVENT);
			List<Date> schedule = queryForList(query, Date.class, "Error in getEventForExecute.", instance.getEvent().getId());
			instance.getEvent().setSchedule(schedule);
		}
		List<KmFkr> fkrList = getFkrListForEvent(eventID);
		instance.setFkrList(fkrList);
		return instance;
	}

	private List<KmFkr> getFkrListForEvent(long eventID) {
		String query = sql.getValue(EventDaoSqlKey.FKR_LIST_FOR_EVENT);
		return queryForList(query, new KmFkrRm(), "Error getFkrListForEvent.", eventID);
	}

	@Override
	public List<EventResult> getEventResults() {
		if (eventResults == null) {
			String query = sql.getValue(EventDaoSqlKey.EVENT_RESULTS);
			eventResults = queryForList(query, new KmEventResultRm(), "Error selecting event results.");
		}
		return Collections.unmodifiableList(eventResults);
	}

	@Override
	public void removeEventInstance(long eventInstanceID) {
		String query = sql.getValue(EventDaoSqlKey.REMOVE_EVENT_INSTANCE);
		update(query, "Error removeEventInstance", eventInstanceID);
	}

	@Override
	public void saveEventInstance(KmEventInstance event) {
		String query = sql.getValue(EventDaoSqlKey.SAVE_EVENT_INSTANCE);
		Long confTypeId = (event.getConfirmationType() != null) ? event.getConfirmationType().getId() : null;
		Long docGroupId = (event.getDocumentGroup() != null) ? event.getDocumentGroup().getId() : null;
		Long docTypeId = (event.getDocumentType() != null) ? event.getDocumentType().getId() : null;
		Long sourceDocId = (event.getSourceDoc() != null) ? event.getSourceDoc().getId() : null;
		Long punitiveMeasureId = (event.getPunitiveMeasure() != null) ? event.getPunitiveMeasure().getId() : null;
		Long statusId = (event.getStatus() != null) ? event.getStatus().getId() : null;
		Long resultId = (event.getResult() != null) ? event.getResult().getId() : null;
		update(query, "Error saveEventInstance", event.getResultNote(), confTypeId, docGroupId, docTypeId, sourceDocId, event.getSourceDocComment(),
				event.getSourceDocNumber(), event.getSourceDocDate(), punitiveMeasureId, event.getPunitiveMeasureDescr(), event.getIsSanction(),
				event.getSanctionDate(), event.getSanctionValue(), event.getSanctionCurrency(), event.getSanctionRefusedBy(),
				event.getSanctionRefusedDocNum(), event.getSanctionRefusedDate(), statusId, resultId, event.getFkrCandLong(), event.getId());
		saveDocFromEvent(event);
		// addFkrToEvent(event);
	}

	// private void addFkrToEvent(KmEventInstance event) {
	// deleteFkrFromEvent(event);
	// if (isEventResult(FKR, event) || isEventResult(SANCTION_FKR, event)) {
	// KmFkr fkr = event.getFkr();
	// if (fkr != null && fkr.getType() != null && fkr.getType().getId() != null) {
	// String query = sql.getValue(EventDaoSqlKey.ADD_FKR);
	// long sign = fkr.isSignificant() ? 1 : 0;
	// update(query, "Error in addFkrToEvent", fkr.getType().getId(), event.getId(), sign, fkr.getNotes(), fkr.getCreated());
	// }
	// }
	// }

	// private void deleteFkrFromEvent(KmEventInstance event) {
	// String query = sql.getValue(EventDaoSqlKey.DELETE_FKR);
	// update(query, "Error in deleteFkrFromEvent", event.getId());
	// }

	@Override
	public void executeEventInstance(KmEventInstance event) {
		String query = sql.getValue(EventDaoSqlKey.EXECUTE_EVENT_INSTANCE);
		Long resultId = (event.getResult() != null) ? event.getResult().getId() : null;
		Long statusId = (event.getStatus() != null) ? event.getStatus().getId() : null;
		Long confTypeId = (event.getConfirmationType() != null) ? event.getConfirmationType().getId() : null;
		Long docGroupId = (event.getDocumentGroup() != null) ? event.getDocumentGroup().getId() : null;
		Long docTypeId = (event.getDocumentType() != null) ? event.getDocumentType().getId() : null;
		Date executedDate = (isEventExecuted(statusId)) ? new java.sql.Date(System.currentTimeMillis()) : null;
		Long sourceDocId = (event.getSourceDoc() != null) ? event.getSourceDoc().getId() : null;
		Long punitiveMeasureId = (event.getPunitiveMeasure() != null) ? event.getPunitiveMeasure().getId() : null;
		update(query, "Error executeEventInstance", event.getResultNote(), statusId, resultId, confTypeId, docGroupId, docTypeId, executedDate,
				sourceDocId, event.getSourceDocComment(), event.getSourceDocNumber(), event.getSourceDocDate(), punitiveMeasureId,
				event.getPunitiveMeasureDescr(), event.getIsSanction(), event.getSanctionDate(), event.getSanctionValue(),
				event.getSanctionCurrency(), event.getSanctionRefusedBy(), event.getSanctionRefusedDocNum(), event.getSanctionRefusedDate(),
				event.getId());
		saveDocFromEvent(event);
		// addFkrToEvent(event);
	}

	private boolean isEventExecuted(Long statusId) {
		boolean isNotWaitProcessing = (statusId != null && KmEventStatusDictionary.WAIT_PROCESSING.getId() != statusId.longValue());
		boolean isNotSuspend = (statusId != null && KmEventStatusDictionary.SUSPEND.getId() != statusId.longValue());
		boolean isNotInJob = (statusId != null && KmEventStatusDictionary.IN_JOB.getId() != statusId.longValue());
		return (isNotWaitProcessing && isNotSuspend && isNotInJob);
	}

	// private boolean isEventResult(EventResultDictionary dict, KmEventInstance kmEventInstance) {
	// if (kmEventInstance.getResult() == null)
	// return false;
	// Long result = kmEventInstance.getResult().getId();
	// return (result != null && result.intValue() == dict.getId()) ? true : false;
	// }

	/**
	 * сохраняем приаттаченные доки:
	 * 
	 * @param event
	 * @param docGroupId
	 * @param docTypeId
	 */
	private void saveDocFromEvent(KmEventInstance event) {
		AppFile doc = event.getConfirmFile();
		if (doc != null) {
			String query = sql.getValue(EventDaoSqlKey.ADD_APP_FILE);
			Long docGroupId = (doc.getDocGroup() != null) ? doc.getDocGroup().getId() : null;
			Long docTypeId = (doc.getDocType() != null) ? doc.getDocType().getId() : null;
			Long whoAddId = (doc.getWhoAdd() != null) ? doc.getWhoAdd().getId() : null;
			update(query, "Error in ADD_APP_FILE", doc.getId(), doc.getName(), doc.getData(), doc.getType(), doc.getOwnerID(), doc.getOwnerType(),
					whoAddId, doc.getDateOfAdd(), docGroupId, docTypeId);
		}
	}

	@Override
	public List<KmEventChronology> getEventChronology(int startIndex, int amount, long eventID) {
		String query = sql.getValue(EventDaoSqlKey.EVENT_CHRONOLOGY);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		return queryForList(query, new KmEventChronologyRm(), "Error selecting event Chronology.", eventID, startIndex, startIndex + amount);
	}

	@Override
	public int getEventChronologyCount(long eventID) {
		String query = sql.getValue(EventDaoSqlKey.EVENT_CHRONOLOGY_COUNT);
		return queryForInt(query, "Error selecting event Chronology count.", eventID);
	}

	@Override
	public KmEventInstance getEventInstance(long eventID) {
		String query = sql.getValue(EventDaoSqlKey.EVENT_BY_ID);
		return queryForObject(query, new KmEventInstanceRm(), "Error selecting event.", eventID);
	}

	@Override
	public List<PunitiveMeasure> getPunitiveMeasures(long idEventType) {
		String query = sql.getValue(EventDaoSqlKey.PUNITIVE_MEASURES_FOR_EVENT_TYPE);
		return queryForList(query, new PunitiveMeasureRm(), "Error selecting punitiveMeasures results.", idEventType);
	}
}
