/**
 * 
 */
package ru.masterdm.km.util;

/**
 * ValueWrapper для дерева классификатора KM(контрольных мероприятий).
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ClassifierValueWrapper extends ValueWrapper {
	private boolean monitorObject = false;
	private boolean type = false;
	private boolean group = false;

	public ClassifierValueWrapper(String label, String pageName, boolean isMO, boolean isGroup, boolean isType) {
		super(label, pageName);
		setMonitorObject(isMO);
		setGroup(isGroup);
		setType(isType);
	}

	public boolean isMonitorObject() {
		return monitorObject;
	}

	public void setMonitorObject(boolean monitorObject) {
		this.monitorObject = monitorObject;
	}

	public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	public boolean isGroup() {
		return group;
	}

	public void setGroup(boolean group) {
		this.group = group;
	}

}
