package ru.masterdm.km.web.model;

import java.util.List;

import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.dao.DictionaryDao;

/**
 * Список пользователей DataSource.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class UsersDataSource implements GridDataSource {
	private int startIndex;
	private String namePattern;
	private List<User> users;
	private DictionaryDao dictionaryDao;

	public UsersDataSource(String namePattern, DictionaryDao dictionaryDao) {
		super();
		this.namePattern = namePattern;
		this.dictionaryDao = dictionaryDao;
	}

	@Override
	public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
		this.startIndex = startIndex;
		users = dictionaryDao.getUsers(startIndex, endIndex - startIndex + 1, namePattern);
	}

	@Override
	public Object getRowValue(int index) {
		return users.get(index - startIndex);
	}

	@Override
	public Class<?> getRowType() {
		return User.class;
	}

	@Override
	public int getAvailableRows() {
		return dictionaryDao.getUserCount(namePattern);
	}

}
