package ru.masterdm.km.common.entity;

/**
 * Классификатор контрольных мероприятий.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class KmClassifier {
	private MonitoredObjectType monitoredObjectType;
	private KmEventTypeGroup eventTypeGroup;
	private KmEventType eventType;

	public MonitoredObjectType getMonitoredObjectType() {
		return monitoredObjectType;
	}

	public void setMonitoredObjectType(MonitoredObjectType monitoredObjectType) {
		this.monitoredObjectType = monitoredObjectType;
	}

	public KmEventTypeGroup getEventTypeGroup() {
		return eventTypeGroup;
	}

	public void setEventTypeGroup(KmEventTypeGroup eventTypeGroup) {
		this.eventTypeGroup = eventTypeGroup;
	}

	public KmEventType getEventType() {
		return eventType;
	}

	public void setEventType(KmEventType eventType) {
		this.eventType = eventType;
	}
}
