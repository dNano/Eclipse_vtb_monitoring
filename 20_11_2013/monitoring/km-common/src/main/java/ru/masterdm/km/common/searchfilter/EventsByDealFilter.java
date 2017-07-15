package ru.masterdm.km.common.searchfilter;

import java.util.Date;
import java.util.List;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.common.entity.Currency;
import ru.masterdm.km.common.entity.DealType;
import ru.masterdm.km.common.entity.User;

/**
 * Фильтр-поиск списка сделок.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class EventsByDealFilter {
	public final String[] STATUSES = { "Все ФКР", "Существенные ФКР", "Несущественные ФКР", "Просроченные КМ" };

	private Date dateFrom;
	private Date dateTo;
	private Long amountFrom;
	private Long amountTo;
	private Currency currency;
	private String spkpNumber;
	private DealType dealType;
	private String contractNumber;
	private Contractor contractor;
	private User executor;
	private ContractorGroup contractorGroup;
	private List<String> selectedStatuses;

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

	public Long getAmountFrom() {
		return amountFrom;
	}

	public void setAmountFrom(Long amountFrom) {
		this.amountFrom = amountFrom;
	}

	public Long getAmountTo() {
		return amountTo;
	}

	public void setAmountTo(Long amountTo) {
		this.amountTo = amountTo;
	}

	public Currency getCurrency() {
		return currency;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	public String getSpkpNumber() {
		return spkpNumber;
	}

	public void setSpkpNumber(String spkpNumber) {
		this.spkpNumber = spkpNumber;
	}

	public DealType getDealType() {
		return dealType;
	}

	public void setDealType(DealType dealType) {
		this.dealType = dealType;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
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

	public List<String> getSelectedStatuses() {
		return selectedStatuses;
	}

	public void setSelectedStatuses(List<String> selectedStatuses) {
		this.selectedStatuses = selectedStatuses;
	}
}
