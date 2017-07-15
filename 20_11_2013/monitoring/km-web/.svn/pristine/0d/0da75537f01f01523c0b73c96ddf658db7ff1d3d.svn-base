package ru.masterdm.km.web.base.event;

import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.IN_JOB;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.WAIT_PROCESSING;
import static ru.masterdm.km.common.util.DataTypeUtil.isEmpty;

import java.util.Collections;
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
import org.apache.tapestry5.corelib.components.Zone;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;
import org.apache.tapestry5.upload.services.UploadedFile;

import ru.masterdm.km.common.dictionary.EventSanctionDictionary;
import ru.masterdm.km.common.entity.DocumentGroup;
import ru.masterdm.km.common.entity.DocumentType;
import ru.masterdm.km.common.entity.EventResult;
import ru.masterdm.km.common.entity.KmConfirmationType;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmEventStatus;
import ru.masterdm.km.common.entity.KmSourceDoc;
import ru.masterdm.km.common.entity.PunitiveMeasure;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.dao.EventDao;
import ru.masterdm.km.web.base.SimpleBasePage;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;
import ru.masterdm.km.web.util.ExecuteEventUtil;

/**
 * Общая функциональность для карточки контрольных мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ExecuteEventBasePage extends SimpleBasePage {
	@Persist
	@Property
	protected KmEventInstance event;
	@Persist
	@Property
	private boolean showRepeatType;
	@Persist
	@Property
	private boolean showExecution;
	@Persist
	@Property
	private boolean showResult;
	@Persist
	@Property
	private boolean showChronology;

	private List<KmConfirmationType> confirmationTypes;
	private List<DocumentGroup> documentGroups;
	private List<EventResult> eventResults;
	private List<KmSourceDoc> sourceDocs;
	private List<PunitiveMeasure> punitiveMeasures;

	@Persist
	private List<DocumentType> documentTypes;

	@Inject
	protected EventDao eventDao;
	@Inject
	protected DictionaryDao dictionaryDao;
	@Inject
	private AjaxResponseRenderer ajaxResponseRenderer;
	@Inject
	private SelectModelFactory selectModelFactory;

	@Environmental
	private ValidationTracker validationTracker;

	@InjectComponent
	private Zone repeatTypeZone;
	@InjectComponent
	private Zone executionZone;
	@InjectComponent
	private Zone buttonZone;
	@InjectComponent
	private Zone documentZone;
	@InjectComponent
	private Zone resultZone;
	@InjectComponent
	private Zone chronologyZone;
	@InjectComponent
	private Zone punitiveMeasureZone;

	@Property
	private UploadedFile confirmFile;
	@Property
	private String confirmFileId;

	protected Action action;

	protected enum Action {
		EXECUTE_EVENT, CANCEL, SAVE_EVENT, ADD_FKR;
	}

	protected void init(long eventID) {
		event = eventDao.getEventForExecute(eventID);
		documentTypes = null;
		showResult = true;
	}

	protected void saveEvent() {
		setStatusOnSaveEvent();
		if (confirmFile != null) {
			ExecuteEventUtil.initConfirmFile(event, confirmFile);
		}
		eventDao.saveEventInstance(event);
	}

	private void setStatusOnSaveEvent() {
		KmEventStatus status = event.getStatus();
		if (status != null && status.getId() != null && status.getId().intValue() == WAIT_PROCESSING.getId()) {
			status.setId(IN_JOB.getId());
		}
	}

	protected void validateOnExecuteEvent() {
		if (showResult && event.getResult() != null) {
			if (event.getResult().isCommentMandatory() && isEmpty(event.getResultNote())) {
				validationTracker.recordError(getMessages().get("comment-required-message"));
			}
			if (event.getResult().isSanction()) {
				validateSanction();
			}
			if (event.getResult().isProcessCRF()) {
				// KmFkr kmFkr = event.getFkr();TODO
				// if (kmFkr == null || kmFkr.getType() == null || kmFkr.getType().getId() == null) {
				// validationTracker.recordError(getMessages().get("crf-required-message"));
				// }
			}
		}
	}

	private void validateSanction() {
		if (event.getPunitiveMeasure() == null || event.getPunitiveMeasure().getId() == null) {
			validationTracker.recordError(getMessages().get("punitiveMeasure-required-message"));
		}
		if (isEmpty(event.getPunitiveMeasureDescr())) {
			validationTracker.recordError(getMessages().get("punitiveMeasureDescr-required-message"));
		}
		if (event.getIsSanction() == null) {
			validationTracker.recordError(getMessages().get("sanction-required-message"));
		} else {
			if (event.getIsSanction().intValue() == EventSanctionDictionary.APPLY_SANCTION.getId()) {
				if (event.getSanctionDate() == null || event.getSanctionValue() == null || isEmpty(event.getSanctionCurrency())) {
					validationTracker.recordError(getMessages().get("sanction-apply-required-message"));
				}
			} else if (event.getIsSanction().intValue() == EventSanctionDictionary.REVOKE_SANCTION.getId()) {
				if (event.getSanctionRefusedDate() == null || isEmpty(event.getSanctionRefusedDocNum()) || isEmpty(event.getSanctionRefusedBy())) {
					validationTracker.recordError(getMessages().get("sanction-revoke-required-message"));
				}
			}
		}
	}

	protected void validateOnSaveEvent() {
		// System.out.println("event=" + event);// TODO
	}

	protected void executeEvent() {
		setStatusOnExecuteEvent();
		if (confirmFile != null) {
			ExecuteEventUtil.initConfirmFile(event, confirmFile);
		}
		eventDao.executeEventInstance(event);
	}

	private void setStatusOnExecuteEvent() {
		if (event.getResult() != null) {
			event.setStatus(event.getResult().getEventStatus());
		} else {
			event.getStatus().setId(IN_JOB.getId());
		}
	}

	public String getRepeatTypeInfo() {
		return ExecuteEventUtil.getRepeatTypeInfo(event.getEvent(), getDateViewFormat());
	}

	void onToggleRepeatType() {
		showRepeatType = !showRepeatType;
		ajaxResponseRenderer.addRender(repeatTypeZone);
	}

	void onToggleExecution() {
		showExecution = !showExecution;
		ajaxResponseRenderer.addRender(executionZone).addRender(buttonZone);
	}

	void onToggleResult() {
		showResult = !showResult;
		ajaxResponseRenderer.addRender(resultZone).addRender(buttonZone);
	}

	void onToggleChronology() {
		showChronology = !showChronology;
		ajaxResponseRenderer.addRender(chronologyZone);
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "eventDocumentGroup")
	void selectEventDocumentGroup(DocumentGroup docGroup) {
		event.setDocumentGroup(docGroup);
		selectEventDocumentType(null);
		documentTypes = null;
		ajaxResponseRenderer.addRender(documentZone);
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "eventDocumentType")
	void selectEventDocumentType(DocumentType docType) {
		event.setDocumentType(docType);
		ajaxResponseRenderer.addRender(resultZone);
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "punitiveMeasureResult")
	void selectPunitiveMeasure(PunitiveMeasure punitiveMeasure) {
		// event.setPunitiveMeasure(punitiveMeasure);
		String sumDesc = (punitiveMeasure != null) ? punitiveMeasure.getSumDesc() : "";
		event.setPunitiveMeasureDescr(sumDesc);
		ajaxResponseRenderer.addRender(punitiveMeasureZone);
	}

	@OnEvent(value = EventConstants.VALUE_CHANGED, component = "eventResult")
	void selectEventResult(EventResult eventResult) {
		event.setResult(eventResult);
		ajaxResponseRenderer.addRender(resultZone);
	}

	public boolean isShowExecuteButton() {
		return showResult;
	}

	public boolean isShowSaveButton() {
		return showResult || showExecution;
	}

	private List<KmConfirmationType> getConfirmationTypes() {
		if (confirmationTypes == null) {
			confirmationTypes = dictionaryDao.getKmConfirmationTypes();
		}
		return confirmationTypes;
	}

	public SelectModel getConfirmationTypeSelectModel() {
		return selectModelFactory.create(getConfirmationTypes(), "name");
	}

	public ValueEncoder<KmConfirmationType> getConfirmationTypeValueEncoder() {
		return new BaseEntityValueEncoder<KmConfirmationType>(getConfirmationTypes());
	}

	private List<DocumentGroup> getDocumentGroups() {
		if (documentGroups == null) {
			documentGroups = dictionaryDao.getDocumentGroups();
		}
		return documentGroups;
	}

	public SelectModel getDocumentGroupSelectModel() {
		return selectModelFactory.create(getDocumentGroups(), "name");
	}

	public ValueEncoder<DocumentGroup> getDocumentGroupValueEncoder() {
		return new BaseEntityValueEncoder<DocumentGroup>(getDocumentGroups());
	}

	private List<DocumentType> getDocumentTypes() {
		if (documentTypes == null && event.getDocumentGroup() != null) {
			documentTypes = dictionaryDao.getDocumentTypes(event.getDocumentGroup().getId());
		}
		return documentTypes;
	}

	public SelectModel getDocumentTypeSelectModel() {
		return selectModelFactory.create(getDocumentTypes() != null ? getDocumentTypes() : Collections.emptyList(), "name");
	}

	public ValueEncoder<DocumentType> getDocumentTypeValueEncoder() {
		return new BaseEntityValueEncoder<DocumentType>(getDocumentTypes());
	}

	private List<EventResult> getEventResults() {
		if (eventResults == null) {
			eventResults = eventDao.getEventResults();
		}
		return eventResults;
	}

	public SelectModel getEventResultSelectModel() {
		return selectModelFactory.create(getEventResults(), "name");
	}

	public ValueEncoder<EventResult> getEventResultValueEncoder() {
		return new BaseEntityValueEncoder<EventResult>(getEventResults());
	}

	private List<KmSourceDoc> getSourceDocs() {
		if (sourceDocs == null) {
			sourceDocs = dictionaryDao.getKmSourceDocs();
		}
		return sourceDocs;
	}

	public SelectModel getSourceDocSelectModel() {
		return selectModelFactory.create(getSourceDocs(), "name");
	}

	public ValueEncoder<KmSourceDoc> getSourceDocValueEncoder() {
		return new BaseEntityValueEncoder<KmSourceDoc>(getSourceDocs());
	}

	private List<PunitiveMeasure> getPunitiveMeasures() {
		if (punitiveMeasures == null && event != null) {
			Long idEventType = event.getEvent().getEventType().getId();
			punitiveMeasures = eventDao.getPunitiveMeasures(idEventType);
		}
		return punitiveMeasures;
	}

	public SelectModel getPunitiveMeasureSelectModel() {
		return selectModelFactory.create(getPunitiveMeasures(), "name");
	}

	public ValueEncoder<PunitiveMeasure> getPunitiveMeasureValueEncoder() {
		return new BaseEntityValueEncoder<PunitiveMeasure>(getPunitiveMeasures());
	}

	public List<String> getSanctionCurrencyModel() {
		return dictionaryDao.getSanctionCurrencies();
	}

}
