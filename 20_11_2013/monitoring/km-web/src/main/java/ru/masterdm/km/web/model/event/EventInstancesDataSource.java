package ru.masterdm.km.web.model.event;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.searchfilter.EventsByDateFilter;
import ru.masterdm.km.dao.EventDao;
import ru.masterdm.km.util.query.SortCriterion;
import ru.masterdm.km.web.util.SortUtil;

/**
 * DataSource для "Исполнение мероприятий по Дате".
 * 
 * @author Shafigullin Ildar
 * 
 */
public class EventInstancesDataSource implements GridDataSource {
	private int startIndex;
	private List<KmEventInstance> instances;
	private EventsByDateFilter filter;

	public EventInstancesDataSource(EventsByDateFilter filter, EventDao eventDao) {
		super();
		this.filter = filter;
		this.eventDao = eventDao;
	}

	private EventDao eventDao;

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		List<SortCriterion> sortCriteria = SortUtil.toSortCriteria(sortConstraints);
		instances = eventDao.getInstances(startIndex, endIndex - startIndex + 1, filter, sortCriteria);
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
		return eventDao.getInstanceCount(filter);
	}
}
