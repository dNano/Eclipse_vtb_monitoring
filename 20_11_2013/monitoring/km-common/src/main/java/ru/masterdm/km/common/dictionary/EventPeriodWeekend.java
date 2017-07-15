package ru.masterdm.km.common.dictionary;

/**
 * Учет выходных.
 * 
 * @author Shafigullin Ildar
 * 
 */
public enum EventPeriodWeekend {
	BEFORE(1L), AFTER(0L), SHARP(2L);
	private final long id;

	private EventPeriodWeekend(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}
}
