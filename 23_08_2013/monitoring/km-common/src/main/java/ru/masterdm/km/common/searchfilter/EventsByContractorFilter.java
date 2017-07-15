package ru.masterdm.km.common.searchfilter;

import java.util.List;

import ru.masterdm.km.common.entity.ContractorGroup;

/**
 * Фильтр-поиск списка клиентов.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class EventsByContractorFilter {
	public final String[] STATUSES = { "Все ФКР", "Существенные ФКР", "Несущественные ФКР", "Просроченные КМ" };
	private List<String> selectedStatuses;
	private ContractorGroup contractorGroup;
	private String contractorName;
	private String contractorINN;
	private String contractorNumber;

	public ContractorGroup getContractorGroup() {
		return contractorGroup;
	}

	public void setContractorGroup(ContractorGroup contractorGroup) {
		this.contractorGroup = contractorGroup;
	}

	public String getContractorName() {
		return contractorName;
	}

	public void setContractorName(String contractorName) {
		this.contractorName = contractorName;
	}

	public String getContractorINN() {
		return contractorINN;
	}

	public void setContractorINN(String contractorINN) {
		this.contractorINN = contractorINN;
	}

	public String getContractorNumber() {
		return contractorNumber;
	}

	public void setContractorNumber(String contractorNumber) {
		this.contractorNumber = contractorNumber;
	}

	public List<String> getSelectedStatuses() {
		return selectedStatuses;
	}

	public void setSelectedStatuses(List<String> selectedStatuses) {
		this.selectedStatuses = selectedStatuses;
	}
}
