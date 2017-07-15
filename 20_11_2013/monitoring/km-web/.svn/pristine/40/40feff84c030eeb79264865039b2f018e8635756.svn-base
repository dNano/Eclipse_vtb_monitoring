package ru.masterdm.km.web.model;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.dao.DictionaryDao;

/**
 * Список групп клиентов DataSource.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ContractorGroupsDataSource implements GridDataSource {
	private int startIndex;
	private List<ContractorGroup> contractorGroups;
	private String namePattern;
	private DictionaryDao dictionaryDao;

	public ContractorGroupsDataSource(String namePattern, DictionaryDao dictionaryDao) {
		super();
		this.namePattern = namePattern;
		this.dictionaryDao = dictionaryDao;
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		contractorGroups = dictionaryDao.getContractorGroups(startIndex, endIndex - startIndex + 1, namePattern);
	}

	@Override
	public Object getRowValue(int index) {
		return contractorGroups.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return ContractorGroup.class;
	}

	@Override
	public int getAvailableRows() {
		return dictionaryDao.getContractorGroupCount(namePattern);
	}

}
