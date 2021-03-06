package ru.masterdm.km.web.pages.executionEvent;

import java.util.List;

import org.apache.tapestry5.Link;
import org.apache.tapestry5.annotations.Import;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.PageRenderLinkSource;
import org.got5.tapestry5.jquery.ImportJQueryUI;

import ru.masterdm.km.common.entity.ConditionTypeInstance;
import ru.masterdm.km.common.entity.DealCondition;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.dao.EventDao;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.util.ExecuteEventUtil;

/**
 * Карточка просмотра контрольного мероприятий для сделки.
 * 
 * @author Shafigullin Ildar
 * 
 */
@ImportJQueryUI(theme = "context:css/jquery/themes/smoothness/jquery-ui-1.8.23.custom.css")
@Import(stylesheet = { "context:css/jquerydatatables.css" })
public class ViewDealEvent extends SimpleBasePage {
	@Persist
	@Property
	protected KmEventInstance event;
	@Persist
	@Property
	protected int curTab;

	@Property
	private KmFkr fkr;
	@Property
	protected ConditionTypeInstance typeCondition;
	@Property
	protected DealCondition eventCondition;

	@Persist
	Link returnPage;
	@Persist
	private List<ConditionTypeInstance> conditionList;

	@Inject
	private EventDao eventDao;
	@Inject
	private BeanModelSource beanModelSource;
	@Inject
	private PageRenderLinkSource pageRenderLinkSource;

	void onActivate(long eventID, String returnPageName) {
		// System.out.println("onActivate =" + eventID + "; spkpNumber=" + spkpNumber);
		event = eventDao.getEventForExecute(eventID);
		initConditionList();
		returnPage = pageRenderLinkSource.createPageRenderLink(returnPageName);
	}

	private void initConditionList() {
		Long idEventType = event.getEvent().getEventType().getId();
		conditionList = eventDao.getEventConditions(event.getEvent().getDeal().getId(), idEventType);
	}

	Object onSuccessFromViewDealEventForm() {
		return returnPage;
	}

	public String getDealInfo() {
		return ExecuteEventUtil.getDealInfo(event, getDateViewFormat(), getAmountViewFormat());
	}

	public String getDocInfo() {
		return ExecuteEventUtil.getOfficialInfo(event, getDateListFormat(), getAmountViewFormat());
	}

	public String getRepeatTypeInfo() {
		return ExecuteEventUtil.getRepeatTypeInfo(event.getEvent(), getDateViewFormat());
	}

	public String getPageName() {
		return "executionEvent/viewDealEvent";
	}

	public BeanModel<KmFkr> getFkrModel() {
		BeanModel<KmFkr> fkrModel = beanModelSource.createDisplayModel(KmFkr.class, getMessages());
		fkrModel.include("created", "notes", "finished");
		fkrModel.addEmpty("view").sortable(false);
		fkrModel.addEmpty("fkrType").sortable(false);
		fkrModel.addEmpty("sign").sortable(false);
		fkrModel.addEmpty("status").sortable(false);
		fkrModel.reorder("view", "created", "fkrType", "sign", "status");
		return fkrModel;
	}

	public java.util.List<ConditionTypeInstance> getEventConditions() {
		return conditionList;
	}
}
