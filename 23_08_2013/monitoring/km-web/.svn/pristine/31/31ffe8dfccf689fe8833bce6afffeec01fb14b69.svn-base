package ru.masterdm.km.web.pages.eventInstances;

import java.util.List;

import org.apache.tapestry5.PersistenceConstants;
import org.apache.tapestry5.ValidationTracker;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.annotations.InjectComponent;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.corelib.components.Tree;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;
import org.apache.tapestry5.ioc.Messages;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.tree.DefaultTreeModel;
import org.apache.tapestry5.tree.TreeModel;

import ru.masterdm.km.common.entity.KmClassifier;
import ru.masterdm.km.common.entity.KmEventCalendar;
import ru.masterdm.km.dao.DealDao;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.util.ValueWrapper;
import ru.masterdm.km.web.util.ValueWrapperTreeModelAdapter;

/**
 * План мероприятий для сделки.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class DealPlan {
	@Inject
	private DealDao dealDao;
	@Inject
	private DictionaryDao dictionaryDao;

	@Environmental
	private ValidationTracker validationTracker;

	@InjectComponent
	private Tree tree;

	@Persist(PersistenceConstants.FLASH)
	@Property
	private ValueWrapper valueWrapper;

	private static final ValueWrapper rootNode = new ValueWrapper("Root", null);;
	private TreeModel<ValueWrapper> treeModel;

	private synchronized ValueWrapper getRootNode() {
		if (rootNode.children.isEmpty()) {
			// Build the data structure for the tree
//			List<MonitoredObjectType> monitoredObjectTypes = dictionaryDao.getMonitoredObjectTypes();
//			for (MonitoredObjectType mo : monitoredObjectTypes) {
//				ValueWrapper objectNode = new ValueWrapper(mo.getName(), null);
//				// формируем подпапки:
//				List<KmEventTypeGroup> kmEventTypeGroups = dictionaryDao.getEventTypeGroups(mo.getId());
//				for (KmEventTypeGroup group : kmEventTypeGroups) {
//					ValueWrapper groupNode = new ValueWrapper(group.getName(), null);
//					List<KmEventType> kmEventTypes = dictionaryDao.getKmEventTypes(group.getId());
//					for (KmEventType type : kmEventTypes) {
//						ValueWrapper typeNode = new ValueWrapper(type.getName(), "" + type.getId());
//						groupNode.addChild(typeNode);
//					}
//					if (!groupNode.isLeaf()) {
//						objectNode.addChild(groupNode);
//					}
//				}
//				if (!objectNode.isLeaf()) {
//					rootNode.addChild(objectNode);
//				}
//			}
			List<KmClassifier> list = dealDao.getClassifiers(0, Integer.MAX_VALUE);
			ValueWrapper curObjectNode = null;
			ValueWrapper curGroupNode = null;
			for(KmClassifier kmClass: list){
				ValueWrapper curTypeNode = new ValueWrapper(kmClass.getEventType().getName(), "" + kmClass.getEventType().getId());
				if(curObjectNode == null || !curObjectNode.getLabel().equals(kmClass.getMonitoredObjectType().getName())){
					curObjectNode = new ValueWrapper(kmClass.getMonitoredObjectType().getName(), "" + kmClass.getMonitoredObjectType().getId());
					rootNode.addChild(curObjectNode);
				}
				if(curGroupNode == null || !curGroupNode.getLabel().equals(kmClass.getEventTypeGroup().getName())){
					curGroupNode = new ValueWrapper(kmClass.getEventTypeGroup().getName(), "" + kmClass.getEventTypeGroup().getId());
					curObjectNode.addChild(curGroupNode);
				}
				curGroupNode.addChild(curTypeNode);
			}			
		}
		return rootNode;
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

	@Persist
	// @Property
	private long dealID;
	@Property
	@Persist
	private String spkpNumber;

	@Inject
	private BeanModelSource beanModelSource;

	@Inject
	private Messages messages;

	@Property
	private KmEventCalendar calendar;

	@OnEvent(component = "addEventType")
	void addEventType(long eventTypeID, String eventName) {
		if (!dealDao.isExistEventType(dealID, eventTypeID)) {
			dealDao.addEventType(dealID, eventTypeID, eventName);
		} else {
			// TODO передать сообщение
			// validationTracker.recordError(messages.get("event-required-message"));
		}
	}

	@OnEvent(component = "removeEventType")
	void removeEventType(long eventTypeID) {
		dealDao.removeEventType(dealID, eventTypeID);
	}

	void onActivate(long id, String spkpNumber) {
		dealID = id;
		this.spkpNumber = spkpNumber;
	}

	public GridDataSource getPlan() {
		return new GridDataSource() {
			private int startIndex;
			private List<KmEventCalendar> instances;

			@Override
			public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
				this.startIndex = startIndex;
				instances = dealDao.getDealPlan(startIndex, endIndex - startIndex + 1, dealID);
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
				return dealDao.getDealPlanCount(dealID);
			}
		};
	}

	public long getDealID() {
		return dealID;
	}

	public void setDealID(long dealID) {
		this.dealID = dealID;
	}
	
	public String getPageName(){
		return "dealPlanPage";
	}
}
