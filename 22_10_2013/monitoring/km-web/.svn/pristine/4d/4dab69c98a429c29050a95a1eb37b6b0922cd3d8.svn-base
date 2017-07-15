package ru.masterdm.km.web.model;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.dao.DictionaryDao;

/**
 * Список клиентов DataSource.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ContractorsDataSource implements GridDataSource {
	private int startIndex;
	private String contractorNamePattern;
	private List<Contractor> contractors;
	private DictionaryDao dictionaryDao;

	public ContractorsDataSource(String contractorNamePattern, DictionaryDao dictionaryDao) {
		super();
		this.contractorNamePattern = contractorNamePattern;
		this.dictionaryDao = dictionaryDao;
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		contractors = dictionaryDao.getContractors(startIndex, endIndex - startIndex + 1, contractorNamePattern);
	}

	@Override
	public Object getRowValue(int index) {
		return contractors.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return Contractor.class;
	}

	@Override
	public int getAvailableRows() {
		return dictionaryDao.getContractorCount(contractorNamePattern);
	}
}
