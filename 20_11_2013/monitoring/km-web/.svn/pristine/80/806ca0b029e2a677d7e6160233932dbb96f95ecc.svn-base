package ru.masterdm.km.web.model.services.util;

import java.io.InputStream;

import ru.masterdm.km.web.model.services.AttachmentStreamResponse;

public class PDFAttachment extends AttachmentStreamResponse {
	public PDFAttachment(InputStream is, String args) {
		super(is, args);
		this.contentType = "application/pdf";
		this.extension = "pdf";
	}

	public PDFAttachment(InputStream is) {
		super(is);
		this.contentType = "application/pdf";
		this.extension = "pdf";
	}
}
