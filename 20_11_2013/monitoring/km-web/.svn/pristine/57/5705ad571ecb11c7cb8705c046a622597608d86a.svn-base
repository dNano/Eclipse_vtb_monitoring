package ru.masterdm.km.web.model.fkr;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.common.searchfilter.FkrFilter;
import ru.masterdm.km.dao.FkrDao;
import ru.masterdm.km.util.query.SortCriterion;
import ru.masterdm.km.web.util.SortUtil;

/**
 * DataSource для "Список выявленных ФКР".
 * 
 * @author Shafigullin Ildar
 * 
 */
public class FkrInstancesDataSource implements GridDataSource {
	private int startIndex;
	private List<KmFkrInstance> instances;
	private FkrDao fkrDao;
	private FkrFilter filter;

	public FkrInstancesDataSource(FkrDao fkrDao, FkrFilter filter) {
		super();
		this.fkrDao = fkrDao;
		this.filter = filter;
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		List<SortCriterion> sortCriteria = SortUtil.toSortCriteria(sortConstraints);
		instances = fkrDao.getInstances(startIndex, endIndex - startIndex + 1, filter, sortCriteria);
	}

	@Override
	public Object getRowValue(int index) {
		return instances.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return KmFkrInstance.class;
	}

	@Override
	public int getAvailableRows() {
		return fkrDao.getInstanceCount(filter);
	}
}
