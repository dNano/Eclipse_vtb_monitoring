package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class UserRm extends BaseRm<User> {

	public UserRm() {
		super("U_");
	}

	@Override
	protected User map(ResultSetWrapper rsw) throws SQLException {
		User u = new User();
		u.setId(rsw.getLong(getAliasPrefix() + "ID"));
		u.setFirstName(rsw.getString(getAliasPrefix() + "FIRST_NAME"));
		u.setLastName(rsw.getString(getAliasPrefix() + "LAST_NAME"));
		u.setPatronymic(rsw.getString(getAliasPrefix() + "PATRONYMIC"));
		u.setLogin(rsw.getString(getAliasPrefix() + "LOGIN"));
		u.setEmail(rsw.getString(getAliasPrefix() + "EMAIL"));
		u.setDepartment(new DepartmentRm().map(rsw));
		return u;
	}
}
