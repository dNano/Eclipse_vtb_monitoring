package ru.masterdm.km.common.entity;

import ru.masterdm.km.common.util.DataTypeUtil;

/**
 * 
 * @author Alexey Chalov
 */
@SuppressWarnings("serial")
public class User extends BaseIndexedEntity<Long> {
	static public final String[] DATE_PATTERNS = { "dd.MM.yyyy", "yyyy-MM-dd", "dd MMM yy", "dd MMM yyyy", "dd MMMM yyyy", "dd/MM/yy", "dd/MM/yyyy",
			"MMM dd yy", "MMM dd yyyy", "MM/dd/yy", "MM/dd/yyyy" };
	static public final String[] AMOUNT_PATTERNS = { ",##0.00", ",000", ",000.000", ",000.0##", ",000.00#", ",000.###", ",#00.###", ",##0.###" };

	static public final String defaultDateInputPattern = "dd.MM.yyyy";
	static public final String defaultDateViewPattern = "dd MMM yyyy";
	static public final String defaultDateListPattern = "dd.MM.yyyy";
	static public final String defaultAmountListPattern = ",##0.###";
	static public final String defaultAmountViewPattern = ",##0.00";

	protected String dateInputPattern = defaultDateInputPattern;
	protected String dateViewPattern = defaultDateViewPattern;
	protected String dateListPattern = defaultDateListPattern;
	protected String amountListPattern = defaultAmountListPattern;
	protected String amountViewPattern = defaultAmountViewPattern;

	private String login;
	private String firstName;
	private String lastName;
	private String patronymic;
	private String email;

	public String getDateInputPattern() {
		return dateInputPattern;
	}

	public void setDateInputPattern(String pattern) {
		this.dateInputPattern = pattern;
	}

	public String getDateViewPattern() {
		return dateViewPattern;
	}

	public void setDateViewPattern(String pattern) {
		this.dateViewPattern = pattern;
	}

	public String getDateListPattern() {
		return dateListPattern;
	}

	public void setDateListPattern(String pattern) {
		this.dateListPattern = pattern;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPatronymic() {
		return patronymic;
	}

	public void setPatronymic(String patronymic) {
		this.patronymic = patronymic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		StringBuilder sb = new StringBuilder();
		if (!DataTypeUtil.isEmpty(lastName)) {
			sb.append(lastName.trim());
		}
		if (!DataTypeUtil.isEmpty(firstName)) {
			if (sb.length() > 0) {
				sb.append(" ");
			}
			sb.append(firstName.trim());
		}
		if (!DataTypeUtil.isEmpty(patronymic)) {
			if (sb.length() > 0) {
				sb.append(" ");
			}
			sb.append(patronymic.trim());
		}
		return sb.toString();
	}

	public String getShortFullName() {
		StringBuilder sb = new StringBuilder();
		if (!DataTypeUtil.isEmpty(lastName)) {
			sb.append(lastName.trim());
		}
		if (!DataTypeUtil.isEmpty(firstName)) {
			if (sb.length() > 0) {
				sb.append(" ");
			}
			sb.append(firstName.trim().substring(0, 1)).append(".");
		}
		if (!DataTypeUtil.isEmpty(patronymic)) {
			if (sb.length() > 0) {
				sb.append(" ");
			}
			sb.append(patronymic.trim().substring(0, 1)).append(".");
		}
		return sb.toString();
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
}
