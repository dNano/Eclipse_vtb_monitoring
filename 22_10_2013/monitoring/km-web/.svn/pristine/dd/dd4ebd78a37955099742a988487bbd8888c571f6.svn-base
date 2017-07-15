package ru.masterdm.km.web.pages.executionEvent;

import static ru.masterdm.km.common.dictionary.EventResultDictionary.FKR;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.OK;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.REMARK;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.SANCTION;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.SANCTION_FKR;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.IN_JOB;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.SUSPEND;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.WAIT_PROCESSING;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.tapestry5.EventConstants;
import org.apache.tapestry5.SelectModel;
import org.apache.tapestry5.ValidationTracker;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.annotations.InjectComponent;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.corelib.components.TextField;
import org.apache.tapestry5.corelib.components.Zone;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;
import org.apache.tapestry5.services.ajax.JavaScriptCallback;
import org.apache.tapestry5.services.javascript.JavaScriptSupport;
import org.got5.tapestry5.jquery.components.Dialog;

import ru.masterdm.km.common.dictionary.EventResultDictionary;
import ru.masterdm.km.common.dictionary.KmEventStatusDictionary;
import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.common.entity.Currency;
import ru.masterdm.km.common.entity.DealType;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmEventInstanceStatus;
import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.common.searchfilter.EventsByDateFilter;
import ru.masterdm.km.dao.ContractorDao;
import ru.masterdm.km.dao.DealDao;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.dao.EventDao;
import ru.masterdm.km.util.query.SortCriterion;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.model.ContractorsDataSource;
import ru.masterdm.km.web.model.UsersDataSource;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;
import ru.masterdm.km.web.util.BuildingEventUtil;
import ru.masterdm.km.web.util.ExecuteEventUtil;
import ru.masterdm.km.web.util.ReportUtil;
import ru.masterdm.km.web.util.SortUtil;

/**
 * Исполнение мероприятий по Дате.
 * 
 * @author Alexey Chalov
 */
public class ByDate extends SimpleBasePage {
	@Persist
	@Property(write = false)
	private long dealID;

	@Persist
	@Property(write = false)
	private long eventID;

	@Persist
	@Property(write = false)
	private String contractorID;

	@Inject
	private EventDao eventDao;
	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private DealDao dealDao;
	@Inject
	private ContractorDao contractorDao;

	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;
	@Inject
	private SelectModelFactory selectModelFactory;
	@Inject
	private BeanModelSource beanModelSource;

	@Environmental
	private ValidationTracker validationTracker;

	@InjectComponent
	private Zone searchPeriodZone;
	@InjectComponent
	private Zone contractorListZone;
	@InjectComponent
	private Zone contractorZone;
	@InjectComponent
	private Zone executorListZone;
	@InjectComponent
	private Zone dealHistoryListZone;
	@InjectComponent
	private Zone eventChronologyZone;
	@InjectComponent
	private Zone contractorHistoryListZone;
	@InjectComponent
	private Zone executorZone;
	@InjectComponent
	private Zone contractorGroupListZone;
	@InjectComponent
	private Zone contractorGroupZone;

	@InjectComponent
	private TextField amountFromInput;
	@InjectComponent
	private TextField amountToInput;
	@InjectComponent
	private Dialog selectContractorDialog;
	@InjectComponent
	private Dialog selectExecutorDialog;
	@InjectComponent
	private Dialog selectContractorGroupDialog;
	@InjectComponent
	private Dialog selectDealHistoryDialog;

	@Property(write = false)
	private boolean contractorDialogAppeared;
	@Property(write = false)
	private boolean executorDialogAppeared;
	@Property(write = false)
	private boolean contractorGroupDialogAppeared;
	@Property(write = false)
	private boolean dealHistoryDialogAppeared;
	@Property(write = false)
	private boolean eventChronologyDialogAppeared;
	@Property(write = false)
	private boolean contractorHistoryDialogAppeared;

	@Persist
	@Property
	private String contractorNamePattern;
	@Persist
	@Property
	private String executorLastNamePattern;
	@Persist
	@Property
	private String contractorGroupNamePattern;
	@Persist
	@Property
	private EventsByDateFilter filter;

	@Property
	private KmEventInstanceStatus status;
	@Property
	private String dealInfo;
	@Property
	private List<Contractor> clientsForDeal;

	@Property
	private Contractor contractor;
	@Property
	private User executor;
	@Property
	private ContractorGroup contractorGroup;
	@Property
	private KmEventInstance eventInstance;
	@Property
	private Contractor clientForDeal;
	@Property
	private String clientsRowClass;

	private Calendar calendar;
	private List<KmEventInstanceStatus> statuses;
	private List<Currency> currencies;
	private List<DealType> dealTypes;

	@OnEvent(value = EventConstants.SUCCESS, component = "searchEventsForm")
	void performSearch() {
		// TODO: complete search, no need in this listener?
	}

	@OnEvent(value = EventConstants.SELECTED, component = "clearFilterButton")
	void clearFilter() {
		filter = emptyFilter();
	}

	@OnEvent(value = EventConstants.VALIDATE, component = "searchEventsForm")
	void suppressValidation() {
		if (validationTracker.inError(amountFromInput)) {
			filter.setAmountFrom(null);
		}
		if (validationTracker.inError(amountToInput)) {
			filter.setAmountTo(null);
		}
		validationTracker.clear();
	}

	@OnEvent(value = EventConstants.SELECTED, component = "contractorSearchButton")
	void searchContractors() {
		ajaxResponseRenderer.addRender(contractorListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "selectContractorLink")
	void selectContractor(String contractorId) {
		filter.setContractor(dictionaryDao.getContractor(contractorId));
		ajaxResponseRenderer.addCallback(new JavaScriptCallback() {

			@Override
			public void run(JavaScriptSupport javaScriptSupport) {
				javaScriptSupport.addScript("jQuery('#%1s').dialog('close');", selectContractorDialog.getClientId());
			}
		});
		ajaxResponseRenderer.addRender(contractorZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "deleteContractorLink")
	void deleteContractor() {
		filter.setContractor(null);
		ajaxResponseRenderer.addRender(contractorZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showContractorListDialogLink")
	void prepareContractorSelectDialog() {
		contractorDialogAppeared = true;
		contractorNamePattern = null;
		ajaxResponseRenderer.addRender(contractorListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "selectExecutorLink")
	void selectExecutor(Long executorId) {
		filter.setExecutor(dictionaryDao.getUser(executorId));
		ajaxResponseRenderer.addCallback(new JavaScriptCallback() {

			@Override
			public void run(JavaScriptSupport javaScriptSupport) {
				javaScriptSupport.addScript("jQuery('#%1s').dialog('close');", selectExecutorDialog.getClientId());
			}
		});
		ajaxResponseRenderer.addRender(executorZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "deleteExecutorLink")
	void deleteExecutor() {
		filter.setExecutor(null);
		ajaxResponseRenderer.addRender(executorZone);
	}

	@OnEvent(value = EventConstants.SELECTED, component = "executorSearchButton")
	void searchExecutors() {
		ajaxResponseRenderer.addRender(executorListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showExecutorListDialogLink")
	void prepareExecutorSelectDialog() {
		executorDialogAppeared = true;
		executorLastNamePattern = null;
		ajaxResponseRenderer.addRender(executorListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showEventChronologyDialogLink")
	void prepareEventChronologySelectDialog(long idEvent) {
		eventChronologyDialogAppeared = true;
		eventID = idEvent;
		ajaxResponseRenderer.addRender(eventChronologyZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showDealHistoryListDialogLink")
	void prepareDealHistorySelectDialog(long idDeal) {
		dealHistoryDialogAppeared = true;
		dealID = idDeal;
		dealInfo = BuildingEventUtil.getDealInfo(dealDao.getDealInstance(dealID), getDateListFormat(), getAmountViewFormat());
		ajaxResponseRenderer.addRender(dealHistoryListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showContractorHistoryListDialogLink")
	void prepareContractorHistorySelectDialog(String idContractor) {
		contractorHistoryDialogAppeared = true;
		contractorID = idContractor;
		ajaxResponseRenderer.addRender(contractorHistoryListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "selectContractorGroupLink")
	void selectContractorGroup(String contractorGroupId) {
		filter.setContractorGroup(dictionaryDao.getContractorGroup(contractorGroupId));
		ajaxResponseRenderer.addCallback(new JavaScriptCallback() {

			@Override
			public void run(JavaScriptSupport javaScriptSupport) {
				javaScriptSupport.addScript("jQuery('#%1s').dialog('close');", selectContractorGroupDialog.getClientId());
			}
		});
		ajaxResponseRenderer.addRender(contractorGroupZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "deleteContractorGroupLink")
	void deleteContractorGroup() {
		filter.setContractorGroup(null);
		ajaxResponseRenderer.addRender(contractorGroupZone);
	}

	@OnEvent(value = EventConstants.SELECTED, component = "contractorGroupSearchButton")
	void searchContractorGroups() {
		ajaxResponseRenderer.addRender(contractorGroupListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showContractorGroupListDialogLink")
	void prepareContractorGroupSelectDialog() {
		contractorGroupDialogAppeared = true;
		contractorGroupNamePattern = null;
		ajaxResponseRenderer.addRender(contractorGroupListZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "weekAheadPeriodLink")
	void setWeekAheadPeriod() {
		filter.setDateFrom(calendar.getTime());
		calendar.set(Calendar.WEEK_OF_YEAR, calendar.get(Calendar.WEEK_OF_YEAR) + 1);
		filter.setDateTo(calendar.getTime());
		ajaxResponseRenderer.addRender(searchPeriodZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "monthAheadPeriodLink")
	void setMonthAheadPeriod() {
		filter.setDateFrom(calendar.getTime());
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
		filter.setDateTo(calendar.getTime());
		ajaxResponseRenderer.addRender(searchPeriodZone);
	}

	@OnEvent(value = EventConstants.ACTIVATE)
	void prepare() {
		if (filter == null) {
			filter = emptyFilter();
		}
		calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
	}

	void onProgressiveDisplayFromClientsForDeal(long dealID, String rowClass) {
		// clientsForDeal = dealDao.getDealContractors(dealID);
		clientsForDeal = dealDao.getContractorsForDeal(dealID);
		clientsRowClass = rowClass;
	}

	public GridDataSource getEventInstances() {
		return new GridDataSource() {
			private int startIndex;
			private List<KmEventInstance> instances;

			@Override
			public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
				this.startIndex = startIndex;
				List<SortCriterion> sortCriteria = SortUtil.toSortCriteria(sortConstraints);
				instances = eventDao.getInstances(startIndex, endIndex - startIndex + 1, filter, sortCriteria);
			}

			@Override
			public Object getRowValue(int index) {
				return instances.get(index - startIndex);
			}

			@Override
			public Class<?> getRowType() {
				return KmEventInstance.class;
			}

			@Override
			public int getAvailableRows() {
				return eventDao.getInstanceCount(filter);
			}
		};
	}

	public BeanModel<KmEventInstance> getEventInstanceModel() {
		BeanModel<KmEventInstance> eventModel = beanModelSource.createDisplayModel(KmEventInstance.class, getMessages());
		eventModel.include("planExecutionDate", "executedDate");
		eventModel.addEmpty("executeAction");
		eventModel.addEmpty("result");
		eventModel.addEmpty("eventStatus");
		eventModel.addEmpty("chronology");
		eventModel.reorder("executeAction", "result", "eventStatus", "planExecutionDate");
		eventModel.addEmpty("eventName").sortable(true);
		eventModel.addEmpty("contractNumber").sortable(false);
		eventModel.addEmpty("spkpNumber").sortable(true);
		eventModel.addEmpty("contractorName").sortable(true);
		eventModel.addEmpty("amount").sortable(true);
		eventModel.addEmpty("dealDate").sortable(true);
		eventModel.addEmpty("mailTo");
		eventModel.addEmpty("executor").sortable(true);
		return eventModel;
	}

	public GridDataSource getContractors() {
		return new ContractorsDataSource(contractorNamePattern, dictionaryDao);
	}

	public GridDataSource getExecutors() {
		return new UsersDataSource(executorLastNamePattern, dictionaryDao);
	}

	public GridDataSource getContractorGroups() {
		return new GridDataSource() {

			private int startIndex;
			private List<ContractorGroup> contractorGroups;

			@Override
			public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
				this.startIndex = startIndex;
				contractorGroups = dictionaryDao.getContractorGroups(startIndex, endIndex - startIndex + 1, contractorGroupNamePattern);
			}

			@Override
			public Object getRowValue(int index) {
				return contractorGroups.get(index - startIndex);
			}

			@Override
			public Class<?> getRowType() {
				return ContractorGroup.class;
			}

			@Override
			public int getAvailableRows() {
				return dictionaryDao.getContractorGroupCount(contractorGroupNamePattern);
			}
		};
	}

	private EventsByDateFilter emptyFilter() {
		EventsByDateFilter filter = new EventsByDateFilter();
		List<KmEventInstanceStatus> statuses = new ArrayList<KmEventInstanceStatus>();
		// statuses.addAll(getStatuses());
		filter.setStatuses(statuses);
		return filter;
	}

	public List<KmEventInstanceStatus> getStatuses() {
		if (statuses == null) {
			statuses = dictionaryDao.getInstanceStatuses();
		}
		return statuses;
	}

	public boolean isStatusSelected() {
		return filter.getStatuses().contains(status);
	}

	public void setStatusSelected(boolean statusSelected) {
		if (statusSelected) {
			if (!filter.getStatuses().contains(status)) {
				filter.getStatuses().add(status);
			}
		} else {
			filter.getStatuses().remove(status);
		}
	}

	public List<Currency> getCurrencies() {
		if (currencies == null) {
			currencies = dictionaryDao.getCurrencies();
		}
		return currencies;
	}

	public SelectModel getCurrencySelectModel() {
		return selectModelFactory.create(getCurrencies(), "id");
	}

	public ValueEncoder<Currency> getCurrencyValueEncoder() {
		return new BaseEntityValueEncoder<Currency>(getCurrencies());
	}

	public List<DealType> getDealTypes() {
		if (dealTypes == null) {
			dealTypes = dictionaryDao.getDealTypes();
		}
		return dealTypes;
	}

	public SelectModel getDealTypeSelectModel() {
		return selectModelFactory.create(getDealTypes(), "name");
	}

	public ValueEncoder<DealType> getDealTypeValueEncoder() {
		return new BaseEntityValueEncoder<DealType>(getDealTypes());
	}

	public BeanModel<Contractor> getContractorModel() {
		BeanModel<Contractor> contractorModel = beanModelSource.createDisplayModel(Contractor.class, getMessages());
		for (String prop : contractorModel.getPropertyNames()) {
			contractorModel.get(prop).sortable(false);
		}
		return contractorModel;
	}

	public BeanModel<User> getExecutorModel() {
		BeanModel<User> executorModel = beanModelSource.createDisplayModel(User.class, getMessages());
		for (String prop : executorModel.getPropertyNames()) {
			executorModel.get(prop).sortable(false);
		}
		return executorModel;
	}

	public BeanModel<ContractorGroup> getContractorGroupModel() {
		BeanModel<ContractorGroup> contractorGroupModel = beanModelSource.createDisplayModel(ContractorGroup.class, getMessages());
		for (String prop : contractorGroupModel.getPropertyNames()) {
			contractorGroupModel.get(prop).sortable(false);
		}
		return contractorGroupModel;
	}

	public String getEventRowClass() {
		String rowClass = "";
		if (eventInstance != null) {
			if (isFkrResult()) {
				rowClass = "FKR";
			} else if (eventInstance.isExpared()) {
				rowClass = "EXPARED";
			}
		}
		return rowClass;
	}

	public String getDealDateInfo() {
		return ExecuteEventUtil.getDealDateInfo(eventInstance.getEvent().getDeal().getValidTo());
	}

	public String getDocInfo() {
		return ExecuteEventUtil.getDocumentInfo(eventInstance.getEvent().getDeal(), getDateListFormat(), null);
	}

	public boolean isOkResult() {
		return isEventResult(OK, eventInstance);
	}

	public boolean isSanctionOrRemarkResult() {
		return isEventResult(SANCTION, eventInstance) || isEventResult(REMARK, eventInstance);
	}

	public boolean isFkrResult() {
		return isEventResult(FKR, eventInstance) || isEventResult(SANCTION_FKR, eventInstance);
	}

	public boolean isSanctionResult() {
		return isEventResult(SANCTION, eventInstance) || isEventResult(SANCTION_FKR, eventInstance);
	}

	private boolean isEventResult(EventResultDictionary dict, KmEventInstance kmEventInstance) {
		Long result = kmEventInstance.getResult().getId();
		return (result != null && result.intValue() == dict.getId()) ? true : false;
	}

	public boolean isCanExecuted() {
		return isEventStatus(WAIT_PROCESSING) || isEventStatus(IN_JOB) || isEventStatus(SUSPEND);
	}

	private boolean isEventStatus(KmEventStatusDictionary dict) {
		Long status = eventInstance.getStatus().getId();
		return (status != null && status.intValue() == dict.getId()) ? true : false;
	}

	public String getFormattedTypesForDealClient() {
		return ReportUtil.getFormattedTypesForDealClient(clientForDeal.getTypes());
	}

	public String getPageName() {
		return "executionEvent/ByDate";
	}
}
