package ru.masterdm.km.common.entity;

import java.util.Date;

/**
 * Хронология исполнения мероприятия bean.
 * 
 * @author Shafigullin Ildar
 * 
 */
@SuppressWarnings("serial")
public class KmEventChronology extends BaseNamedEntity<Long> {
	private KmEventStatus status;
	private EventResult result;
	private User executor;
	private Date planExecutionDate;
	private Date executedDate;

	public EventResult getResult() {
		return result;
	}

	public void setResult(EventResult result) {
		this.result = result;
	}

	public Date getPlanExecutionDate() {
		return planExecutionDate;
	}

	public void setPlanExecutionDate(Date planExecutionDate) {
		this.planExecutionDate = planExecutionDate;
	}

	public Date getExecutedDate() {
		return executedDate;
	}

	public void setExecutedDate(Date executedDate) {
		this.executedDate = executedDate;
	}

	public KmEventStatus getStatus() {
		return status;
	}

	public void setStatus(KmEventStatus status) {
		this.status = status;
	}

	public User getExecutor() {
		return executor;
	}

	public void setExecutor(User executor) {
		this.executor = executor;
	}
}
