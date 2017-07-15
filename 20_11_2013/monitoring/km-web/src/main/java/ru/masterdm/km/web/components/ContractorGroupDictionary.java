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

import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.web.model.ContractorGroupsDataSource;

/**
 * Справочник групп клиентов.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ContractorGroupDictionary {
	@Persist
	@Property
	private String groupNamePattern;
	@Property
	private ContractorGroup group;

	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private Messages messages;
	@Inject
	private BeanModelSource beanModelSource;
	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;

	@InjectComponent
	private Zone groupGridZone;

	@OnEvent(value = EventConstants.SELECTED, component = "groupSearchButton")
	void searchGroups() {
		ajaxResponseRenderer.addRender(groupGridZone);
	}

	boolean onSelected(String id, String name) {
		groupNamePattern = null;
		return false;
	}

	public GridDataSource getGroups() {
		return new ContractorGroupsDataSource(groupNamePattern, dictionaryDao);
	}

	public BeanModel<ContractorGroup> getGroupModel() {
		BeanModel<ContractorGroup> groupModel = beanModelSource.createDisplayModel(ContractorGroup.class, messages);
		for (String prop : groupModel.getPropertyNames()) {
			groupModel.get(prop).sortable(false);
		}
		return groupModel;
	}

}
