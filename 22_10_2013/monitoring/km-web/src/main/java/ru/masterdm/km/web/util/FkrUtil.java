package ru.masterdm.km.web.util;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.apache.tapestry5.upload.services.UploadedFile;

import ru.masterdm.km.common.entity.AppFile;
import ru.masterdm.km.common.entity.KmFkrInstance;

/**
 * Util Для работы с ФКР.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class FkrUtil {

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

}
