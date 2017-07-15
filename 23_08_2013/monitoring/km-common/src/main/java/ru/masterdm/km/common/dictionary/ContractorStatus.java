package ru.masterdm.km.common.dictionary;

/**
 * Статусы клиента в контексте мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public enum ContractorStatus {
	FKR(1, "ФКР"), ACTIVE(2, "Активно"), EXPARED(3, "Просроченные КМ");
	private final long id;
	private final String name;

	private ContractorStatus(long id, String name) {
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
