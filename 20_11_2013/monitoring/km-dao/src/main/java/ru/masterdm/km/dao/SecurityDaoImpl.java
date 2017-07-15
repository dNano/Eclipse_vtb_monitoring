package ru.masterdm.km.dao;

import static ru.masterdm.km.dao.SecurityDaoSqlKey.USER_BY_LOGIN;

import java.util.List;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.common.entity.UserRole;
import ru.masterdm.km.dao.exception.AuthenticationException;
import ru.masterdm.km.dao.exception.DoesNotExistException;
import ru.masterdm.km.dao.mapper.UserRm;
import ru.masterdm.km.dao.mapper.UserRoleRm;
import ru.masterdm.km.util.BaseJdbcDao;

/**
 * Реализация DAO интерфейса для контроля доступа пользователей.
 * 
 * @author Shafigullin Ildar
 */
public class SecurityDaoImpl extends BaseJdbcDao<SecurityDaoSqlKey> implements SecurityDao {

	@Override
	public User authenticateUser(String loginId, String password) throws AuthenticationException {
		try {
			User user;
			user = findUserByLoginId(loginId);
			// user.authenticate(password);
			List<UserRole> userRoles = findUserRoles(loginId);
			user.setUserRoles(userRoles);
			return user;
		} catch (DoesNotExistException e) {
			throw new AuthenticationException("User_login_unknown", loginId);
		}
	}

	private List<UserRole> findUserRoles(String loginId) {
		String query = sql.getValue(SecurityDaoSqlKey.ROLES_FOR_USER);
		List<UserRole> listUserRoles = queryForList(query, new UserRoleRm(), "Error findUserRoles.", loginId);
		return listUserRoles;
	}

	private User findUserByLoginId(String loginId) throws DoesNotExistException {
		User user = queryForObject(sql.getValue(USER_BY_LOGIN), new UserRm(), "Error selecting user.", loginId);
		if (user == null) {
			throw new DoesNotExistException(User.class, loginId);
		}
		return user;
	}

}
