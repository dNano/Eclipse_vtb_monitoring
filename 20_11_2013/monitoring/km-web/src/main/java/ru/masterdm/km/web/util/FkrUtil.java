package ru.masterdm.km.web.util;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.apache.tapestry5.upload.services.UploadedFile;

import ru.masterdm.km.common.entity.AppFile;
import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.Deal;
import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.common.entity.OfficialInfo;

/**
 * Util Для работы с ФКР.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class FkrUtil {
	private static final int MSEC_IN_DAY = 24 * 60 * 60 * 1000;

	public final static void initDocFile(KmFkrInstance fkr, UploadedFile docFile) {
		AppFile doc = new AppFile();
		// DocumentType docType = fkr.getDocumentType();
		// if (docType != null) {
		// doc.setType(docType.getName());
		// }
		doc.setId(UUID.randomUUID().toString() + docFile.getFileName());
		doc.setName(docFile.getFileName());

		doc.setMimeType(docFile.getContentType());
		doc.setDateOfAdd(new Date());
		// doc.setDocType(docType);
		// doc.setDocGroup(fkr.getDocumentGroup());
		// doc.setOwnerType(OwnerType.DEAL.getId());
		// if (fkr.getFkr().getDeal().getPupProcessID() != null) {
		// doc.setOwnerID(fkr.getFkr().getDeal().getPupProcessID().toString());
		// }

		// User currentUser = delegate.getCurrentUser();TODO выполнить после добавления инфо о текущем пользователе.
		// doc.setWhoAdd(currentUser);

		try {
			byte[] data = IOUtils.toByteArray(docFile.getStream());
			doc.setData(data);
			fkr.setDocFile(doc);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Инфо о договоре/соглашении.
	 * 
	 * @param deal
	 * @param dateFormat
	 * @param amountFormat
	 * @return
	 */
	public final static String getOfficialInfo(KmFkrInstance fkrInst, DateFormat dateFormat, DecimalFormat amountFormat) {
		String info = "";
		OfficialInfo officialInfo = fkrInst.getInfo();
		if (officialInfo != null) {
			if (officialInfo.getOfficialNumber() != null) {
				info += "№ " + officialInfo.getOfficialNumber();
			}
			if (officialInfo.getOfficialDate() != null) {
				info += " от " + dateFormat.format(officialInfo.getOfficialDate());
			}
		}
		return info;
	}

	/**
	 * Инфо о клиенте.
	 * 
	 * @param pref
	 * @param client
	 * @return
	 */
	public final static String getClientInfo(String pref, Contractor client) {
		String info = "";
		if (client != null) {
			info += pref + client.getName();
			if (client.getInn() != null) {
				info += " ИНН: " + client.getInn();
			}
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
	public final static String getDealInfo(KmFkrInstance fkr, DateFormat dateFormat, DecimalFormat amountFormat) {
		String info = "";
		Deal deal = fkr.getFkr().getDeal();
		if (deal != null) {
			info += "Сделка ";
			if (deal.getSpkpNumber() != null) {
				info += " № " + deal.getSpkpNumber() + ", ";
			}
			if (deal.getValidTo() != null) {
				info += "действует до " + dateFormat.format(deal.getValidTo());
				long days = (deal.getValidTo().getTime() - System.currentTimeMillis()) / MSEC_IN_DAY;
				if (days > 0) {
					info += ", осталось " + days + " дней. ";
				} else {
					info += ", срок истек " + (-days) + " дней назад. ";
				}
				// info += "Соглашение № " + deal.getSpkpNumber() + " от " + dateFormat.format(deal.getValidTo()) + ", ";
				info += "Соглашение " + getOfficialInfo(fkr, dateFormat, null) + ", ";
			}
			if (deal.getType() != null && deal.getType().getName() != null) {
				info += deal.getType().getName();
			}
			info += " на сумму " + amountFormat.format(deal.getAmount()) + " " + deal.getCurrency().getId();
		}
		return info;
	}

}
