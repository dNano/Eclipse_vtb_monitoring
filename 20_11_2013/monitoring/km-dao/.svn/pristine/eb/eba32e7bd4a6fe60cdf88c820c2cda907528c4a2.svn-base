package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.UserRole;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * Map for "Роли пользователей".
 * 
 * @author Shafigullin Ildar
 */
public class UserRoleRm extends BaseRm<UserRole> {

	public UserRoleRm() {
		super("CPS_R_");
	}

	@Override
	protected UserRole map(ResultSetWrapper rsw) throws SQLException {
		UserRole instance = new UserRole();
		instance.setId(rsw.getString(getAliasPrefix() + "ID"));
		instance.setName(rsw.getString(getAliasPrefix() + "NAME"));
		return instance;
	}

}
