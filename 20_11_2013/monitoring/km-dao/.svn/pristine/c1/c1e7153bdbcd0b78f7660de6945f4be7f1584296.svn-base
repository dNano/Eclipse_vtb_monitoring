/**
 * 
 */
package ru.masterdm.km.util;

import java.util.Calendar;
import java.util.Date;
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
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_DAY.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryDayRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_WEEK.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryWeekRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_MONTH.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryMonthRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_QUARTER.getId().equals(planEvent.getRepeatType().getId())) {
			calcDateForEveryQuarterRepeatType(planEvent, date);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_HALF_YEAR.getId().equals(planEvent.getRepeatType().getId())) {
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
		Long periodDate = planEvent.getPeriodDate();
		if (periodDate != null) {
			goToStartQuarter(date);
			int monthInQuarter = periodDate.intValue();
			date.add(Calendar.MONTH, monthInQuarter);
		} else {
			goToStartQuarter(date);
		}
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null) {
			int dayOfMounth = periodDetails.intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
		} else {
			date.set(Calendar.DAY_OF_MONTH, 1);
		}
		if (System.currentTimeMillis() >= date.getTimeInMillis()) {
			date.add(Calendar.MONTH, 3);
		}
		correctWithHolidays(planEvent, date);
	}

	private static final void goToStartQuarter(Calendar date) {
		int numQuarter = date.get(Calendar.MONTH) / 3;
		while (date.get(Calendar.MONTH) / 3 == numQuarter) {
			date.add(Calendar.MONTH, -1);
		}
	}

	/**
	 * логика для полугодовай периодичности
	 * 
	 * @param planEvent
	 * @param date
	 */
	private static void calcDateForEveryHalfYearRepeatType(KmEventCalendar planEvent, java.util.Calendar date) {
		Long periodDate = planEvent.getPeriodDate();
		if (periodDate != null) {
			goToStartHalfYear(date);
			int monthInHalfYear = periodDate.intValue();
			date.add(Calendar.MONTH, monthInHalfYear);
		} else {
			goToStartHalfYear(date);
		}
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null) {
			int dayOfMounth = periodDetails.intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
		} else {
			date.set(Calendar.DAY_OF_MONTH, 1);
		}
		if (System.currentTimeMillis() >= date.getTimeInMillis()) {
			date.add(Calendar.MONTH, 6);
		}
		correctWithHolidays(planEvent, date);
	}

	private static void goToStartHalfYear(Calendar date) {
		int numHalfYear = date.get(Calendar.MONTH) / 6;
		while (date.get(Calendar.MONTH) / 6 == numHalfYear) {
			date.add(Calendar.MONTH, -1);
		}
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
		setDateFromDaysOfWeek(planEvent, date);
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
	private final static void correctWithHolidays(KmEventCalendar planEvent, java.util.Calendar date) {
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

	public static Calendar createNextCalendarDateFromPlanEvent(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = null;
		if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.ONCE.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForOnceRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_DAY.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForEveryDayRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_WEEK.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForEveryWeekRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_MONTH.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForEveryMonthRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_QUARTER.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForEveryQuarterRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.EVERY_HALF_YEAR.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForEveryHalfYearRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.YEAR.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForYearRepeatType(planEvent, executedDate);
		} else if (planEvent.getRepeatType() != null && EventRepeatTypeDictionary.RANDOM.getId().equals(planEvent.getRepeatType().getId())) {
			date = calcNextDateForRandomRepeatType(planEvent, executedDate);
		}
		return date;
	}

	private static Calendar calcNextDateForOnceRepeatType(KmEventCalendar planEvent, Date executedDate) {
		return null;
	}

	private static Calendar calcNextDateForRandomRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		if (planEvent.getSchedule() != null && !planEvent.getSchedule().isEmpty()) {
			for (Date scheduleDate : planEvent.getSchedule()) {
				if (scheduleDate.getTime() > executedDate.getTime()) {
					date.setTime(scheduleDate);
					break;
				}
			}
		}
		correctWithHolidays(planEvent, date);
		return date;
	}

	private static Calendar calcNextDateForYearRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		date.setTime(executedDate);
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null) {
			int dayOfMounth = periodDetails.intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
		}
		Long periodDate = planEvent.getPeriodDate();
		if (periodDate != null) {
			int mounth = periodDate.intValue() - 1;
			date.set(Calendar.MONTH, mounth);
		}
		date.add(Calendar.YEAR, 1);
		correctWithHolidays(planEvent, date);
		return date;
	}

	private static Calendar calcNextDateForEveryHalfYearRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		date.setTime(executedDate);
		Long periodDate = planEvent.getPeriodDate();
		if (periodDate != null) {
			goToNextHalfYear(date);
			int monthInHalfYear = periodDate.intValue();
			date.add(Calendar.MONTH, monthInHalfYear - 1);
		} else {
			goToNextHalfYear(date);
		}
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null) {
			int dayOfMounth = periodDetails.intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
		} else {
			date.set(Calendar.DAY_OF_MONTH, 1);
		}
		correctWithHolidays(planEvent, date);
		return date;
	}

	private static final void goToNextHalfYear(Calendar date) {
		int numHalfYear = date.get(Calendar.MONTH) / 6;
		while (date.get(Calendar.MONTH) / 6 == numHalfYear) {
			date.add(Calendar.MONTH, 1);
		}
	}

	private static Calendar calcNextDateForEveryQuarterRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		date.setTime(executedDate);
		Long periodDate = planEvent.getPeriodDate();
		if (periodDate != null) {
			goToNextQuarter(date);
			int monthInQuarter = periodDate.intValue();
			date.add(Calendar.MONTH, monthInQuarter - 1);
		} else {
			goToNextQuarter(date);
		}
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null) {
			int dayOfMounth = periodDetails.intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
		} else {
			date.set(Calendar.DAY_OF_MONTH, 1);
		}
		correctWithHolidays(planEvent, date);
		return date;
	}

	private final static void goToNextQuarter(java.util.Calendar date) {
		int numQuarter = date.get(Calendar.MONTH) / 3;
		while (date.get(Calendar.MONTH) / 3 == numQuarter) {
			date.add(Calendar.MONTH, 1);
		}
	}

	private static Calendar calcNextDateForEveryMonthRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		date.setTime(executedDate);
		Long periodDetail = planEvent.getPeriodDetails();
		if (periodDetail != null) {
			int period = periodDetail.intValue();
			date.add(Calendar.MONTH, period);
		} else {
			date.add(Calendar.MONTH, 1);
		}
		Long periodDate = planEvent.getPeriodDate();
		if (periodDate != null) {
			int dayOfMounth = periodDate.intValue();
			date.set(Calendar.DAY_OF_MONTH, dayOfMounth);
		} else {
			date.set(Calendar.DAY_OF_MONTH, 1);
		}
		correctWithHolidays(planEvent, date);
		return date;
	}

	private static Calendar calcNextDateForEveryWeekRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		date.setTime(executedDate);
		int weekNumberForExecutedDate = date.get(Calendar.WEEK_OF_YEAR);
		date.add(Calendar.DAY_OF_MONTH, 1);
		setDateFromDaysOfWeek(planEvent, date);
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null && (date.get(Calendar.WEEK_OF_YEAR) != weekNumberForExecutedDate)) {
			int period = periodDetails.intValue();
			date.add(Calendar.DAY_OF_MONTH, (period - 1) * 7);
		}
		correctWithHolidays(planEvent, date);
		return date;
	}

	private final static void setDateFromDaysOfWeek(KmEventCalendar planEvent, java.util.Calendar date) {
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
	}

	private static Calendar calcNextDateForEveryDayRepeatType(KmEventCalendar planEvent, Date executedDate) {
		java.util.Calendar date = Calendar.getInstance();
		date.setTime(executedDate);
		Long periodDetails = planEvent.getPeriodDetails();
		if (periodDetails != null) {
			int period = periodDetails.intValue();
			date.add(Calendar.DAY_OF_MONTH, period);
		} else {
			date.add(Calendar.DAY_OF_MONTH, 1);
		}
		if (planEvent.isExcludeHoliday()) {
			correctWithHolidays(planEvent, date);
		}
		return date;
	}

}
