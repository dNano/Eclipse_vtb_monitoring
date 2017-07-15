/**
 * 
 */
package ru.masterdm.km.common.entity;

/**
 * Тип ФКР.
 * 
 * @author Shafigullin Ildar
 * 
 */
@SuppressWarnings("serial")
public class FkrType extends BaseNamedEntity<Long> {
	private FkrGroup group;
	private Long kind;
	private boolean significant;

	public FkrGroup getGroup() {
		return group;
	}

	public void setGroup(FkrGroup group) {
		this.group = group;
	}

	public Long getKind() {
		return kind;
	}

	public void setKind(Long kind) {
		this.kind = kind;
	}

	public boolean isFkrKind() {
		if (kind != null) {
			return kind.intValue() == 0;// TODO
		} else {
			return false;
		}
	}

	public boolean isSignificant() {
		return significant;
	}

	public void setSignificant(boolean significant) {
		this.significant = significant;
	}
}
