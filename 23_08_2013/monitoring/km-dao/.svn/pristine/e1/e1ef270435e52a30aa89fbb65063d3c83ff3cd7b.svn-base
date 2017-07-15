/**
 * 
 */
package ru.masterdm.km.util;

import java.util.Calendar;
import java.util.List;

import ru.masterdm.km.common.dictionary.EventPeriodWeekend;
import ru.masterdm.km.common.dictionary.EventRepeatTypeDictionary;
import ru.masterdm.km.common.entity.DayOfWeek;
import ru.masterdm.km.common.entity.KmEventCalendar;

/**
 * Логика акцептования плановых мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class AcceptKmEventProcessor {

	/**
	 * формируем дату для календарного мероприятия в зависимости от типа мероприятия.
	 * 
	 * @param planEvent
	 * @return
	 */
	public static java.util.Calendar createCalendarDateFromPlanEvent(KmEventCalendar planEvent) {
		java.util.Calendar date = Calendar.getInstance();
		if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.ONCE.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForOnceRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null
				&& EventRepeatTypeDictionary.EVERY_DAY.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryDayRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null
				&& EventRepeatTypeDictionary.EVERY_WEEK.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryWeekRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null
				&& EventRepeatTypeDictionary.EVERY_MONTH.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryMonthRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null
				&& EventRepeatTypeDictionary.EVERY_QUARTER.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryQuarterRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null
				&& EventRepeatTypeDictionary.EVERY_HALF_YEAR.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryHalfYearRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.YEAR.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForYearRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.RANDOM.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForRandomRepeatType(planEvent, date);
		}
		return date;
	}

	/**
	 * логика для годовой периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForYearRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.getPeriodDetails() != null && planEvent.getPeriodDate() != null) {
			int mounth = planEvent.getPeriodDate().intValue() - 1;
			int dayOfMounth = planEvent.getPeriodDetails().intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
			date.set(Calendar.MONTH, mounth);
			if (System.currentTimeMillis() >= date.getTimeInMillis()) {
				date.add(Calendar.YEAR, 1);
			}
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * логика для ежеквартальной периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForEveryQuarterRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.getPeriodDetails() != null) {
			int dayOfMounth = planEvent.getPeriodDetails().intValue();
			if (dayOfMounth >= date.get(Calendar.DAY_OF_MONTH)) {
				date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
			} else {
				date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
				date.add(Calendar.MONTH, 1);
			}
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * логика для полугодовай периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForEveryHalfYearRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.getPeriodDetails() != null) {
			int dayOfMounth = planEvent.getPeriodDetails().intValue();
			if (dayOfMounth >= date.get(Calendar.DAY_OF_MONTH)) {
				date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
			} else {
				date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
				date.add(Calendar.MONTH, 1);
			}
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * логика для ежемесячной периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForEveryMonthRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.getPeriodDate() != null) {
			int dayOfMounth = planEvent.getPeriodDate().intValue();
			if (dayOfMounth >= date.get(Calendar.DAY_OF_MONTH)) {
				date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
			} else {
				date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
				date.add(Calendar.MONTH, 1);
			}
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * логика для еженедельной периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForEveryWeekRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		List<DayOfWeek> daysOfWeek = planEvent.getDaysOfWeek();
		if (daysOfWeek != null && !daysOfWeek.isEmpty()) {
			M1: while (true) {
				for (DayOfWeek day : daysOfWeek) {
					int id = day.getId().intValue() + 1;
					if (id == 8) {
						id = 1;
					}
					if (id == date.get(java.util.Calendar.DAY_OF_WEEK)) {
						break M1;
					}
				}
				date.add(java.util.Calendar.DAY_OF_MONTH, 1);
			}
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * логика для ежедневной периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForEveryDayRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.isExcludeHoliday()) {
			correctWithHolidays(planEvent, date);
		}
	}

	/**
	 * логика для однократной периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForOnceRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.getStartDate() != null) {
			date.setTime(planEvent.getStartDate());
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * логика для набора дат
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForRandomRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		if (planEvent.getSchedule() != null && !planEvent.getSchedule().isEmpty()) {
			date.setTime(planEvent.getSchedule().get(0));
		} else if (planEvent.getStartDate() != null) {
			date.setTime(planEvent.getStartDate());
		}
		correctWithHolidays(planEvent, date);
	}

	/**
	 * корректируем дату с учетом выходных.
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void correctWithHolidays(KmEventCalendar planEvent, java.util.Calendar date) {
		int dayOfWeek = date.get(Calendar.DAY_OF_WEEK);
		boolean isHoliday = (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY);
		if (isHoliday) {
			if (planEvent.getPeriodWeekend() != null) {
				if (EventPeriodWeekend.BEFORE.getId() == planEvent.getPeriodWeekend()) {
					if (dayOfWeek == Calendar.SATURDAY) {
						date.add(Calendar.DAY_OF_MONTH, -1);
					} else if (dayOfWeek == Calendar.SUNDAY) {
						date.add(Calendar.DAY_OF_MONTH, -2);
					}
				} else if (EventPeriodWeekend.AFTER.getId() == planEvent.getPeriodWeekend()) {
					if (dayOfWeek == Calendar.SATURDAY) {
						date.add(Calendar.DAY_OF_MONTH, 2);
					} else if (dayOfWeek == Calendar.SUNDAY) {
						date.add(Calendar.DAY_OF_MONTH, 1);
					}
				}
			}
		}
	}

}
