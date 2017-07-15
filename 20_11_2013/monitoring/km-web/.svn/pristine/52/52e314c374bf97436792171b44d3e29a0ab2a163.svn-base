package ru.masterdm.km.web.state;

import java.io.Serializable;

import ru.masterdm.km.common.entity.User;

/**
 * Информация о пользовательских настройках и пр.
 * 
 */
@SuppressWarnings("serial")
public class Visit implements Serializable {

	private Long myUserId = null;
	private String myLoginId = null;
	// private PageStyle pageStyle = null;
	private String dateInputPattern = null;
	private String dateViewPattern = null;
	private String dateListPattern = null;
	private String amountListPattern = null;
	private String amountViewPattern = null;
	private User user;

	public Visit(User user) {
		myUserId = user.getId();
		cacheUsefulStuff(user);
	}

	public void noteChanges(User user) {
		if (user == null) {
			throw new IllegalArgumentException();
		}
		// else if (user.getId().equals(myUserId)) {
		cacheUsefulStuff(user);
		// }
	}

	private void cacheUsefulStuff(User user) {
		myLoginId = user.getLogin();
		// pageStyle = user.getPageStyle();
		dateInputPattern = user.getDateInputPattern();
		dateViewPattern = user.getDateViewPattern();
		dateListPattern = user.getDateListPattern();
		amountListPattern = user.getAmountListPattern();
		amountViewPattern = user.getAmountViewPattern();
		this.user = user;
	}

	public Long getMyUserId() {
		return myUserId;
	}

	public String getMyLoginId() {
		return myLoginId;
	}

	// public PageStyle getPageStyle() {
	// return pageStyle;
	// }

	public String getDateInputPattern() {
		return dateInputPattern;
	}

	public String getDateViewPattern() {
		return dateViewPattern;
	}

	public String getDateListPattern() {
		return dateListPattern;
	}

	public String getAmountListPattern() {
		return amountListPattern;
	}

	public void setAmountListPattern(String amountListPattern) {
		this.amountListPattern = amountListPattern;
	}

	public String getAmountViewPattern() {
		return amountViewPattern;
	}

	public void setAmountViewPattern(String amountViewPattern) {
		this.amountViewPattern = amountViewPattern;
	}

	public User getUser() {
		return user;
	}

}
