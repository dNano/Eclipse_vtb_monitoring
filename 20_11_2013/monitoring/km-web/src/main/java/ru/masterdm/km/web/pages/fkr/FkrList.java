package ru.masterdm.km.web.pages.fkr;

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
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;
import org.apache.tapestry5.services.javascript.JavaScriptSupport;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.FkrGroup;
import ru.masterdm.km.common.entity.FkrType;
import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.common.entity.KmFkrStatus;
import ru.masterdm.km.common.searchfilter.FkrFilter;
import ru.masterdm.km.dao.DealDao;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.dao.FkrDao;
import ru.masterdm.km.web.annotation.ProtectedPage;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.model.fkr.FkrInstancesDataSource;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;
import ru.masterdm.km.web.util.FkrUtil;
import ru.masterdm.km.web.util.ReportUtil;

/**
 * Список выявленных ФКР.
 * 
 * @author Shafigullin Ildar
 * 
 */
@ProtectedPage
public class FkrList extends SimpleBasePage {
	@Persist
	@Property
	private FkrFilter filter;

	@Property
	private KmFkrInstance fkrInstance;
	@Property
	private List<Contractor> clientsForDeal;
	@Property
	private Contractor clientForDeal;

	private List<KmFkrStatus> fkrStatuses;
	private List<FkrGroup> fkrGroups;
	private List<FkrType> fkrTypes;

	@Inject
	private FkrDao fkrDao;
	@Inject
	private DealDao dealDao;
	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private BeanModelSource beanModelSource;
	@Inject
	private SelectModelFactory selectModelFactory;
	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;
	@InjectComponent
	private Zone fkrTypeZone;

	@Environmental
	private JavaScriptSupport javaScriptSupport;

	void setupRender() {
		if (filter != null) {
			String focusField = "contractorNameInput";
			if (filter.getContractorName() != null) {
				focusField = "contractorNameInput";
			} else if (filter.getSpkpNumber() != null) {
				focusField = "spkpNumberInput";
			}
			javaScriptSupport.addScript("document.getElementById('%s').focus();", focusField);
		}
	}

	@OnEvent(value = EventConstants.ACTIVATE)
	void prepare() {
		if (filter == null) {
			filter = emptyFilter();
		}
	}

	@OnEvent(value = EventConstants.SUCCESS, component = "searchFkrForm")
	void performSearch() {
		// TODO: complete search, no need in this listener?
	}

	@OnEvent(value = EventConstants.SELECTED, component = "clearFilterButton")
	void clearFilter() {
		filter = emptyFilter();
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "fkrGroupSelect")
	void selectFkrGroup(FkrGroup docGroup) {
		ajaxResponseRenderer.addRender(fkrTypeZone);
	}

	void onProgressiveDisplayFromClientsForDeal(long dealID) {
		clientsForDeal = dealDao.getContractorsForDeal(dealID);
	}

	void onSelectedFromContractorDictionary(String id, String name) {
		// filter.setContractor(dictionaryDao.getContractor(contractorId));
		filter.setContractorName(name);
	}

	private FkrFilter emptyFilter() {
		return new FkrFilter();
	}

	public GridDataSource getFkrInstances() {
		return new FkrInstancesDataSource(fkrDao, filter);
	}

	public BeanModel<KmFkrInstance> getFkrInstanceModel() {
		BeanModel<KmFkrInstance> fkrModel = beanModelSource.createDisplayModel(KmFkrInstance.class, getMessages());
		fkrModel.addEmpty("edit").sortable(false);
		fkrModel.addEmpty("client").sortable(false);
		fkrModel.addEmpty("contractNumber").sortable(true);
		fkrModel.addEmpty("spkpNumber").sortable(true);
		fkrModel.addEmpty("fkrType").sortable(true);
		fkrModel.addEmpty("sign").sortable(true);
		fkrModel.addEmpty("status").sortable(true);
		fkrModel.addEmpty("created").sortable(true);
		fkrModel.addEmpty("finished").sortable(true);
		fkrModel.addEmpty("note").sortable(true);
		return fkrModel;
	}

	private List<KmFkrStatus> getFkrStatuses() {
		if (fkrStatuses == null) {
			fkrStatuses = dictionaryDao.getFkrStatuses();
		}
		return fkrStatuses;
	}

	public SelectModel getFkrStatusSelectModel() {
		return selectModelFactory.create(getFkrStatuses(), "name");
	}

	public ValueEncoder<KmFkrStatus> getFkrStatusValueEncoder() {
		return new BaseEntityValueEncoder<KmFkrStatus>(getFkrStatuses());
	}

	private List<FkrGroup> getFkrGroups() {
		if (fkrGroups == null) {
			fkrGroups = dictionaryDao.getFkrGroups();
		}
		return fkrGroups;
	}

	public SelectModel getFkrGroupSelectModel() {
		return selectModelFactory.create(getFkrGroups(), "name");
	}

	public ValueEncoder<FkrGroup> getFkrGroupValueEncoder() {
		return new BaseEntityValueEncoder<FkrGroup>(getFkrGroups());
	}

	private List<FkrType> getFkrTypes() {
		if (fkrTypes == null && filter.getFkrGroup() != null) {
			return dictionaryDao.getFkrTypes(filter.getFkrGroup().getId());
		}
		return fkrTypes;
	}

	public SelectModel getFkrTypeSelectModel() {
		return selectModelFactory.create(getFkrTypes(), "name");
	}

	public ValueEncoder<FkrType> getFkrTypeValueEncoder() {
		return new BaseEntityValueEncoder<FkrType>(getFkrTypes());
	}

	public String getPageName() {
		return "fkr/fkrList";
	}

	public String getFormattedTypesForDealClient() {
		return ReportUtil.getFormattedTypesForDealClient(clientForDeal.getTypes());
	}

	public String getDocInfo() {
		return FkrUtil.getOfficialInfo(fkrInstance, getDateListFormat(), null);
	}
}
