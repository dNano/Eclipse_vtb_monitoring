package ru.masterdm.km.common.dictionary;

/**
 * Статус мероприятия(KM) dictionary.
 * 
 * @author Shafigullin Ildar
 * 
 */
public enum KmEventStatusDictionary {
	WAIT_PROCESSING(1, "Ожидает обработки"), IN_JOB(2, "В работе"), EXECUTED(3, "Исполнено"), REVOKED(4, "Отменено"), SUSPEND(5, "Приостановлено");
	private final long id;
	private final String name;

	private KmEventStatusDictionary(long id, String name) {
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
