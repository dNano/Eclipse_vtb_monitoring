package ru.masterdm.km.web.base.event;

import java.util.List;
import java.util.Set;

import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.json.JSONObject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;

import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.common.entity.KmEventCalendar;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmFkr;
import ru.masterdm.km.common.searchfilter.CalendarFilter;
import ru.masterdm.km.dao.EventDao;
import ru.masterdm.km.web.base.ClassifierTreeBasePage;

/**
 * база для таб. панель "классификатор-план-календарь" КМ.
 * 
 * @author Shafigullin Ildar
 * 
 */

public abstract class ClassifierBasePage extends ClassifierTreeBasePage {
	public static final int INFO_TAB = 0;
	public static final int PLAN_TAB = 1;
	public static final int CALENDAR_TAB = 2;
	public static final int FKR_TAB = 3;

	@Inject
	protected EventDao eventDao;
	@Inject
	protected BeanModelSource beanModelSource;
	@Inject
	protected AjaxResponseRenderer ajaxResponseRenderer;

	@Persist
	@Property
	protected int curTab;
	@Persist
	@Property
	protected KmEvent filter;
	@Persist
	@Property
	protected CalendarFilter calendarFilter;

	@Property
	protected KmEventCalendar calendar;
	@Property
	protected KmEventInstance eventInstance;
	@Property
	private KmFkr fkrInstance;

	@Persist
	protected long selectedEventTypeID;
	@Persist
	protected Set<Long> arrayPlanForTree;
	@Persist
	protected Set<Long> arrayCalendar;
	@Persist
	protected List<KmEventCalendar> planList;
	@Persist
	protected List<KmEventInstance> calendarList;
	@Persist
	protected List<KmFkr> fkrList;

	private void initFilter() {
		if (filter == null) {
			filter = new KmEvent();
		}
		if (calendarFilter == null) {
			calendarFilter = new CalendarFilter();
		}
	}

	protected void init() {
		clearSelectedRow();
		initFilter();
		if (curTab != FKR_TAB) {
			initPlan();
			initCalendar();
			clearFkrList();
		} else {
			clearPlan();
			cleanCalendar();
			initFkrList();
		}
	}

	protected abstract void initFkrList();

	protected abstract void initPlan();

	protected abstract void initCalendar();

	protected void clearSelectedRow() {
		selectedEventTypeID = -1;
	}

	protected void cleanCalendar() {
		calendarList = null;
	}

	protected void clearPlan() {
		planList = null;
	}

	private void clearFkrList() {
		fkrList = null;
	}

	public JSONObject getOptions() {
		// The available options are documented at http://www.datatables.net/ref
		// JSONObject options = new JSONObject("bJQueryUI", "true", "sDom", "TC<\"clear\">Rlfrtip");
		JSONObject options = new JSONObject("bJQueryUI", "true");
		JSONObject oLanguage = new JSONObject();
		oLanguage.put("sInfoEmpty", getMessages().get("options-sInfoEmpty"));// Отображены записи от 0 до 0 из 0
		oLanguage.put("sLengthMenu", getMessages().get("options-sLengthMenu"));// Отобразить _MENU_ записей
		oLanguage.put("sInfoPostFix", "");
		oLanguage.put("sLoadingRecords", getMessages().get("options-sLoadingRecords"));// Загрузка...
		oLanguage.put("sInfoFiltered", getMessages().get("options-sInfoFiltered"));// (отфильтровано из _MAX_ записей)
		oLanguage.put("sSearch", getMessages().get("options-sSearch"));// Поиск
		oLanguage.put("sEmptyTable", getMessages().get("options-sEmptyTable"));// Таблица не содержит данных
		oLanguage.put("sProcessing", getMessages().get("options-sProcessing"));// Обработка...
		oLanguage.put("sInfo", getMessages().get("options-sInfo"));// Отображены записи от _START_ до _END_ из _TOTAL_
		oLanguage.put("sZeroRecords", getMessages().get("options-sZeroRecords"));// Соответствующие записи не найдены
		JSONObject oPaginate = new JSONObject();
		oPaginate.put("sNext", getMessages().get("options-sNext"));// Следующая
		oPaginate.put("sLast", getMessages().get("options-sLast"));// Последняя
		oPaginate.put("sFirst", getMessages().get("options-sFirst"));// Первая
		oPaginate.put("sPrevious", getMessages().get("options-sPrevious"));// Предыдущая
		oLanguage.put("oPaginate", oPaginate);
		options.put("oLanguage", oLanguage);
		return options;
	}

	public List<KmEventCalendar> getPlanList() {
		if (planList == null) {
			initPlan();
		}
		return planList;
	}

	public List<KmEventInstance> getCalendarList() {
		if (calendarList == null) {
			initCalendar();
		}
		return calendarList;
	}

	public List<KmFkr> getFkrList() {
		if (fkrList == null) {
			initFkrList();
		}
		return fkrList;
	}

	public boolean isSelectedLeaf() {
		if (valueWrapper != null && valueWrapper.isType() && valueWrapper.getPageName().equals("" + selectedEventTypeID)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isRowInCalendar() {
		if (calendar != null && arrayCalendar != null) {
			Long typeId = Long.valueOf(calendar.getId());
			if (arrayCalendar.contains(typeId)) {
				return true;
			}
			return false;
		} else {
			return false;
		}
	}

	public boolean isDisabledLeaf() {
		if (valueWrapper != null && valueWrapper.isType()) {
			Long typeId = Long.valueOf(valueWrapper.getPageName());
			if (arrayPlanForTree.contains(typeId)) {
				return true;
			}
			return false;
		} else {
			return false;
		}
	}

	public boolean isSelectedRowCalendar() {
		if (eventInstance != null && eventInstance.getEvent().getEventType().getId().longValue() == selectedEventTypeID) {
			return true;
		} else {
			return false;
		}
	}

	public boolean isRenderAcceptAllButton() {
		return (arrayPlanForTree != null) && (arrayCalendar != null) && (arrayPlanForTree.size() > arrayCalendar.size());
	}

	public boolean isSelectedRow() {
		if (calendar != null && calendar.getClassifier().getEventType().getId().longValue() == selectedEventTypeID) {
			return true;
		} else {
			return false;
		}
	}

}
