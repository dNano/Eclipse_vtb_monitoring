package ru.masterdm.km.common.dictionary;

/**
 * Месяц года для типа периодичности.
 * 
 * @author Shafigullin Ildar
 * 
 */
public enum MonthDictionary {
	JANUARY(1, "январь"), FEBRUARY(2, "февраль"), MARCH(3, "март"), APRIL(4, "апрель"), MAY(5, "май"), JUNE(6, "июнь"), JULY(7, "июль"), AUGUST(
			8, "август"), SEPTEMBER(9, "сентябрь"), OCTOBER(10, "октябрь"), NOVEMBER(11, "ноябрь"), DECEMBER(12, "декабрь");

	private final long id;
	private final String name;

	private MonthDictionary(long id, String name) {
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
