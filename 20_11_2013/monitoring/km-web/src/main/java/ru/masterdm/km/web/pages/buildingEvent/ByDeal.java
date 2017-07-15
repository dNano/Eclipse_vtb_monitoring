package ru.masterdm.km.web.pages.buildingEvent;

import java.util.List;

import org.apache.tapestry5.EventConstants;
import org.apache.tapestry5.SelectModel;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.annotations.InjectComponent;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.corelib.components.Zone;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.internal.services.StringValueEncoder;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;
import org.apache.tapestry5.services.javascript.JavaScriptSupport;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.common.entity.Currency;
import ru.masterdm.km.common.entity.DealInstance;
import ru.masterdm.km.common.entity.DealType;
import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.common.searchfilter.EventsByDealFilter;
import ru.masterdm.km.dao.DealDao;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.web.annotation.ProtectedPage;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.model.deal.DealInstancesDataSource;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;
import ru.masterdm.km.web.util.BuildingEventUtil;
import ru.masterdm.km.web.util.ExecuteEventUtil;
import ru.masterdm.km.web.util.ReportUtil;

/**
 * Формирование мероприятий по сделкам.Список сделок.
 * 
 * @author Alexey Chalov
 * @author Shafigullin Ildar
 */
@ProtectedPage
public class ByDeal extends SimpleBasePage {
	@Persist
	@Property(write = false)
	private long dealID;
	@Persist
	@Property
	private EventsByDealFilter filter;
	@Persist
	@Property
	private String spkpNumber;

	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private DealDao dealDao;

	@Property(write = false)
	private boolean dealHistoryDialogAppeared;
	@Property
	private DealInstance dealInstance;
	@Property
	private String dealInfo;
	@Property
	private List<Contractor> clientsForDeal;
	@Property
	private Contractor clientForDeal;
	@Property
	private String clientsRowClass;

	@Inject
	private BeanModelSource beanModelSource;
	@Inject
	private SelectModelFactory selectModelFactory;
	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;

	@InjectComponent
	private Zone contractorZone;
	@InjectComponent
	private Zone executorZone;
	@InjectComponent
	private Zone dealInstancesZone;
	@InjectComponent
	private Zone dealHistoryListZone;
	@InjectComponent
	private Zone contractorGroupZone;

	private List<Currency> currencies;
	private List<DealType> dealTypes;

	@Property
	private final StringValueEncoder stringValueEncoder = new StringValueEncoder();

	@Environmental
	private JavaScriptSupport javaScriptSupport;

	void setupRender() {
		javaScriptSupport.addScript("document.getElementById('%s').focus();", "spkpNumberInput");
	}

	public GridDataSource getDealInstances() {
		return new DealInstancesDataSource(dealDao, filter);
	}

	public BeanModel<DealInstance> getDealInstanceModel() {
		BeanModel<DealInstance> model = beanModelSource.createDisplayModel(DealInstance.class, getMessages());
		model.exclude("id", "date", "status", "fkr", "expared");
		model.addEmpty("fkrDeal");
		model.addEmpty("statusName");
		model.addEmpty("contractNumber").sortable(true);
		model.addEmpty("historyDeal");
		model.addEmpty("spkpNumber").sortable(true);
		model.addEmpty("contractorName").sortable(false);
		model.addEmpty("amount").sortable(true);
		model.addEmpty("dealType").sortable(true);
		model.addEmpty("dealDate").sortable(true);
		return model;
	}

	@OnEvent(value = EventConstants.ACTIVATE)
	void prepare() {
		if (filter == null) {
			filter = emptyFilter();
		}
	}

	@OnEvent(value = EventConstants.SUCCESS, component = "searchEventsForm")
	void performSearch() {
		// TODO: complete search, no need in this listener?
	}

	@OnEvent(value = EventConstants.SELECTED, component = "clearFilterButtonForDeal")
	void clearFilter() {
		filter = emptyFilter();
	}

	private EventsByDealFilter emptyFilter() {
		EventsByDealFilter filter = new EventsByDealFilter();
		return filter;
	}

	void onProgressiveDisplayFromClientsForDeal(long dealID, String rowClass) {
		// clientsForDeal = dealDao.getDealContractors(dealID);
		clientsForDeal = dealDao.getContractorsForDeal(dealID);
		clientsRowClass = rowClass;
	}

	public SelectModel getCurrencySelectModel() {
		return selectModelFactory.create(getCurrencies(), "id");
	}

	public ValueEncoder<Currency> getCurrencyValueEncoder() {
		return new BaseEntityValueEncoder<Currency>(getCurrencies());
	}

	private List<Currency> getCurrencies() {
		if (currencies == null) {
			currencies = dictionaryDao.getCurrencies();
		}
		return currencies;
	}

	private List<DealType> getDealTypes() {
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

	void onSelectedFromContractorDictionary(String contractorId, String name) {
		// filter.setContractor(dictionaryDao.getContractor(contractorId));
		Contractor contractor = new Contractor();
		contractor.setName(name);
		contractor.setId(contractorId);
		filter.setContractor(contractor);
	}

	@OnEvent(value = EventConstants.ACTION, component = "deleteContractorLink")
	void deleteContractor() {
		filter.setContractor(null);
		ajaxResponseRenderer.addRender(contractorZone);
	}

	@OnEvent(value = EventConstants.ACTION, component = "showDealHistoryListDialogLink")
	void prepareDealHistorySelectDialog(long idDeal) {
		dealHistoryDialogAppeared = true;
		dealID = idDeal;
		dealInfo = BuildingEventUtil.getDealInfo(dealDao.getDealInstance(dealID), getDateListFormat(), getAmountViewFormat());
		ajaxResponseRenderer.addRender(dealHistoryListZone);
	}

	@OnEvent(value = EventConstants.SELECTED, component = "executorDictionary")
	void selectExecutor(Long executorId, String name) {
		// filter.setExecutor(dictionaryDao.getUser(executorId));
		User user = new User();
		user.setId(executorId);
		user.setLastName(name);
		filter.setExecutor(user);
	}

	@OnEvent(value = EventConstants.ACTION, component = "deleteExecutorLink")
	void deleteExecutor() {
		filter.setExecutor(null);
		ajaxResponseRenderer.addRender(executorZone);
	}

	void onSelectedFromContractorGroupDictionary(String groupId, String name) {
		// filter.setContractorGroup(dictionaryDao.getContractorGroup(groupId));
		ContractorGroup group = new ContractorGroup();
		group.setName(name);
		group.setId(groupId);
		filter.setContractorGroup(group);
	}

	@OnEvent(value = EventConstants.ACTION, component = "deleteContractorGroupLink")
	void deleteContractorGroup() {
		filter.setContractorGroup(null);
		ajaxResponseRenderer.addRender(contractorGroupZone);
	}

	public String getDealRowClass() {
		return (dealInstance != null && dealInstance.getStatus() != null) ? dealInstance.getStatus().name() : "";
	}

	public String getDealDateInfo() {
		return ExecuteEventUtil.getDealDateInfo(dealInstance.getDate());
	}

	public String getDocInfo() {
		return BuildingEventUtil.getDocumentInfo(dealInstance, getDateListFormat());
	}

	public String getFormattedTypesForDealClient() {
		return ReportUtil.getFormattedTypesForDealClient(clientForDeal.getTypes());
	}

	public String getPageName() {
		return "buildingEvent/ByDeal";
	}
}
