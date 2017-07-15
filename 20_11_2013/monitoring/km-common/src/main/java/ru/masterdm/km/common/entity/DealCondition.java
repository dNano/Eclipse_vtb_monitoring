package ru.masterdm.km.common.entity;

/**
 * Условия по сделке.
 * 
 * @author Shafigullin Ildar
 * 
 */
@SuppressWarnings("serial")
public class DealCondition extends BaseNamedEntity<Long> {
	private ConditionType type;

	public ConditionType getType() {
		return type;
	}

	public void setType(ConditionType type) {
		this.type = type;
	}
}
