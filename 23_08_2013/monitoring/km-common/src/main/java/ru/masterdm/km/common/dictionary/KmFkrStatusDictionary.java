package ru.masterdm.km.common.dictionary;

/**
 * Статус ФКР dictionary.
 * 
 * @author Shafigullin Ildar
 * 
 */
public enum KmFkrStatusDictionary {
	IDENTIFY(1, "выявлен"), IDENTIFY_WRONG(2, "выявлен ошибочно"), SIGNIFICANT(3, "признан существенным"),
		NOT_SIGNIFICANT(4, "признан несущественным"), ADJUSTED(5, "урегулирован");
	private final long id;
	private final String name;

	private KmFkrStatusDictionary(long id, String name) {
		this.id = id;
		this.name = name;
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}
}
