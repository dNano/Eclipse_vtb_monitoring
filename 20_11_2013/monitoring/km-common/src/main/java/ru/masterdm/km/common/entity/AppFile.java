package ru.masterdm.km.common.entity;

import java.util.Date;

/**
 * Файл документа.
 * 
 * @author Shafigullin Ildar
 * 
 */
@SuppressWarnings("serial")
public class AppFile extends BaseNamedEntity<String> {
	private byte[] data;
	private String type;
	private Long ownerType;
	private String ownerID;
	private User whoAdd;
	private Date dateOfAdd;
	private String mimeType;
	private DocumentGroup docGroup;
	private DocumentType docType;

	public Long getOwnerType() {
		return ownerType;
	}

	public void setOwnerType(Long ownerType) {
		this.ownerType = ownerType;
	}

	public String getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(String ownerID) {
		this.ownerID = ownerID;
	}

	public User getWhoAdd() {
		return whoAdd;
	}

	public void setWhoAdd(User whoAdd) {
		this.whoAdd = whoAdd;
	}

	public Date getDateOfAdd() {
		return dateOfAdd;
	}

	public void setDateOfAdd(Date dateOfAdd) {
		this.dateOfAdd = dateOfAdd;
	}


	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public DocumentGroup getDocGroup() {
		return docGroup;
	}

	public void setDocGroup(DocumentGroup docGroup) {
		this.docGroup = docGroup;
	}

	public DocumentType getDocType() {
		return docType;
	}

	public void setDocType(DocumentType docType) {
		this.docType = docType;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
