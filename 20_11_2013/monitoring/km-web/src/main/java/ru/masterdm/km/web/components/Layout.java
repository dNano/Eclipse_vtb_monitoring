package ru.masterdm.km.web.components;

import org.apache.tapestry5.BindingConstants;
import org.apache.tapestry5.annotations.Parameter;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.annotations.SessionState;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.Request;
import org.apache.tapestry5.services.Session;
import org.slf4j.Logger;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.common.entity.UserRole;
import ru.masterdm.km.web.pages.Login;
import ru.masterdm.km.web.state.Visit;

/**
 * Layout component class.
 * 
 * @author Alexey Chalov
 */
public class Layout {

	@Inject
	private Logger logger;
	@Inject
	private Request request;

	@SessionState
	private Visit visit;

	@Property
	@Parameter(required = true, defaultPrefix = BindingConstants.LITERAL)
	private String title;
	
	@Property
	private UserRole userRole;

	Object onLogout() {
		logger.info(visit.getMyLoginId() + " is logging out.");
		Session session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return Login.class;
	}
	
	public User getUser(){
		return visit.getUser();
	}

}
