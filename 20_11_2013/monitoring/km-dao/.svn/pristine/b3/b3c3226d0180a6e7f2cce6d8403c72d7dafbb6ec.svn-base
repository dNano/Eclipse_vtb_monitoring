package ru.masterdm.km.dao;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.dao.exception.AuthenticationException;

/**
 * DAO интерфейс для контроля доступа пользователей.
 * 
 * @author Shafigullin Ildar
 */
public interface SecurityDao {

	User authenticateUser(String loginId, String password) throws AuthenticationException;

}
