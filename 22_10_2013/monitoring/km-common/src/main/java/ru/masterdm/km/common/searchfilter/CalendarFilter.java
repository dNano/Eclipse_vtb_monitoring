package ru.masterdm.km.common.searchfilter;

import java.util.Date;

/**
 * Фильтр-поиск списка календарных мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class CalendarFilter {
	private Date dateFrom;
	private Date dateTo;
    private Date execDateFrom;
    private Date execDateTo;

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public Date getExecDateFrom() {
		return execDateFrom;
	}

	public void setExecDateFrom(Date execDateFrom) {
		this.execDateFrom = execDateFrom;
	}

	public Date getExecDateTo() {
		return execDateTo;
	}

	public void setExecDateTo(Date execDateTo) {
		this.execDateTo = execDateTo;
	}
}
