package ru.masterdm.km.web.components.event;

import static ru.masterdm.km.common.dictionary.EventResultDictionary.FKR;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.OK;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.REMARK;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.SANCTION;
import static ru.masterdm.km.common.dictionary.EventResultDictionary.SANCTION_FKR;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.IN_JOB;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.SUSPEND;
import static ru.masterdm.km.common.dictionary.KmEventStatusDictionary.WAIT_PROCESSING;

import org.apache.tapestry5.annotations.Parameter;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.ioc.Messages;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;

import ru.masterdm.km.common.dictionary.EventResultDictionary;
import ru.masterdm.km.common.dictionary.KmEventStatusDictionary;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.dao.DealDao;
import ru.masterdm.km.web.model.event.EventsForDealDataSource;

/**
 * Список календарных мероприятий для сделки.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class KmEventListForDeal {
	@Parameter(required = true)
	@Property
	private long dealID;
	@Parameter(required = true)
	@Property
	private String dateListPattern;
	@Parameter(required = true)
	@Property
	private String returnPageName;

	@Property
	private KmEventInstance eventForDeal;

	@Inject
	private DealDao dealDao;
	@Inject
	private Messages messages;
	@Inject
	private BeanModelSource beanModelSource;

	public GridDataSource getEventsForDeal() {
		return new EventsForDealDataSource(dealDao, dealID);
	}

	public BeanModel<KmEventInstance> getEventsForDealModel() {
		BeanModel<KmEventInstance> eventModel = beanModelSource.createDisplayModel(KmEventInstance.class, messages);
		for (String prop : eventModel.getPropertyNames()) {
			eventModel.get(prop).sortable(false);
		}
		return eventModel;
	}

	public boolean isOkResult() {
		return isEventResult(OK, eventForDeal);
	}

	public boolean isSanctionOrRemarkResult() {
		return isEventResult(SANCTION, eventForDeal) || isEventResult(REMARK, eventForDeal);
	}

	public boolean isFkrResult() {
		return isEventResult(FKR, eventForDeal) || isEventResult(SANCTION_FKR, eventForDeal);
	}

	public boolean isSanctionResult() {
		return isEventResult(SANCTION, eventForDeal) || isEventResult(SANCTION_FKR, eventForDeal);
	}

	private boolean isEventResult(EventResultDictionary dict, KmEventInstance kmEventInstance) {
		Long result = kmEventInstance.getResult().getId();
		return (result != null && result.intValue() == dict.getId()) ? true : false;
	}

	public String getEventForDealRowClass() {
		return isFkrResult() ? "FKR" : "";
	}

	public boolean isCanExecuted() {
		return isEventStatus(WAIT_PROCESSING) || isEventStatus(IN_JOB) || isEventStatus(SUSPEND);
	}

	private boolean isEventStatus(KmEventStatusDictionary dict) {
		Long status = eventForDeal.getStatus().getId();
		return (status != null && status.intValue() == dict.getId()) ? true : false;
	}
}
