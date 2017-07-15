package ru.masterdm.km.dao;

import static ru.masterdm.km.dao.DealDaoSqlKey.DEAL_CALENDAR;
import static ru.masterdm.km.dao.DealDaoSqlKey.DEAL_CALENDAR_COUNT;
import static ru.masterdm.km.dao.DealDaoSqlKey.DEAL_INSTANCES;
import static ru.masterdm.km.dao.DealDaoSqlKey.DEAL_INSTANCE_COUNT;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ru.masterdm.km.common.dictionary.KmEventStatusDictionary;
import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.ContractorType;
import ru.masterdm.km.common.entity.ContractorTypeInstance;
import ru.masterdm.km.common.entity.DayOfWeek;
import ru.masterdm.km.common.entity.DealInstance;
import ru.masterdm.km.common.entity.KmClassifier;
import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.common.entity.KmEventCalendar;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.common.searchfilter.CalendarFilter;
import ru.masterdm.km.common.searchfilter.EventsByDealFilter;
import ru.masterdm.km.dao.mapper.ContractorRm;
import ru.masterdm.km.dao.mapper.ContractorTypeInstanceRm;
import ru.masterdm.km.dao.mapper.ContractorTypeRm;
import ru.masterdm.km.dao.mapper.DayOfWeekRm;
import ru.masterdm.km.dao.mapper.DealInstanceRm;
import ru.masterdm.km.dao.mapper.KmClassifiersRm;
import ru.masterdm.km.dao.mapper.KmEventCalendarRm;
import ru.masterdm.km.dao.mapper.KmEventInstanceRm;
import ru.masterdm.km.dao.mapper.KmFkrRm;
import ru.masterdm.km.util.AcceptKmEventProcessor;
import ru.masterdm.km.util.BaseJdbcDao;
import ru.masterdm.km.util.query.SortCriterion;

/**
 * Реализация DAO интерфейса для сущности "Сделка".
 * 
 * @author Shafigullin Ildar
 */
public class DealDaoImpl extends BaseJdbcDao<DealDaoSqlKey> implements DealDao {
	@Override
	public int getInstanceCount(EventsByDealFilter filter) {
		String query = sql.getValue(DEAL_INSTANCE_COUNT);
		ArrayList<Object> params = new ArrayList<Object>();
		query = filterQuery(filter, query, params);
		return queryForInt(query, "Error selecting deal instance count.", params.toArray());
	}

	private String filterQuery(EventsByDealFilter filter, String query, List<Object> params) {
		if (filter.getCurrency() != null) {
			query += " AND m.MDTASK_SUM_CURRENCY = '" + filter.getCurrency().getId() + "'";
		}
		if (filter.getAmountFrom() != null) {
			query += " AND m.MDTASK_SUM >= " + filter.getAmountFrom();
		}
		if (filter.getAmountTo() != null) {
			query += " AND m.MDTASK_SUM <= " + filter.getAmountTo();
		}
		if (filter.getDateFrom() != null) {
			query += " AND m.VALID_TO >= ? ";
			params.add(new java.sql.Date(filter.getDateFrom().getTime()));
		}
		if (filter.getDateTo() != null) {
			query += " AND m.VALID_TO <= ? ";
			params.add(new java.sql.Date(filter.getDateTo().getTime()));
		}
		if (filter.getSpkpNumber() != null) {
			query += " AND lower(m.MDTASK_NUMBER) like lower(?) ";
			params.add("%" + filter.getSpkpNumber() + "%");
		}
		if (filter.getContractor() != null) {
			// query += " AND o.organization_name = ? ";
			query += " AND m.ID_MDTASK IN (select id_mdtask from V_CPS_DEAL_CONTRACTOR where id_crmorg=?) ";
			params.add(filter.getContractor().getId());
		}
		if (filter.getSelectedStatuses() != null && !filter.getSelectedStatuses().isEmpty()) {
			query = filterStatuses(filter, query);
		}
		if (filter.getDealType() != null) {
			query += " AND m.product_name = ? ";
			params.add(filter.getDealType().getName());
		}

		return query;
	}

	/**
	 * @param filter
	 * @param query
	 * @return
	 */
	private String filterStatuses(EventsByDealFilter filter, String query) {
		String countFKR = "select count(id_fkr) from KM_FKR where id_mdtask = m.ID_MDTASK";
		String countExpared = "select count(id_event) from km_event e "
				+ "inner join km_event_calendar c on c.id_event_calendar = e.id_event_calendar "
				+ "where c.id_mdtask = m.ID_MDTASK and e.executed_date is null and e.plan_date < sysdate";
		boolean isSignificantFKR = filter.getSelectedStatuses().contains(filter.STATUSES[1]);
		boolean isNotSignificantFKR = filter.getSelectedStatuses().contains(filter.STATUSES[2]);
		boolean isAll_FKR = filter.getSelectedStatuses().contains(filter.STATUSES[0]) || (isSignificantFKR && isNotSignificantFKR);
		boolean isExpared = filter.getSelectedStatuses().contains(filter.STATUSES[3]);
		if (isAll_FKR && isExpared) {
			query += " AND ((" + countFKR + ") > 0 OR (" + countExpared + ") > 0) ";
		} else if (isAll_FKR) {
			query += " AND (" + countFKR + ") > 0 ";
		} else if (isExpared) {
			query += " AND (" + countExpared + ") > 0 ";
		} else {
			if (isSignificantFKR) {
				query += " AND (" + countFKR + " and is_significant = 1) > 0 ";
			} else if (isNotSignificantFKR) {
				query += " AND (((" + countFKR + " and is_significant = 1) = 0) and ((" + countFKR + " and is_significant = 0) > 0)) ";
			}
		}

		return query;
	}

	@Override
	public List<DealInstance> getInstances(int startIndex, int amount, EventsByDealFilter filter, List<SortCriterion> sortCriteria) {
		ArrayList<Object> params = new ArrayList<Object>();
		String query = "select v.* from (";
		query += sql.getValue(DEAL_INSTANCES);
		String orderBy = getOrderBy(sortCriteria);
		query += ", row_number() over (order by " + orderBy + ") rn from V_CPS_CREDIT_DEAL m "
				+ "inner join crm_organization o on m.id_borrower = o.id_org where m.IS_MDTASK_CONFIRMED = 1 and m.MDTASK_TYPE_KEY = 'DEAL' ";
		query = filterQuery(filter, query, params);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		params.add(startIndex);
		params.add(startIndex + amount);
		return queryForList(query, new DealInstanceRm(), "Error selecting deal instances.", params.toArray());
	}

	private String getOrderBy(List<SortCriterion> sortCriteria) {
		String orderBy = "m.ID_MDTASK";
		if (!sortCriteria.isEmpty()) {
			SortCriterion sortCriterion = sortCriteria.get(0);
			String propertyName = sortCriterion.getPropertyName();
			if ("spkpNumber".equalsIgnoreCase(propertyName)) {
				orderBy = "m.MDTASK_NUMBER";
			} else if ("contractorName".equalsIgnoreCase(propertyName)) {
				orderBy = "m.borrower_name";
			} else if ("amount".equalsIgnoreCase(propertyName)) {
				orderBy = "m.MDTASK_SUM";
			} else if ("currency".equalsIgnoreCase(propertyName)) {
				orderBy = "m.MDTASK_SUM_CURRENCY";
			} else if ("dealType".equalsIgnoreCase(propertyName)) {
				orderBy = "m.product_name";
			} else if ("dealDate".equalsIgnoreCase(propertyName)) {
				orderBy = "m.valid_to";
			} else if ("contractNumber".equalsIgnoreCase(propertyName)) {
				orderBy = "m.ID_MDTASK";
			}
			orderBy += sortCriterion.getSortDirection().toStringForJpql();
		}
		return orderBy;
	}

	@Override
	public List<KmEventInstance> getDealCalendar(int startIndex, int amount, long dealID) {
		String query = sql.getValue(DEAL_CALENDAR);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		return queryForList(query, new KmEventInstanceRm(), "Error selecting deal calendar.", dealID, startIndex, startIndex + amount);
	}

	@Override
	public int getDealCalendarCount(long dealID) {
		String query = sql.getValue(DEAL_CALENDAR_COUNT);
		return queryForInt(query, "Error selecting Deal Calendar count.", dealID);
	}

	@Override
	public List<KmClassifier> getClassifiers(int startIndex, int i) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_CLASSIFIERS);
		return queryForList(query, new KmClassifiersRm(), "Error selecting classifiers.");
	}

	@Override
	public int getClassifiersCount() {
		String query = sql.getValue(DealDaoSqlKey.DEAL_CLASSIFIERS_COUNT);
		return queryForInt(query, "Error selecting Classifiers count.");
	}

	@Override
	public List<KmEventCalendar> getDealPlan(int startIndex, int amount, long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_PLAN);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		return queryForList(query, new KmEventCalendarRm(), "Error selecting deal plal.", dealID, startIndex, startIndex + amount);
	}

	@Override
	public int getDealPlanCount(long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_PLAN_COUNT);
		return queryForInt(query, "Error selecting Deal plan count.", dealID);
	}

	@Override
	public void addEventType(long dealID, long eventTypeID, String eventName) {
		// копируем параметры из классификатора для создания планового мероприятия для сделки:
		String query = sql.getValue(DealDaoSqlKey.COPY_PLAN_EVENT_FOR_DEAL_FROM_TYPE);
		KmEventCalendar event = queryForObject(query, new KmEventCalendarRm(), "Error in addEventType", eventTypeID);
		// System.out.println(event);
		// Создаем плановое мероприятие:
		query = sql.getValue(DealDaoSqlKey.ADD_EVENT_TYPE_SEQ);
		long eventID = queryForLong(query, "Error get sequences for km_event");
		query = sql.getValue(DealDaoSqlKey.ADD_EVENT_TYPE);
		Long repeatTypeID = (event.getRepeatType() != null) ? event.getRepeatType().getId() : null;
		update(query, "Error add EventType to Deal", eventID, event.getName(), dealID, event.getId(), repeatTypeID, event.getPeriodDate(),
				event.getPeriodDetails(), event.getNotification().getPeriod(), event.getNotification().getPeriodKind(), event.getPeriodWeekend(),
				event.isExcludeHoliday() ? 1 : 0, event.getNotification().isAlarmOnEventStartDay() ? 1 : 0, event.getNotification()
						.isContinueToAlarmWhenUnfulfilled() ? 1 : 0, event.getNotification().isIncludeLinkInTextMessage() ? 1 : 0);
		// Копируем дни недели(пока для всех типов? TODO):
		// if (event.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_WEEK.getId().equals(event.getRepeatType().getId())) {
		query = sql.getValue(DealDaoSqlKey.DAYS_OF_WEEK_FOR_EVENT_TYPE);
		List<DayOfWeek> daysOfWeek = queryForList(query, new DayOfWeekRm(), "Error in addEventType.", eventTypeID);
		// System.out.println(daysOfWeek);
		if (daysOfWeek != null && !daysOfWeek.isEmpty()) {
			query = sql.getValue(DealDaoSqlKey.ATTACH_DAYS_OF_WEEK_TO_PLAN_EVENT);
			for (DayOfWeek dayOfWeek : daysOfWeek) {
				update(query, "Error attach dayOfWeek in addEventType", eventID, dayOfWeek.getId());
			}
		}
		// }
	}

	@Override
	public void removeEventType(long dealID, long eventTypeID) {
		String query = sql.getValue(DealDaoSqlKey.REMOVE_EVENT_TYPE);
		update(query, "Error remove EventType from Deal", dealID, eventTypeID);
	}

	@Override
	public void acceptEventType(long dealID, long eventCalendarID) {
		// получаем сущность планового мероприятия:
		KmEventCalendar planEvent = getPlanEventForDeal(eventCalendarID);
		// формируем календарное мероприятие в зависимости от типа:
		java.util.Calendar date = AcceptKmEventProcessor.createCalendarDateFromPlanEvent(planEvent);
		// проверяем: есть ли такое КМ на эту дату:
		if (!isExistEventInstance(eventCalendarID, date)) {
			addEvent(eventCalendarID, planEvent, date);
		}
	}

	private void addEvent(long eventCalendarID, KmEventCalendar planEvent, java.util.Calendar date) {
		String query = sql.getValue(DealDaoSqlKey.ACCEPT_EVENT_TYPE);
		Long docGroupId = (planEvent.getDocumentGroup() != null) ? planEvent.getDocumentGroup().getId() : null;
		Long docTypeId = (planEvent.getDocumentType() != null) ? planEvent.getDocumentType().getId() : null;
		Long confTypeId = (planEvent.getConfirmationType() != null) ? planEvent.getConfirmationType().getId() : null;
		Long sourceDocId = (planEvent.getSourceDoc() != null) ? planEvent.getSourceDoc().getId() : null;
		Long punitiveMeasureId = (planEvent.getPunitiveMeasure() != null) ? planEvent.getPunitiveMeasure().getId() : null;
		String punitiveMeasureDescr = (planEvent.getPunitiveMeasure() != null) ? planEvent.getPunitiveMeasure().getSumDesc() : null;
		update(query, "Error accept EventType for Deal", eventCalendarID, new java.sql.Date(date.getTime().getTime()),
				KmEventStatusDictionary.WAIT_PROCESSING.getId(), confTypeId, docGroupId, docTypeId, sourceDocId, planEvent.getSourceDocComment(),
				planEvent.getSourceDocNumber(), planEvent.getSourceDocDate(), punitiveMeasureId, punitiveMeasureDescr, planEvent.getFkrCandLong());
	}

	private boolean isExistEventInstance(long eventCalendarID, java.util.Calendar date) {
		String query = sql.getValue(DealDaoSqlKey.IS_EXIST_EVENT_INSTANCE);
		if (queryForInt(query, "Error in isExistEventInstance.", eventCalendarID, new java.sql.Date(date.getTime().getTime())) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public KmEventCalendar getPlanEventForDeal(long eventPlanID) {
		String query = sql.getValue(DealDaoSqlKey.PLAN_EVENT_FOR_DEAL);
		KmEventCalendar event = queryForObject(query, new KmEventCalendarRm(), "Error in getPlanEventForDeal", eventPlanID);
		query = sql.getValue(DealDaoSqlKey.DAYS_OF_WEEK_FOR_PLAN_EVENT);
		List<DayOfWeek> daysOfWeek = queryForList(query, new DayOfWeekRm(), "Error in getPlanEventForDeal.", eventPlanID);
		event.setDaysOfWeek(daysOfWeek);
		query = sql.getValue(DealDaoSqlKey.SCHEDULE_FOR_PLAN_EVENT);
		List<Date> schedule = queryForList(query, Date.class, "Error in getPlanEventForDeal.", eventPlanID);
		event.setSchedule(schedule);
		return event;
	}

	@Override
	public void savePlanEventForDeal(KmEventCalendar event) {
		String query = sql.getValue(DealDaoSqlKey.SAVE_PLAN_EVENT_FOR_DEAL);
		Long repeatTypeId = (event.getRepeatType() != null) ? event.getRepeatType().getId() : null;
		Long docGroupId = (event.getDocumentGroup() != null) ? event.getDocumentGroup().getId() : null;
		Long docTypeId = (event.getDocumentType() != null) ? event.getDocumentType().getId() : null;
		Long confTypeId = (event.getConfirmationType() != null) ? event.getConfirmationType().getId() : null;
		Long sourceDocId = (event.getSourceDoc() != null) ? event.getSourceDoc().getId() : null;
		Long punitiveMeasureId = (event.getPunitiveMeasure() != null) ? event.getPunitiveMeasure().getId() : null;
		update(query, "Error savePlanEventForDeal", repeatTypeId, event.getNotification().getPeriodKind(), event.getNotification().getPeriod(),
				event.getStartDate(), event.getEndDate(), event.getPeriodDate(), event.getPeriodDetails(), event.getPeriodWeekend(),
				(event.isExcludeHoliday() ? 1 : 0), (event.getNotification().isAlarmOnEventStartDay() ? 1 : 0), (event.getNotification()
						.isContinueToAlarmWhenUnfulfilled() ? 1 : 0), (event.getNotification().isIncludeLinkInTextMessage() ? 1 : 0), confTypeId,
				docGroupId, docTypeId, event.getDocTypeByHand(), sourceDocId, event.getSourceDocComment(), event.getSourceDocNumber(),
				event.getSourceDocDate(), punitiveMeasureId, event.getFkrCandLong(), event.getId());
		query = sql.getValue(DealDaoSqlKey.DETACH_DAYS_OF_WEEK_FROM_PLAN_EVENT);
		update(query, "Error deattach dayOfWeek in savePlanEventForDeal", event.getId());
		if (event.getDaysOfWeek() != null && !event.getDaysOfWeek().isEmpty()) {
			query = sql.getValue(DealDaoSqlKey.ATTACH_DAYS_OF_WEEK_TO_PLAN_EVENT);
			for (DayOfWeek dayOfWeek : event.getDaysOfWeek()) {
				update(query, "Error attach dayOfWeek in savePlanEventForDeal", event.getId(), dayOfWeek.getId());
			}
		}
		query = sql.getValue(DealDaoSqlKey.DETACH_SCHEDULE_FROM_PLAN_EVENT);
		update(query, "Error deattach schedule in savePlanEventForDeal", event.getId());
		if (event.getSchedule() != null && !event.getSchedule().isEmpty()) {
			query = sql.getValue(DealDaoSqlKey.ATTACH_SCHEDULE_TO_PLAN_EVENT);
			for (Date date : event.getSchedule()) {
				update(query, "Error attach schedule in savePlanEventForDeal", event.getId(), date);
			}
		}
	}

	@Override
	public boolean isExistEventType(long dealID, long eventTypeID) {
		String query = sql.getValue(DealDaoSqlKey.IS_EXIST_EVENT_TYPE);
		if (queryForInt(query, "Error in isExistEventType for Deal.", dealID, eventTypeID) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<KmEventCalendar> getDealPlan(int startIndex, int amount, long dealID, KmEvent filter) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_PLAN_BY_FILTER);
		if (filter.getMonitoredObjectType() != null) {
			query += " and m.id = " + filter.getMonitoredObjectType().getId();
		}
		if (filter.getEventTypeGroup() != null) {
			query += " and g.id_event_group = " + filter.getEventTypeGroup().getId();
		}
		if (filter.getEventType() != null) {
			query += " and t.id_event_type = " + filter.getEventType().getId();
		}
		query += " ) v where v.rn > ? and v.rn <= ? ";
		return queryForList(query, new KmEventCalendarRm(), "Error selecting deal plal.", dealID, startIndex, startIndex + amount);
	}

	@Override
	public int getDealPlanCount(long dealID, KmEvent filter) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_PLAN_COUNT_BY_FILTER);
		if (filter.getMonitoredObjectType() != null) {
			query += " and m.id = " + filter.getMonitoredObjectType().getId();
		}
		if (filter.getEventTypeGroup() != null) {
			query += " and g.id_event_group = " + filter.getEventTypeGroup().getId();
		}
		if (filter.getEventType() != null) {
			query += " and t.id_event_type = " + filter.getEventType().getId();
		}
		return queryForInt(query, "Error selecting Deal plan count.", dealID);
	}

	@Override
	public List<KmEventInstance> getDealCalendar(int startIndex, int amount, long dealID, KmEvent filter) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_CALENDAR_BY_FILTER);
		if (filter.getMonitoredObjectType() != null) {
			query += " and o.id = " + filter.getMonitoredObjectType().getId();
		}
		if (filter.getEventTypeGroup() != null) {
			query += " and g.id_event_group = " + filter.getEventTypeGroup().getId();
		}
		if (filter.getEventType() != null) {
			query += " and t.id_event_type = " + filter.getEventType().getId();
		}
		query += " ) v where v.rn > ? and v.rn <= ? ";
		return queryForList(query, new KmEventInstanceRm(), "Error selecting deal calendar.", dealID, startIndex, startIndex + amount);
	}

	@Override
	public int getDealCalendarCount(long dealID, KmEvent filter) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_CALENDAR_COUNT_BY_FILTER);
		if (filter.getMonitoredObjectType() != null) {
			query += " and o.id = " + filter.getMonitoredObjectType().getId();
		}
		if (filter.getEventTypeGroup() != null) {
			query += " and g.id_event_group = " + filter.getEventTypeGroup().getId();
		}
		if (filter.getEventType() != null) {
			query += " and t.id_event_type = " + filter.getEventType().getId();
		}
		return queryForInt(query, "Error selecting Deal Calendar count.", dealID);
	}

	@Override
	public void acceptPlan(long dealID, KmEvent filter) {
		int amount = getDealPlanCount(dealID, filter);
		List<KmEventCalendar> list = getDealPlan(0, amount, dealID, filter);
		for (KmEventCalendar event : list) {
			acceptEventType(dealID, event.getId());
		}
	}

	@Override
	public List<KmFkr> getDealFkr(int startIndex, int amount, long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_FKR);
		query += " ) v where v.rn > ? and v.rn <= ? ";
		return queryForList(query, new KmFkrRm(), "Error getDealFkr.", dealID, startIndex, startIndex + amount);
	}

	@Override
	public int getDealFkrCount(long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_FKR_COUNT);
		return queryForInt(query, "Error selecting Deal FKR count.", dealID);
	}

	@Override
	public void addFkrToDeal(KmFkr fkr, long dealID) {
		String query = sql.getValue(DealDaoSqlKey.ADD_FKR);
		long sign = fkr.isSignificant() ? 1 : 0;
		update(query, "Error in addFkrToDeal", fkr.getType().getId(), dealID, sign, fkr.getNotes());
	}

	@Override
	public List<KmEventInstance> getDealCalendar(long dealID, CalendarFilter filter) {
		String query = sql.getValue(DealDaoSqlKey.GET_DEAL_CALENDAR);
		ArrayList<Object> params = new ArrayList<Object>();
		params.add(dealID);
		if (filter.getDateFrom() != null) {
			query += " and ei.plan_date >= ? ";
			params.add(new java.sql.Date(filter.getDateFrom().getTime()));
		}
		if (filter.getDateTo() != null) {
			query += " and ei.plan_date <= ? ";
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
		query += " order by ei.plan_date desc ";
		return queryForList(query, new KmEventInstanceRm(), "Error selecting deal calendar.", params.toArray());
	}

	@Override
	public DealInstance getDealInstance(long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_BY_ID);
		return queryForObject(query, new DealInstanceRm(), "Error selecting deal.", dealID);
	}

	@Override
	public List<Contractor> getDealContractors(long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_CONTRACTORS);
		List<Contractor> list = queryForList(query, new ContractorRm(), "Error selecting deal contractors.", dealID);
		for (Contractor client : list) {
			initContractorTypes(client, dealID);
		}
		return list;
	}

	private void initContractorTypes(Contractor client, long dealID) {
		String query = sql.getValue(DealDaoSqlKey.DEAL_CONTRACTOR_TYPES);
		List<ContractorType> list = queryForList(query, new ContractorTypeRm(), "Error selecting contractor types.", client.getId(), dealID);
		client.setTypes(list);
	}

	@Override
	public List<Contractor> getContractorsForDeal(long dealID) {
		String query = sql.getValue(DealDaoSqlKey.CONTRACTORS_FOR_DEAL);
		List<ContractorTypeInstance> listTypeIns = queryForList(query, new ContractorTypeInstanceRm(), "Error getContractorsForDeal.", dealID);
		List<Contractor> list = new ArrayList<Contractor>();
		Contractor curClient = null;
		for (ContractorTypeInstance typeIns : listTypeIns) {
			if (curClient == null || !curClient.getId().equals(typeIns.getContractor().getId())) {
				curClient = typeIns.getContractor();
				curClient.setTypes(new ArrayList<ContractorType>());
				list.add(curClient);
			}
			ContractorType type = new ContractorType();
			type.setId(typeIns.getId());
			type.setName(typeIns.getName());
			curClient.getTypes().add(type);
		}
		return list;
	}

	@Override
	public void acceptNextEventType(long dealID, long eventCalendarID, Date executedDate) {
		// получаем сущность планового мероприятия:
		KmEventCalendar planEvent = getPlanEventForDeal(eventCalendarID);
		java.util.Calendar date = AcceptKmEventProcessor.createNextCalendarDateFromPlanEvent(planEvent, executedDate);
		// формируем следующее календарное мероприятие в зависимости от типа:
		if (date != null) {
			addEvent(eventCalendarID, planEvent, date);
		}
	}
}
