package ru.masterdm.km.common.entity;

import java.util.Date;

/**
 * Изменение статуса ФКР.
 * 
 * @author Shafigullin Ildar
 */
@SuppressWarnings("serial")
public class KmFkrStatusChange extends BaseIndexedEntity<Long> {
	private Date accepted;
	private KmFkrStatus status;
	private String notes;
	private String who;
	private String docID;

	public Date getAccepted() {
		return accepted;
	}

	public void setAccepted(Date accepted) {
		this.accepted = accepted;
	}

	public KmFkrStatus getStatus() {
		return status;
	}

	public void setStatus(KmFkrStatus status) {
		this.status = status;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	public String getDocID() {
		return docID;
	}

	public void setDocID(String docID) {
		this.docID = docID;
	}

	public String getFileName() {
		if (docID != null && docID.length() > 36) {
			return docID.substring(36);
		} else
			return "";
	}
}
