package ru.masterdm.km.web.translators;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import org.apache.tapestry5.Field;
import org.apache.tapestry5.MarkupWriter;
import org.apache.tapestry5.ValidationException;
import org.apache.tapestry5.internal.translator.AbstractTranslator;
import org.apache.tapestry5.services.FormSupport;

/**
 * Преобразование {@link Date дат}
 *
 * @author akirilchev@masterdm.ru
 */
public class DateTranslator extends AbstractTranslator<Date> {

	private static final String TIME_ZONE_NAME = "Europe/Moscow";
	private static final Locale LOCALE = new Locale("ru", "RU");

	/**
	 * Формат даты
	 */
	public static final String DATE_FORMAT = "dd.MM.yyyy";

	/**
	 * Конструктор
	 */
	public DateTranslator() {
		super("datetranslator", Date.class, "datetranslator-format-exception");
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public Date parseClient(Field field, String value, String message) throws ValidationException {
		Date returnValue = null;
		if (value == null || value.trim().isEmpty())
			return null;
		DateFormat formatter = new SimpleDateFormat(DATE_FORMAT, LOCALE);
		TimeZone timeZone = TimeZone.getTimeZone(TIME_ZONE_NAME);
		formatter.setTimeZone(timeZone);
		try {
			returnValue = formatter.parse(value);
		} catch (ParseException e) {
			throw new ValidationException("Неправильный формат даты (ДД.ММ.ГГГГ)");
		}
		return returnValue;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public String toClient(Date value) {
		if (value == null) {
			return null;
		}
		DateFormat formatter = new SimpleDateFormat(DATE_FORMAT, LOCALE);
		formatter.setLenient(false);
		TimeZone timeZone = TimeZone.getTimeZone(TIME_ZONE_NAME);
		formatter.setTimeZone(timeZone);
		System.out.println(formatter.format(value));
		return formatter.format(value);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void render(Field field, String message, MarkupWriter writer, FormSupport formSupport) {
		// Do nothing; we don't yet support client-side validation.
		// formSupport.addValidation(field, "yesno", message, null);
	}

}
