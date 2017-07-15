package ru.masterdm.km.common.entity;

import java.util.List;

/**
 * 
 * @author Alexey Chalov
 */
@SuppressWarnings("serial")
public class Contractor extends BaseNamedEntity<String> {
	private String inn;
	private String number;
	private List<ContractorType> types;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getInn() {
		return inn;
	}

	public void setInn(String inn) {
		this.inn = inn;
	}

	public List<ContractorType> getTypes() {
		return types;
	}

	public void setTypes(List<ContractorType> types) {
		this.types = types;
	}
}
