package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.Department;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for "Подразделение пользователей".
 * 
 * @author Shafigullin Ildar
 */
public class DepartmentRm extends BaseRm<Department> {

	public DepartmentRm() {
		super("DEP_");
	}

	@Override
	protected Department map(ResultSetWrapper rsw) throws SQLException {
		Department instanse = new Department();
		instanse.setId(rsw.getLong(getAliasPrefix() + "ID"));
		instanse.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return instanse;
	}

}
