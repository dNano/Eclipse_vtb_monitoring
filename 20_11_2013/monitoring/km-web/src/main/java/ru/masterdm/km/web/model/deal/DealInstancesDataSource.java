package ru.masterdm.km.web.model.deal;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.DealInstance;
import ru.masterdm.km.common.searchfilter.EventsByDealFilter;
import ru.masterdm.km.dao.DealDao;
import ru.masterdm.km.util.query.SortCriterion;
import ru.masterdm.km.web.util.SortUtil;

/**
 * DataSource для "Список сделок при формирование мероприятий".
 * 
 * @author Shafigullin Ildar
 * 
 */
public class DealInstancesDataSource implements GridDataSource {
	private int startIndex;
	private List<DealInstance> instances;
	private DealDao dealDao;
	private EventsByDealFilter filter;

	public DealInstancesDataSource(DealDao dealDao, EventsByDealFilter filter) {
		super();
		this.dealDao = dealDao;
		this.filter = filter;
	}

	@Override
	public int getAvailableRows() {
		return dealDao.getInstanceCount(filter);
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		List<SortCriterion> sortCriteria = SortUtil.toSortCriteria(sortConstraints);
		instances = dealDao.getInstances(startIndex, endIndex - startIndex + 1, filter, sortCriteria);
	}

	@Override
	public Object getRowValue(int index) {
		return instances.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return DealInstance.class;
	}
}
