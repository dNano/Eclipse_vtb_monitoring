package ru.masterdm.km.web.pages.eventInstances;

import java.util.HashSet;

import org.apache.tapestry5.annotations.Import;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.got5.tapestry5.jquery.ImportJQueryUI;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.common.entity.KmEventCalendar;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.dao.ContractorDao;
import ru.masterdm.km.web.base.event.ClassifierBasePage;

/**
 * таб. панель "классификатор-план-календарь" КМ для клиента.
 * 
 * @author Shafigullin Ildar
 * 
 */
@Import(stylesheet = { "context:css/jquerydatatables.css" })
@ImportJQueryUI(theme = "context:css/jquery/themes/smoothness/jquery-ui-1.8.23.custom.css")
public class ContractorClassifier extends ClassifierBasePage {
	@Persist
	@Property
	private Contractor contractor;
	@Persist
	private String contractorID;
	@Inject
	private ContractorDao contractorDao;

	void onActivate(String contractorID, int curTab) {
		this.curTab = curTab;
		contractor = dictionaryDao.getContractor(contractorID);
		this.contractorID = contractorID;
		if (filter == null) {
			filter = new KmEvent();
		}
		init();
	}

	protected void initCalendar() {
		calendarList = contractorDao.getContractorCalendar(0, Integer.MAX_VALUE, contractorID, filter);
		arrayCalendar = new HashSet<Long>();
		for (KmEventInstance event : calendarList) {
			arrayCalendar.add(event.getEvent().getId());
		}
	}

	protected void initPlan() {
		planList = contractorDao.getContractorPlan(0, Integer.MAX_VALUE, contractorID, filter);
		arrayPlanForTree = new HashSet<Long>();
		for (KmEventCalendar planEvent : planList) {
			arrayPlanForTree.add(planEvent.getClassifier().getEventType().getId());
		}
	}

	@Override
	protected void initFkrList() {
		fkrList = contractorDao.getContractorFkr(0, Integer.MAX_VALUE, contractorID);
	}

	@OnEvent(component = "addEventType")
	void addEventType(long eventTypeID, String eventName) {
		// if (!contractorDao.isExistEventType(contractor.getId(), eventTypeID)) {
		contractorDao.addEventType(contractor.getId(), eventTypeID);
		arrayPlanForTree.add(Long.valueOf(eventTypeID));
		selectedEventTypeID = eventTypeID;
		clearPlan();
		// }
	}

	@OnEvent(component = "removeEventType")
	void removeEventType(long eventTypeID) {
		contractorDao.removeEventType(contractorID, eventTypeID);
		arrayPlanForTree.remove(Long.valueOf(eventTypeID));
		clearSelectedRow();
		clearPlan();
	}

	@OnEvent(component = "acceptEventType")
	void acceptEventType(long eventCalendarID, long eventTypeID) {
		contractorDao.acceptEventType(contractorID, eventCalendarID);
		// clearSelectedRow();
		selectedEventTypeID = eventTypeID;
		cleanCalendar();
	}

	@OnEvent(component = "acceptAll")
	void acceptAllEvent() {
		contractorDao.acceptPlan(contractorID, filter);
		clearSelectedRow();
		cleanCalendar();
	}

	@OnEvent(component = "removeEventInstance")
	void removeEventInstance(long eventInstanceID) {
		eventDao.removeEventInstance(eventInstanceID);
		clearSelectedRow();
		cleanCalendar();
	}

	public BeanModel<KmEventInstance> getEventInstanceModel() {
		BeanModel<KmEventInstance> eventModel = beanModelSource.createDisplayModel(KmEventInstance.class, getMessages());
		eventModel.include("planExecutionDate");
		eventModel.addEmpty("eventName").sortable(true);
		eventModel.addEmpty("mailTo");
		eventModel.addEmpty("executor").sortable(true);
		eventModel.addEmpty("remove");
		return eventModel;
	}

	public BeanModel<KmEventCalendar> getPlanModel() {
		BeanModel<KmEventCalendar> model = beanModelSource.createDisplayModel(KmEventCalendar.class, getMessages());
		model.exclude("id", "name", "startDate", "endDate", "periodDate", "periodDetails", "excludeHoliday", "periodWeekend", "docTypeByHand",
				"sourceDocComment", "sourceDocNumber", "sourceDocDate", "fkrCandLong");
		model.addEmpty("accept").sortable(true);
		model.addEmpty("eventTypeName").sortable(true);
		return model;
	}

	public BeanModel<KmEventCalendar> getCalendarModel() {
		BeanModel<KmEventCalendar> model = beanModelSource.createDisplayModel(KmEventCalendar.class, getMessages());
		model.exclude("id", "name", "startDate", "endDate", "periodDate", "periodDetails", "excludeHoliday", "periodWeekend", "docTypeByHand",
				"sourceDocComment", "sourceDocNumber", "sourceDocDate", "fkrCandLong");
		model.addEmpty("edit");
		model.addEmpty("eventTypeName").sortable(true);
		model.addEmpty("remove");
		return model;
	}

	public BeanModel<KmFkr> getFkrInstanceModel() {
		BeanModel<KmFkr> fkrModel = beanModelSource.createDisplayModel(KmFkr.class, getMessages());
		fkrModel.include("created", "finished");
		fkrModel.addEmpty("edit");
		fkrModel.reorder("edit", "created", "finished");
		fkrModel.addEmpty("fkrType").sortable(true);
		fkrModel.addEmpty("note").sortable(true);
		fkrModel.addEmpty("sign").sortable(true);
		fkrModel.addEmpty("status").sortable(true);
		return fkrModel;
	}

	public String getPageName() {
		return "eventInstances/ContractorClassifier";
	}

}
