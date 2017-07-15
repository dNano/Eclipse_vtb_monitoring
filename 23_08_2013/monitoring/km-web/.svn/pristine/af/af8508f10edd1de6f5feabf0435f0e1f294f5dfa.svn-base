package ru.masterdm.km.web.pages.executionEvent;

import org.apache.tapestry5.Link;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.PageRenderLinkSource;

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
public class ViewDealEvent extends SimpleBasePage {
	@Persist
	@Property
	protected KmEventInstance event;

	@Property
	private KmFkr fkr;

	@Persist
	Link returnPage;

	@Inject
	private EventDao eventDao;
	@Inject
	private BeanModelSource beanModelSource;
	@Inject
	private PageRenderLinkSource pageRenderLinkSource;

	void onActivate(long eventID, String returnPageName) {
		// System.out.println("onActivate =" + eventID + "; spkpNumber=" + spkpNumber);
		event = eventDao.getEventForExecute(eventID);
		returnPage = pageRenderLinkSource.createPageRenderLink(returnPageName);
	}

	Object onSuccessFromViewDealEventForm() {
		return returnPage;
	}

	public String getDealInfo() {
		return ExecuteEventUtil.getDealInfo(event.getEvent().getDeal(), getDateViewFormat(), getAmountViewFormat());
	}

	public String getDocInfo() {
		return ExecuteEventUtil.getDocumentInfo(event.getEvent().getDeal(), getDateListFormat(), getAmountViewFormat());
	}

	public String getRepeatTypeInfo() {
		return ExecuteEventUtil.getRepeatTypeInfo(event.getEvent(), getDateViewFormat());
	}

	public BeanModel<KmFkr> getFkrModel() {
		BeanModel<KmFkr> fkrModel = beanModelSource.createDisplayModel(KmFkr.class, getMessages());
		fkrModel.include("created", "notes", "finished");
		fkrModel.addEmpty("fkrType").sortable(false);
		fkrModel.addEmpty("sign").sortable(false);
		fkrModel.addEmpty("status").sortable(false);
		fkrModel.reorder("created", "fkrType", "sign", "status");
		return fkrModel;
	}
}
