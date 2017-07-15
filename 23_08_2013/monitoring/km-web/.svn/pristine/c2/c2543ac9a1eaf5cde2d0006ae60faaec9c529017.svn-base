package ru.masterdm.km.web.pages.eventInstances;

import java.util.Collections;
import java.util.List;

import org.apache.tapestry5.EventConstants;
import org.apache.tapestry5.PersistenceConstants;
import org.apache.tapestry5.SelectModel;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.InjectComponent;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.corelib.components.Tree;
import org.apache.tapestry5.corelib.components.Zone;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;
import org.apache.tapestry5.tree.DefaultTreeModel;
import org.apache.tapestry5.tree.TreeModel;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.common.entity.KmEventCalendar;
import ru.masterdm.km.common.entity.KmEventType;
import ru.masterdm.km.common.entity.KmEventTypeGroup;
import ru.masterdm.km.common.entity.MonitoredObjectType;
import ru.masterdm.km.dao.ContractorDao;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.util.ClassifierValueWrapper;
import ru.masterdm.km.util.ValueWrapper;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;
import ru.masterdm.km.web.util.ValueWrapperTreeModelAdapter;

/**
 * План мероприятий для клиента.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ContractorPlan {
	@Property
	private KmEventCalendar calendar;

	@Persist
	@Property
	private KmEvent filter;
	@Persist
	// @Property
	private Contractor contractor;

	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private ContractorDao contractorDao;
	@Inject
	private SelectModelFactory selectModelFactory;
	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;

	@InjectComponent
	private Zone contractorPlanZone;

	private List<MonitoredObjectType> monitoredObjectTypes;
	private List<KmEventTypeGroup> kmEventTypeGroups;
	private List<KmEventType> kmEventTypes;

	@InjectComponent
	private Tree tree;

	@Persist(PersistenceConstants.FLASH)
	@Property
	private ClassifierValueWrapper valueWrapper;

	private static final ValueWrapper rootNode = new ValueWrapper("Root", null);;
	private TreeModel<ValueWrapper> treeModel;

	void onActivate(String contractorID) {
		contractor = dictionaryDao.getContractor(contractorID);
		if (filter == null) {
			filter = new KmEvent();
		}
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "monitoredObjectTypeSelect")
	void selectMonitoredObjectType(MonitoredObjectType monitoredObjectType) {
		filter.setMonitoredObjectType(monitoredObjectType);
		selectEventTypeGroup(null);
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "eventTypeGroupSelect")
	void selectEventTypeGroup(KmEventTypeGroup eventTypeGroup) {
		filter.setEventTypeGroup(eventTypeGroup);
		selectEventType(null);
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "eventTypeSelect")
	void selectEventType(KmEventType eventType) {
		filter.setEventType(eventType);
		ajaxResponseRenderer.addRender(contractorPlanZone);
	}

	public SelectModel getMonitoredObjectTypeSelectModel() {
		return selectModelFactory.create(getMonitoredObjectTypes(), "name");
	}

	private List<MonitoredObjectType> getMonitoredObjectTypes() {
		if (monitoredObjectTypes == null) {
			monitoredObjectTypes = dictionaryDao.getMonitoredObjectTypes();
		}
		return monitoredObjectTypes;
	}

	public ValueEncoder<MonitoredObjectType> getMonitoredObjectTypeValueEncoder() {
		return new BaseEntityValueEncoder<MonitoredObjectType>(getMonitoredObjectTypes());
	}

	public SelectModel getEventTypeGroupSelectModel() {
		return selectModelFactory.create(getKmEventTypeGroups() != null ? getKmEventTypeGroups() : Collections.emptyList(), "name");
	}

	private List<KmEventTypeGroup> getKmEventTypeGroups() {
		if (kmEventTypeGroups == null && filter.getMonitoredObjectType() != null) {
			kmEventTypeGroups = dictionaryDao.getEventTypeGroups(filter.getMonitoredObjectType().getId());
		}
		return kmEventTypeGroups;
	}

	public ValueEncoder<KmEventTypeGroup> getEventTypeGroupValueEncoder() {
		return new BaseEntityValueEncoder<KmEventTypeGroup>(getKmEventTypeGroups());
	}

	public SelectModel getEventTypeSelectModel() {
		return selectModelFactory.create(getKmEventTypes() != null ? getKmEventTypes() : Collections.emptyList(), "name");
	}

	private List<KmEventType> getKmEventTypes() {
		if (kmEventTypes == null && filter.getEventTypeGroup() != null) {
			kmEventTypes = dictionaryDao.getKmEventTypes(filter.getEventTypeGroup().getId());
		}
		return kmEventTypes;
	}

	public ValueEncoder<KmEventType> getEventTypeValueEncoder() {
		return new BaseEntityValueEncoder<KmEventType>(getKmEventTypes());
	}

	public boolean isRenderEventTypeGroup() {
		return (filter != null) && (filter.getMonitoredObjectType() != null);
	}

	public boolean isRenderEventType() {
		return (filter != null) && (filter.getEventTypeGroup() != null);
	}

	public TreeModel<ValueWrapper> getValueWrapperModel() {
		if (treeModel == null) {
			ValueEncoder<ValueWrapper> encoder = new ValueEncoder<ValueWrapper>() {
				public String toClient(ValueWrapper value) {
					return value.uuid;
				}

				public ValueWrapper toValue(String clientValue) {
					return getRootNode().seek(clientValue);
				}
			};

			treeModel = new DefaultTreeModel<ValueWrapper>(encoder, new ValueWrapperTreeModelAdapter(), getRootNode().children);
		}
		return treeModel;
	}

	private synchronized ValueWrapper getRootNode() {
		if (rootNode.children.isEmpty()) {
			// Build the data structure for the tree
			List<MonitoredObjectType> monitoredObjectTypes = dictionaryDao.getMonitoredObjectTypes();
			for (MonitoredObjectType mo : monitoredObjectTypes) {
				ClassifierValueWrapper objectNode = new ClassifierValueWrapper(mo.getName(), null, true, false, false);
				// формируем подпапки:
				List<KmEventTypeGroup> kmEventTypeGroups = dictionaryDao.getEventTypeGroups(mo.getId());
				for (KmEventTypeGroup group : kmEventTypeGroups) {
					ClassifierValueWrapper groupNode = new ClassifierValueWrapper(group.getName(), null, false, true, false);
					List<KmEventType> kmEventTypes = dictionaryDao.getKmEventTypes(group.getId());
					for (KmEventType type : kmEventTypes) {
						ClassifierValueWrapper typeNode = new ClassifierValueWrapper(type.getName(), "" + type.getId(), false, false, true);
						groupNode.addChild(typeNode);
					}
					if (!groupNode.isLeaf()) {
						objectNode.addChild(groupNode);
					}
				}
				rootNode.addChild(objectNode);
			}
		}
		return rootNode;
	}

	@OnEvent(component = "addEventType")
	void addEventType(long eventTypeID, String eventName) {
		if (!contractorDao.isExistEventType(contractor.getId(), eventTypeID)) {
			contractorDao.addEventType(contractor.getId(), eventTypeID);
		} else {
			// TODO передать сообщение
			// validationTracker.recordError(messages.get("event-required-message"));
		}
	}

	@OnEvent(component = "removeEventType")
	void removeEventType(long eventTypeID) {
		contractorDao.removeEventType(contractor.getId(), eventTypeID);
	}

	public GridDataSource getPlan() {
		return new GridDataSource() {
			private int startIndex;
			private List<KmEventCalendar> instances;

			@Override
			public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
				this.startIndex = startIndex;
				instances = contractorDao.getContractorPlan(startIndex, endIndex - startIndex + 1, contractor.getId(), filter);
			}

			@Override
			public Object getRowValue(int index) {
				return instances.get(index - startIndex);
			}

			@Override
			public Class<?> getRowType() {
				return KmEventCalendar.class;
			}

			@Override
			public int getAvailableRows() {
				return contractorDao.getContractorPlanCount(contractor.getId(), filter);
			}
		};
	}

	public Contractor getContractor() {
		return contractor;
	}

	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}

}
