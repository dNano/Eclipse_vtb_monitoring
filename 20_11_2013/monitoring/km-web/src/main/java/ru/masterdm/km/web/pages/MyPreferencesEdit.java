package ru.masterdm.km.web.pages;

import org.apache.tapestry5.PersistenceConstants;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.web.annotation.ProtectedPage;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.state.Visit;

/**
 * @author Shafigullin Ildar
 * 
 * Настройки пользователя.
 * 
 */
@ProtectedPage
public class MyPreferencesEdit extends SimpleBasePage {
	@Persist
	@Property
	private User user;

	@Property
	@Persist(PersistenceConstants.FLASH)
	private String message;

	void onPrepareForRender() {
		init();
	}

	void onPrepareForSubmit() {
		init();
	}

	void onValidateFromForm() {
		// здесь должно быть сохрание настроек в БД.
	}

	void onSuccess() {
		if (!isVisitExists()) {
			setVisit(new Visit(user));
		} else {
			getVisit().noteChanges(user);
		}
		message = getMessages().get("User_preferences_saved");
	}

	void onRefresh() {
	}

	public String[] getDatePatterns() {
		return User.DATE_PATTERNS;
	}
	
	public String[] getAmountPatterns() {
		return User.AMOUNT_PATTERNS;
	}

	private void init() {
		// здесь должно быть получение настроек из БД.
		user = getVisit().getUser();
		if (user == null) {
			user = new User();
		}
	}
}
