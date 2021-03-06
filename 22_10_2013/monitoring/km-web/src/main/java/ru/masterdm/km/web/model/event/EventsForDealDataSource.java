package ru.masterdm.km.web.model.event;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.dao.DealDao;

/**
 * Мероприятия для сделки DataSource.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class EventsForDealDataSource implements GridDataSource {
	private int startIndex;
	private long dealID;
	private List<KmEventInstance> instances;
	private DealDao dealDao;

	public EventsForDealDataSource(DealDao dealDao, long dealID) {
		this.dealDao = dealDao;
		this.dealID = dealID;
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		instances = dealDao.getDealCalendar(startIndex, endIndex - startIndex + 1, dealID);
	}

	@Override
	public Object getRowValue(int index) {
		return instances.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return KmEventInstance.class;
	}

	@Override
	public int getAvailableRows() {
		return dealDao.getDealCalendarCount(dealID);
	}
}
