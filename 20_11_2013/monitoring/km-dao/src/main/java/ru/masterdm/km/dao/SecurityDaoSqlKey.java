package ru.masterdm.km.dao;

import ru.masterdm.km.util.Enumerable;

/**
 * Ключи для SQL для контроля доступа пользователей.
 * 
 * @author Shafigullin Ildar
 */
public enum SecurityDaoSqlKey implements Enumerable {

	USER_BY_LOGIN, ROLES_FOR_USER;

	@Override
	public int getElementCount() {
		return SecurityDaoSqlKey.values().length;
	}
}
