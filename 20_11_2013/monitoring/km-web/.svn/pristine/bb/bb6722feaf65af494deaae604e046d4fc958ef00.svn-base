package ru.masterdm.km.web.util;

import java.util.List;

import ru.masterdm.km.common.entity.ContractorType;

/**
 * Util для отчетов.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ReportUtil {
	/**
	 * Generates combined number to show in the reports (crmCode if present and mdTask number).
	 * 
	 * @param crmcode
	 * 
	 * @param number
	 * 
	 */
	public static final String generateCombinedNumber(String crmCode, String number) {
		if (number == null)
			return null;
		if ((crmCode != null) && (!crmCode.equals("")) && !(number.equals(crmCode)))
			return crmCode + " (" + number + ")";
		else
			return number;
	}

	/**
	 * отформатированный список типов для клиентов сделки
	 * 
	 * @param types
	 * @return
	 */
	public static final String getFormattedTypesForDealClient(List<ContractorType> types) {
		if (types == null)
			return null;
		StringBuilder typesMessage = new StringBuilder();
		for (ContractorType type : types)
			typesMessage.append(type.getName()).append(", ");
		if (typesMessage.length() > 1)
			typesMessage.delete(typesMessage.length() - 2, typesMessage.length());
		return typesMessage.toString();
	}
}
