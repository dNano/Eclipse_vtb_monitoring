package ru.masterdm.km.common.entity;

import java.util.Date;

import ru.masterdm.km.common.dictionary.DealStatus;

/**
 * Сущность Списка сделок.
 * 
 * @author Shafigullin Ildar
 * 
 */
@SuppressWarnings("serial")
public class DealInstance extends BaseIndexedEntity<Long> {
	private DealStatus status;
	private Date date;

	private Deal deal;
	private Contractor contractor;
	private User executor;
	private ContractorGroup contractorGroup;
	private OfficialInfo info;

	public Deal getDeal() {
		return deal;
	}

	public void setDeal(Deal deal) {
		this.deal = deal;
	}

	public Contractor getContractor() {
		return contractor;
	}

	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}

	public User getExecutor() {
		return executor;
	}

	public void setExecutor(User executor) {
		this.executor = executor;
	}

	public ContractorGroup getContractorGroup() {
		return contractorGroup;
	}

	public void setContractorGroup(ContractorGroup contractorGroup) {
		this.contractorGroup = contractorGroup;
	}

	public DealStatus getStatus() {
		return status;
	}

	public void setStatus(DealStatus status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isFkr() {
		return (status != null) ? (status == DealStatus.FKR) : false;
	}
	
	public boolean isExpared() {
		return (status != null) ? (status == DealStatus.EXPARED) : false;
	}

	public OfficialInfo getInfo() {
		return info;
	}

	public void setInfo(OfficialInfo info) {
		this.info = info;
	}
}
