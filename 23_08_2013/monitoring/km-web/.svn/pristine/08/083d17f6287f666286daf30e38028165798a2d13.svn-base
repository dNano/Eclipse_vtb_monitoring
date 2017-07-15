package ru.masterdm.km.web.model.fkr;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.dao.DealDao;

/**
 * ФКР для сделки DataSource.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class FkrsForDealDataSource implements GridDataSource {
	private int startIndex;
	private long dealID;
	private List<KmFkr> instances;
	private DealDao dealDao;

	public FkrsForDealDataSource(long dealID, DealDao dealDao) {
		super();
		this.dealID = dealID;
		this.dealDao = dealDao;
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		instances = dealDao.getDealFkr(startIndex, endIndex - startIndex + 1, dealID);
	}

	@Override
	public Object getRowValue(int index) {
		return instances.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return KmFkr.class;
	}

	@Override
	public int getAvailableRows() {
		return dealDao.getDealFkrCount(dealID);
	}
}
