package ru.masterdm.km.common.dictionary;

/**
 * Информация о типе собственника в документе.
 * 
 * @author Shafigullin Ildar
 * 
 */
public enum OwnerType {
	DEAL(0L, "Сделка");
	private final long id;
	private final String name;

	private OwnerType(long id, String name) {
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
