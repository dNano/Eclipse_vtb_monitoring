package ru.masterdm.km.web.components;

import org.apache.tapestry5.EventConstants;
import org.apache.tapestry5.annotations.InjectComponent;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.corelib.components.Zone;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.ioc.Messages;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;

import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.web.model.UsersDataSource;

/**
 * Справочник исполнителей.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ExecutorDictionary {
	@Persist
	@Property
	private String executorLastNamePattern;
	@Property
	private User executor;

	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private Messages messages;
	@Inject
	private BeanModelSource beanModelSource;
	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;

	@InjectComponent
	private Zone executorGridZone;

	boolean onSelected(String id, String name) {
		executorLastNamePattern = null;
		return false;
	}

	@OnEvent(value = EventConstants.SELECTED, component = "executorSearchButton")
	void searchExecutors() {
		ajaxResponseRenderer.addRender(executorGridZone);
	}

	public GridDataSource getExecutors() {
		return new UsersDataSource(executorLastNamePattern, dictionaryDao);
	}

	public BeanModel<User> getExecutorModel() {
		BeanModel<User> executorModel = beanModelSource.createDisplayModel(User.class, messages);
		for (String prop : executorModel.getPropertyNames()) {
			executorModel.get(prop).sortable(false);
		}
		return executorModel;
	}
}
