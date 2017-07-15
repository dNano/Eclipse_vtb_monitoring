package ru.masterdm.km.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import ru.masterdm.km.common.entity.KmEventChronology;
import ru.masterdm.km.common.entity.EventResult;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.searchfilter.EventsByDateFilter;
import ru.masterdm.km.util.query.SortCriterion;

/**
 * 
 * @author Alexey Chalov
 */
public class EventDaoMockImpl implements EventDao {

	private List<KmEventInstance> eventInstances;

	@Override
	public int getInstanceCount(EventsByDateFilter filter) {
		int result = 0;
		for (KmEventInstance inst : eventInstances) {
			if (eventInstanceMatchesFilter(inst, filter)) {
				result++;
			}
		}
		return result;
	}

	@Override
	public List<KmEventInstance> getInstances(int startIndex, int amount, EventsByDateFilter filter, List<SortCriterion> sortCriteria) {
		List<KmEventInstance> matches = new ArrayList<KmEventInstance>();
		int start = 0;
		for (KmEventInstance inst : eventInstances) {
			/* filter precondition checks */
			boolean add = eventInstanceMatchesFilter(inst, filter);

			/* page list precondition checks */
			if (add && ++start > startIndex) {
				matches.add(inst);
			}
			if (matches.size() == amount) {
				return matches;
			}
		}
		return matches;
	}

	private boolean eventInstanceMatchesFilter(KmEventInstance inst, EventsByDateFilter filter) {
		if (!filter.getStatuses().contains(inst.getStatus())) {
			return false;
		}
		if (filter.getDateFrom() != null && filter.getDateFrom().after(inst.getPlanExecutionDate())) {
			return false;
		}
		if (filter.getDateTo() != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(filter.getDateTo());
			calendar.add(Calendar.DATE, 1);
			if (!calendar.getTime().after(inst.getPlanExecutionDate())) {
				return false;
			}
		}
		if (filter.getCurrency() != null && !filter.getCurrency().equals(inst.getEvent().getDeal().getCurrency())) {
			return false;
		}
		if (filter.getAmountFrom() != null && filter.getAmountFrom() > inst.getEvent().getDeal().getAmount()) {
			return false;
		}
		if (filter.getAmountTo() != null && filter.getAmountTo() < inst.getEvent().getDeal().getAmount()) {
			return false;
		}
		// TODO: вид сделки
		return true;
	}

	public void setEventInstances(List<KmEventInstance> eventInstances) {
		this.eventInstances = eventInstances;
	}

	@Override
	public KmEventInstance getEventForExecute(long eventID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventResult> getEventResults() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeEventInstance(long eventInstanceID) {
		// TODO Auto-generated method stub

	}

	@Override
	public void saveEventInstance(KmEventInstance event) {
		// TODO Auto-generated method stub

	}

	@Override
	public void executeEventInstance(KmEventInstance event) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<KmEventChronology> getEventChronology(int startIndex, int i, long eventID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getEventChronologyCount(long eventID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public KmEventInstance getEventInstance(long eventID) {
		// TODO Auto-generated method stub
		return null;
	}

}
