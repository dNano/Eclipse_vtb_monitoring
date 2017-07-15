package ru.masterdm.km.web.model.services.util;

import java.io.InputStream;

import ru.masterdm.km.web.model.services.InlineStreamResponse;

public class JPEGInline extends InlineStreamResponse {
	public JPEGInline(InputStream is, String... args) {
		super(is, args);
		this.contentType = "image/jpeg";
		this.extension = "jpg";
	}
}
