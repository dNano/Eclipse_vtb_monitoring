package ru.masterdm.km.web.model.services;

import java.io.IOException;
import java.io.InputStream;

import org.apache.tapestry5.StreamResponse;
import org.apache.tapestry5.services.Response;

/**
 * For files you intend to display inline in the browser (No "Save As" dialog box):
 * 
 */
public class InlineStreamResponse implements StreamResponse {
	private InputStream is = null;

	protected String contentType = "text/plain";// this is the default

	protected String extension = "txt";

	protected String filename = "default";

	public InlineStreamResponse(InputStream is, String... args) {
		this.is = is;
		if (args != null) {
			this.filename = args[0];
		}
	}

	public String getContentType() {
		return contentType;
	}

	public InputStream getStream() throws IOException {
		return is;
	}

	public void prepareResponse(Response arg0) {
		arg0.setHeader("Content-Disposition", "inline; filename=" + filename + ((extension == null) ? "" : ("." + extension)));
	}
}
