package ru.masterdm.km.web.util;

import java.text.DateFormat;
import java.text.DecimalFormat;

import ru.masterdm.km.common.entity.Deal;
import ru.masterdm.km.common.entity.DealInstance;

/**
 * Util Для режимов "Планирование контрольных мероприятий"
 * 
 * @author Shafigullin Ildar
 * 
 */
public class BuildingEventUtil {
	private static final int MSEC_IN_DAY = 24 * 60 * 60 * 1000;

	/**
	 * Инфо о сделке.
	 * 
	 * @param deal
	 * @param decimalFormat
	 * @param dateFormat
	 * @return
	 */
	public final static String getDealInfo(Deal deal, DateFormat dateFormat, DecimalFormat decimalFormat) {
		String info = "";
		if (deal != null) {
			info += "Сделка № " + deal.getSpkpNumber();
			if (deal.getValidTo() != null) {
				info += ", дата окончания " + dateFormat.format(deal.getValidTo());
				long days = (deal.getValidTo().getTime() - System.currentTimeMillis()) / MSEC_IN_DAY;
				if (days > 0) {
					info += "(осталось " + days + " дн.)";
				} else {
					info += "(истек " + (-days) + " дн. назад)";
				}
				info += ", соглашение № " + deal.getSpkpNumber() + " от " + dateFormat.format(deal.getValidTo());
			}
			if (deal.getType() != null && deal.getType().getName() != null) {
				info += ", " + deal.getType().getName() + " на сумму ";
			}
			info += decimalFormat.format(deal.getAmount()) + " " + deal.getCurrency().getId();
		}
		return info;
	}

	/**
	 * Инфо о сделке и клиенте.
	 * 
	 * @param dealInst
	 * @param dateFormat
	 * @param amountFormat
	 * @return
	 */
	public final static String getDealInfo(DealInstance dealInst, DateFormat dateFormat, DecimalFormat amountFormat) {
		String info = getDealInfo(dealInst.getDeal(), dateFormat, amountFormat);
		if (dealInst.getContractor() != null) {
			info += ", " + dealInst.getContractor().getName();
		}
		return info;
	}

	/**
	 * Инфо о договоре/соглашении.
	 * 
	 * @param dealInst
	 * @param dateFormat
	 * @return
	 */
	public final static String getDocumentInfo(DealInstance dealInst, DateFormat dateFormat) {
		String info = "";
		Deal deal = dealInst.getDeal();
		if (deal != null && deal.getSpkpNumber() != null) {
			info += "№ " + deal.getSpkpNumber();
		}
		if (dealInst.getDate() != null) {
			info += " от " + dateFormat.format(dealInst.getDate());
		}
		return info;
	}
}
