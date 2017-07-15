package ru.masterdm.km.dao.exception;

//import ru.masterdm.km.util.MessageUtil;

@SuppressWarnings("serial")
public class AuthenticationException extends BusinessException {
	String messageId;
	Object[] messageArgs;

	public AuthenticationException(String messageId) {
		this(messageId, null);
	}

	public AuthenticationException(String messageId, Object messageArg) {
		super();
		this.messageId = messageId;
		this.messageArgs = new Object[] { messageArg };
	}

	@Override
	public String getMessage() {

		// We deferred converting the message ids to messages until now, when we are more likely to be in the user's
		// locale.
		// String msg = MessageUtil.toText(messageId, messageArgs);
		// return msg;
		return messageId;
	}

	public String getMessageId() {
		return messageId;
	}

}
