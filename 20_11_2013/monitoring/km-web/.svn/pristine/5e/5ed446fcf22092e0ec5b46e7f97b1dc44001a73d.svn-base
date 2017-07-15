package ru.masterdm.km.web.translators;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

import org.apache.tapestry5.Field;
import org.apache.tapestry5.MarkupWriter;
import org.apache.tapestry5.ValidationException;
import org.apache.tapestry5.internal.translator.AbstractTranslator;
import org.apache.tapestry5.services.FormSupport;

/**
 * Преобразование {@link BigDecimal сумм} валют
 *
 * @author akirilchev@masterdm.ru
 */
public class MoneyTranslator extends AbstractTranslator<BigDecimal> {

	private static final String BIGDECIMAL_SAMPLE = "123,456";
	private static final String NONBREAKING_SPACE = " ";
	
	/**
	 * Конструктор
	 */
	public MoneyTranslator() {
		super("moneytranslator", BigDecimal.class, "moneytranslator-format-exception");
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public BigDecimal parseClient(Field field, String newValue, String message) throws ValidationException {
		if (newValue == null || newValue.trim().isEmpty()) {
			return null;
		}
		try {
			String normalizedValue = newValue.replaceAll(" ", "");
			normalizedValue = normalizedValue.replaceAll(NONBREAKING_SPACE, "");
			normalizedValue = normalizedValue.replaceAll("\t", "");
			normalizedValue = normalizedValue.replaceAll(",", ".");

			BigDecimal returnValue = new BigDecimal(normalizedValue);
			return returnValue;
		} catch (NumberFormatException nfe) {
			String errMessage = new StringBuilder().append(field.getLabel() + ": Неправильный формат. Пример: ").append(BIGDECIMAL_SAMPLE).toString();
			throw new ValidationException(errMessage); 
		} catch (Exception e) {
			throw new ValidationException(e.getMessage());
		}
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public String toClient(BigDecimal value) {
		if (value == null) {
			return "";
		}

		try {
			String formattedValue;
			Locale ruLocal = new Locale("ru", "RU");
			NumberFormat numberFormatter = NumberFormat.getNumberInstance(ruLocal);
			numberFormatter.setMaximumFractionDigits(3);
			numberFormatter.setMinimumFractionDigits(0);
//			if (component instanceof UIInput)
			numberFormatter.setGroupingUsed(false);
			formattedValue = numberFormatter.format(value);
			return formattedValue;
		} catch (Exception e) {
			String errMessage = new StringBuilder().append("Неправильный формат. Пример: ").append(BIGDECIMAL_SAMPLE).toString();
			throw new RuntimeException(errMessage); 
		}
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
