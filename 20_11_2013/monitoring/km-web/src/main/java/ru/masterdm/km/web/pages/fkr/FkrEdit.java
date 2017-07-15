package ru.masterdm.km.web.pages.fkr;

import static ru.masterdm.km.web.base.event.ClassifierBasePage.FKR_TAB;

import java.util.List;

import org.apache.tapestry5.EventConstants;
import org.apache.tapestry5.Link;
import org.apache.tapestry5.SelectModel;
import org.apache.tapestry5.StreamResponse;
import org.apache.tapestry5.ValidationTracker;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.PageRenderLinkSource;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.upload.services.UploadedFile;

import ru.masterdm.km.common.entity.Deal;
import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.common.entity.KmFkrStatus;
import ru.masterdm.km.common.entity.KmFkrStatusChange;
import ru.masterdm.km.common.util.DataTypeUtil;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.dao.FkrDao;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.model.fkr.FkrChangeDataSource;
import ru.masterdm.km.web.model.services.StreamResponseFactory;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;
import ru.masterdm.km.web.util.ExecuteEventUtil;
import ru.masterdm.km.web.util.FkrUtil;

/**
 * EditPage for ФКР.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class FkrEdit extends SimpleBasePage {
	@Persist
	@Property
	private KmFkrInstance fkr;

	@Persist
	Link returnPage;

	@Property
	private KmFkrStatusChange change;

	@Inject
	private FkrDao fkrDao;
	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private PageRenderLinkSource pageRenderLinkSource;
	@Inject
	private SelectModelFactory selectModelFactory;
	@Inject
	private BeanModelSource beanModelSource;

	@Environmental
	private ValidationTracker validationTracker;

	@Property
	private UploadedFile docFile;
	@Property
	private String docFileId;

	private Action action;

	private enum Action {
		SAVE_FKR, CANCEL;
	}

	void onActivate(long fkrID, String returnPageName) {
		fkr = fkrDao.getFkrInstance(fkrID);
		if ("fkr/fkrList".equalsIgnoreCase(returnPageName)) {
			returnPage = pageRenderLinkSource.createPageRenderLinkWithContext(returnPageName);
		} else if ("eventInstances/dealClassifier".equalsIgnoreCase(returnPageName)) {
			Long dealID = fkr.getFkr().getDeal().getId();
			returnPage = pageRenderLinkSource.createPageRenderLinkWithContext(returnPageName, dealID, FKR_TAB);
		} else if ("eventInstances/contractorClassifier".equalsIgnoreCase(returnPageName)) {
			String clientID = fkr.getClient().getId();
			returnPage = pageRenderLinkSource.createPageRenderLinkWithContext(returnPageName, clientID, FKR_TAB);
		} else if ("executionEvent/ExecuteDealEvent".equalsIgnoreCase(returnPageName)) {
			Long eventID = fkr.getEvent().getId();
			// String spkpNumber = fkr.getEvent().getEvent().getDeal().getSpkpNumber();
			returnPage = pageRenderLinkSource.createPageRenderLinkWithContext(returnPageName, eventID, "executionEvent/ByDate");
		}
	}

	@OnEvent(value = EventConstants.SELECTED, component = "editFkrButton")
	void editFkrRequested() {
		action = Action.SAVE_FKR;
	}

	@OnEvent(value = EventConstants.SELECTED, component = "cancelButton")
	void cancelRequested() {
		action = Action.CANCEL;
		// componentResources.discardPersistentFieldChanges();
	}

	void onValidateFromFkrEditForm() {
		switch (action) {
		case SAVE_FKR:
			validateOnSaveFkr();
			break;
		default:
			break;
		}
	}

	private void validateOnSaveFkr() {
		if (fkr.getChange().getStatus() == null) {
			validationTracker.recordError(getMessages().get("fkrChangeStatus-required-message"));
		}
		if (DataTypeUtil.isEmpty(fkr.getChange().getNotes())) {
			validationTracker.recordError(getMessages().get("fkrChangeNote-required-message"));
		}
		if (DataTypeUtil.isEmpty(fkr.getChange().getWho())) {
			validationTracker.recordError(getMessages().get("fkrChangeWho-required-message"));
		}
		if (fkr.getChange().getAccepted() == null) {
			validationTracker.recordError(getMessages().get("fkrChangeAccepted-required-message"));
		}
		// ajaxResponseRenderer.addRender(fkrEditZone);
	}

	Object onSuccessFromFkrEditForm() {
		switch (action) {
		case SAVE_FKR:
			saveFkr();
			break;
		case CANCEL:
			break;
		default:
			return null;
		}
		// переход к вызывающей странице:
		return returnPage;
	}

	private void saveFkr() {
		if (docFile != null) {
			FkrUtil.initDocFile(fkr, docFile);
		}
		fkrDao.saveFkrInstance(fkr);
	}

	private List<KmFkrStatus> getFkrStatuses() {
		return dictionaryDao.getFkrStatuses();
	}

	public SelectModel getFkrStatusSelectModel() {
		return selectModelFactory.create(getFkrStatuses(), "name");
	}

	public ValueEncoder<KmFkrStatus> getFkrStatusValueEncoder() {
		return new BaseEntityValueEncoder<KmFkrStatus>(getFkrStatuses());
	}

	public String getFkrInfo() {
		String fkrInfo = "";
		Deal deal = fkr.getFkr().getDeal();
		if (deal.getId() != null) {
			fkrInfo = FkrUtil.getDealInfo(fkr, getDateListFormat(), getAmountViewFormat());//TODO
			fkrInfo += ", " + ExecuteEventUtil.getClientInfo("", deal.getBorrower());
		} else if (fkr.getClient().getId() != null) {
			fkrInfo = FkrUtil.getClientInfo("Клиент: ", fkr.getClient());
		} else if (fkr.getEvent().getId() != null) {
			KmEvent event = fkr.getEvent().getEvent();
			String spkpNumber = event.getDeal().getSpkpNumber();
			fkrInfo = "мероприятие: " + event.getName() + ". ";
			fkrInfo += "Сделка № " + spkpNumber;
		}
		return fkrInfo;
	}

	public GridDataSource getFkrChanges() {
		return new FkrChangeDataSource(fkr.getFkr().getId(), fkrDao);
	}

	public BeanModel<KmFkrStatusChange> getFkrChangesModel() {
		BeanModel<KmFkrStatusChange> fkrModel = beanModelSource.createDisplayModel(KmFkrStatusChange.class, getMessages());
		for (String prop : fkrModel.getPropertyNames()) {
			fkrModel.get(prop).sortable(false);
		}
		return fkrModel;
	}

	StreamResponse onActionFromStreamDoc(String docID, String fileName) {
		// System.out.println("onActionFromStreamPDF docID=" + docID + " fileName=" + fileName);
		// return StreamResponseFactory.getAttachment(dictionaryDao.getDocData(docID), fileName);
		return StreamResponseFactory.getAttachment(dictionaryDao.getDocAsStream(docID), fileName);
	}

}
