package ru.masterdm.km.web.services.fkr;

/**
 * Сервисы для мониторинга мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public interface FkrService {

	void doJob();

	/**
	 * <!-- sec(0 - 59) min(0 - 59) hour(0 - 23) dayOfMonth(1 - 31) month(1-12 or JAN-DEC) dayOfWeek(0 - 6)(0 is Sunday, or use names) -->
	 * 
	 * <!-- *(every) -(range) /(period) ?(don't known: dayOfMonth or dayOfWeek) -->
	 * 
	 * <!-- 23:00:00 every weekday night (0 0 23 ? * MON-FRI) -->
	 * 
	 * @return Выражение cron
	 */
	String getCronExpr();
}
