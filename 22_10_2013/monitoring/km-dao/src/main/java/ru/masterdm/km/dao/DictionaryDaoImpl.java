package ru.masterdm.km.dao;

import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_BY_ID;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_BY_NAME;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_BY_NAME_COUNT;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_GROUPS_BY_NAME;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_GROUPS_BY_NAME_COUNT;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_GROUP_BY_ID;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CONTRACTOR_TYPES;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.CURRENCIES;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.DEAL_TYPES;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.EVENT_INSTANCE_STATUSES;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.EVENT_TYPES;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.EVENT_TYPE_GROUPS;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.MONITORED_OBJECT_TYPES;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.USERS_BY_LAST_NAME;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.USERS_BY_LAST_NAME_PATTERN_COUNT;
import static ru.masterdm.km.dao.DictionaryDaoSqlKey.USER_BY_ID;

import java.util.Collections;
import java.util.List;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.common.entity.ContractorType;
import ru.masterdm.km.common.entity.Currency;
import ru.masterdm.km.common.entity.DayOfWeek;
import ru.masterdm.km.common.entity.DealType;
import ru.masterdm.km.common.entity.DocumentGroup;
import ru.masterdm.km.common.entity.DocumentType;
import ru.masterdm.km.common.entity.FkrGroup;
import ru.masterdm.km.common.entity.FkrType;
import ru.masterdm.km.common.entity.KmClassifier;
import ru.masterdm.km.common.entity.KmConfirmationType;
import ru.masterdm.km.common.entity.KmEventInstanceStatus;
import ru.masterdm.km.common.entity.KmEventType;
import ru.masterdm.km.common.entity.KmEventTypeGroup;
import ru.masterdm.km.common.entity.KmFkrStatus;
import ru.masterdm.km.common.entity.KmRepeatType;
import ru.masterdm.km.common.entity.KmSourceDoc;
import ru.masterdm.km.common.entity.MonitoredObjectType;
import ru.masterdm.km.common.entity.Month;
import ru.masterdm.km.common.entity.PunitiveMeasure;
import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.dao.mapper.ContractorGroupRm;
import ru.masterdm.km.dao.mapper.ContractorRm;
import ru.masterdm.km.dao.mapper.ContractorTypeRm;
import ru.masterdm.km.dao.mapper.CurrencyRm;
import ru.masterdm.km.dao.mapper.DayOfWeekRm;
import ru.masterdm.km.dao.mapper.DealTypeRm;
import ru.masterdm.km.dao.mapper.DocumentGroupRm;
import ru.masterdm.km.dao.mapper.DocumentTypeRm;
import ru.masterdm.km.dao.mapper.FkrGroupRm;
import ru.masterdm.km.dao.mapper.FkrTypeRm;
import ru.masterdm.km.dao.mapper.KmClassifiersRm;
import ru.masterdm.km.dao.mapper.KmConfirmationTypeRm;
import ru.masterdm.km.dao.mapper.KmEventInstanceStatusRm;
import ru.masterdm.km.dao.mapper.KmEventTypeGroupRm;
import ru.masterdm.km.dao.mapper.KmEventTypeRm;
import ru.masterdm.km.dao.mapper.KmFkrStatusRm;
import ru.masterdm.km.dao.mapper.KmRepeatTypeRm;
import ru.masterdm.km.dao.mapper.KmSourceDocRm;
import ru.masterdm.km.dao.mapper.MonitoredObjectTypeRm;
import ru.masterdm.km.dao.mapper.MonthRm;
import ru.masterdm.km.dao.mapper.PunitiveMeasureRm;
import ru.masterdm.km.dao.mapper.UserRm;
import ru.masterdm.km.util.BaseJdbcDao;
import ru.masterdm.km.util.ClassifierValueWrapper;
import ru.masterdm.km.util.ValueWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class DictionaryDaoImpl extends BaseJdbcDao<DictionaryDaoSqlKey> implements DictionaryDao {
	private List<Currency> currencies;
	private List<DealType> dealTypes;
	private List<KmEventInstanceStatus> kmEventStatuses;
	private List<FkrGroup> fkrGroups;
	private List<KmFkrStatus> fkrStatuses;
	private List<KmRepeatType> kmRepeatTypes;
	private List<DayOfWeek> daysOfWeek;
	private List<Month> months;
	private List<KmConfirmationType> confirmationTypes;
	private List<DocumentGroup> documentGroups;
	private List<KmSourceDoc> sourceDocs;
	private List<PunitiveMeasure> punitiveMeasures;
	private List<String> sanctionCurrencies;

	@Override
	public List<MonitoredObjectType> getMonitoredObjectTypes() {
		return queryForList(sql.getValue(MONITORED_OBJECT_TYPES), new MonitoredObjectTypeRm(), "Error selecting monitored object types.");
	}

	@Override
	public List<KmEventTypeGroup> getEventTypeGroups(Long monitoredObjectTypeId) {
		return queryForList(sql.getValue(EVENT_TYPE_GROUPS), new KmEventTypeGroupRm(), "Error selecting event type groups.", monitoredObjectTypeId);
	}

	@Override
	public List<KmEventType> getKmEventTypes(Long kmEventTypeGroupId) {
		return queryForList(sql.getValue(EVENT_TYPES), new KmEventTypeRm(), "Error selecting event types.", kmEventTypeGroupId);
	}

	@Override
	public List<ContractorType> getContractorTypes() {
		return queryForList(sql.getValue(CONTRACTOR_TYPES), new ContractorTypeRm(), "Error selecting contractor types.");
	}

	@Override
	public int getUserCount(String lastNamePattern) {
		if (isEmpty(lastNamePattern)) {
			return 0;
		}
		return queryForInt(sql.getValue(USERS_BY_LAST_NAME_PATTERN_COUNT), "Error selecting user count.", lastNamePattern.trim() + "%");
	}

	@Override
	public List<User> getUsers(int startIndex, int amount, String lastNamePattern) {
		if (isEmpty(lastNamePattern)) {
			return Collections.emptyList();
		}
		return queryForList(sql.getValue(USERS_BY_LAST_NAME), new UserRm(), "Error selecting users.", lastNamePattern.trim() + "%", startIndex,
				startIndex + amount);
	}

	@Override
	public User getUser(Long id) {
		return queryForObject(sql.getValue(USER_BY_ID), new UserRm(), "Error selecting user.", id);
	}

	@Override
	public List<KmEventInstanceStatus> getInstanceStatuses() {
		if (kmEventStatuses == null) {
			String query = sql.getValue(EVENT_INSTANCE_STATUSES);
			kmEventStatuses = queryForList(query, new KmEventInstanceStatusRm(), "Error selecting kmEvent statuses.");
		}
		return Collections.unmodifiableList(kmEventStatuses);
	}

	@Override
	public List<Currency> getCurrencies() {
		if (currencies == null) {
			currencies = queryForList(sql.getValue(CURRENCIES), new CurrencyRm(), "Error selecting currencies.");
		}
		return Collections.unmodifiableList(currencies);
	}

	@Override
	public List<DealType> getDealTypes() {
		if (dealTypes == null) {
			dealTypes = queryForList(sql.getValue(DEAL_TYPES), new DealTypeRm(), "Error selecting deal types.");
		}
		return Collections.unmodifiableList(dealTypes);
	}

	@Override
	public int getContractorCount(String namePattern) {
		if (isEmpty(namePattern)) {
			return 0;
		}
		return queryForInt(sql.getValue(CONTRACTOR_BY_NAME_COUNT), "Error selecting contractor count.", namePattern.trim() + "%");
	}

	@Override
	public List<Contractor> getContractors(int startIndex, int amount, String namePattern) {
		if (isEmpty(namePattern)) {
			return Collections.emptyList();
		}
		return queryForList(sql.getValue(CONTRACTOR_BY_NAME), new ContractorRm(), "Error selecting contractors.", namePattern.trim() + "%",
				startIndex, startIndex + amount);
	}

	@Override
	public Contractor getContractor(String id) {
		return queryForObject(sql.getValue(CONTRACTOR_BY_ID), new ContractorRm(), "Error selecting contractor.", id);
	}

	@Override
	public int getContractorGroupCount(String namePattern) {
		if (isEmpty(namePattern)) {
			return 0;
		}
		return queryForInt(sql.getValue(CONTRACTOR_GROUPS_BY_NAME_COUNT), "Error selecting contractor group count.", "%" + namePattern.trim() + "%");
	}

	@Override
	public List<ContractorGroup> getContractorGroups(int startIndex, int amount, String namePattern) {
		if (isEmpty(namePattern)) {
			return Collections.emptyList();
		}
		return queryForList(sql.getValue(CONTRACTOR_GROUPS_BY_NAME), new ContractorGroupRm(), "Error selecting contractor groups.",
				"%" + namePattern.trim() + "%", startIndex, startIndex + amount);
	}

	@Override
	public ContractorGroup getContractorGroup(String id) {
		return queryForObject(sql.getValue(CONTRACTOR_GROUP_BY_ID), new ContractorGroupRm(), "Error selecting contractor group.", id);
	}

	@Override
	public List<KmEventInstanceStatus> getInstanceStatusesForDeal() {
		return getInstanceStatuses();
	}

	@Override
	public List<KmRepeatType> getKmRepeatTypes() {
		if (kmRepeatTypes == null) {
			kmRepeatTypes = queryForList(sql.getValue(DictionaryDaoSqlKey.KM_REPEAT_TYPES), new KmRepeatTypeRm(), "Error selecting kmRepeatTypes.");
		}
		return Collections.unmodifiableList(kmRepeatTypes);
	}

	@Override
	public List<DayOfWeek> getDaysOfWeek() {
		if (daysOfWeek == null) {
			daysOfWeek = queryForList(sql.getValue(DictionaryDaoSqlKey.DAY_OF_WEEKS), new DayOfWeekRm(), "Error selecting days of week.");
		}
		return Collections.unmodifiableList(daysOfWeek);
	}

	@Override
	public List<Month> getMonths() {
		if (months == null) {
			months = queryForList(sql.getValue(DictionaryDaoSqlKey.MONTHS), new MonthRm(), "Error selecting months.");
		}
		return Collections.unmodifiableList(months);
	}

	@Override
	public void initClassifierTree(ValueWrapper rootNode) {
		List<KmClassifier> list = getAllClassifiers();
		ClassifierValueWrapper curObjectNode = null;
		ClassifierValueWrapper curGroupNode = null;
		for (KmClassifier kmClass : list) {
			ClassifierValueWrapper curTypeNode = new ClassifierValueWrapper(kmClass.getEventType().getName(), "" + kmClass.getEventType().getId(),
					false, false, true);
			if (curObjectNode == null || !curObjectNode.getLabel().equals(kmClass.getMonitoredObjectType().getName())) {
				curObjectNode = new ClassifierValueWrapper(kmClass.getMonitoredObjectType().getName(), "" + kmClass.getMonitoredObjectType().getId(),
						true, false, false);
				rootNode.addChild(curObjectNode);
			}
			if (curGroupNode == null || !curGroupNode.getLabel().equals(kmClass.getEventTypeGroup().getName())) {
				curGroupNode = new ClassifierValueWrapper(kmClass.getEventTypeGroup().getName(), "" + kmClass.getEventTypeGroup().getId(), false,
						true, false);
				curObjectNode.addChild(curGroupNode);
			}
			curGroupNode.addChild(curTypeNode);
		}
	}

	private List<KmClassifier> getAllClassifiers() {
		String query = sql.getValue(DictionaryDaoSqlKey.ALL_CLASSIFIERS);
		return queryForList(query, new KmClassifiersRm(), "Error selecting classifiers.");
	}

	@Override
	public List<KmConfirmationType> getKmConfirmationTypes() {
		if (confirmationTypes == null) {
			String query = sql.getValue(DictionaryDaoSqlKey.EVENT_CONFIRMATION_TYPES);
			confirmationTypes = queryForList(query, new KmConfirmationTypeRm(), "Error getKmConfirmationTypes.");
		}
		return Collections.unmodifiableList(confirmationTypes);
	}

	@Override
	public List<DocumentGroup> getDocumentGroups() {
		if (documentGroups == null) {
			documentGroups = queryForList(sql.getValue(DictionaryDaoSqlKey.DOCUMENT_GROUPS), new DocumentGroupRm(), "Error getDocumentGroups.");
		}
		return Collections.unmodifiableList(documentGroups);
	}

	@Override
	public List<DocumentType> getDocumentTypes(Long groupID) {
		if (groupID != null) {
			String query = sql.getValue(DictionaryDaoSqlKey.DOCUMENT_TYPES);
			return queryForList(query, new DocumentTypeRm(), "Error getDocumentTypes.", groupID);
		} else {
			return Collections.emptyList();
		}
	}

	@Override
	public List<FkrGroup> getFkrGroups() {
		if (fkrGroups == null) {
			fkrGroups = queryForList(sql.getValue(DictionaryDaoSqlKey.FKR_GROUPS), new FkrGroupRm(), "Error getFkrGroups.");
		}
		return Collections.unmodifiableList(fkrGroups);
	}

	@Override
	public List<FkrType> getFkrTypes(Long groupID) {
		if (groupID != null) {
			String query = sql.getValue(DictionaryDaoSqlKey.FKR_TYPES);
			return queryForList(query, new FkrTypeRm(), "Error getFkrTypes.", groupID);
		} else {
			return Collections.emptyList();
		}
	}

	@Override
	public List<KmSourceDoc> getKmSourceDocs() {
		if (sourceDocs == null) {
			String query = sql.getValue(DictionaryDaoSqlKey.KM_SOURCE_DOC);
			sourceDocs = queryForList(query, new KmSourceDocRm(), "Error selecting event results.");
		}
		return Collections.unmodifiableList(sourceDocs);
	}

	@Override
	public List<PunitiveMeasure> getPunitiveMeasures() {
		if (punitiveMeasures == null) {
			String query = sql.getValue(DictionaryDaoSqlKey.PUNITIVE_MEASURE);
			punitiveMeasures = queryForList(query, new PunitiveMeasureRm(), "Error selecting event results.");
		}
		return Collections.unmodifiableList(punitiveMeasures);
	}

	@Override
	public List<String> getSanctionCurrencies() {
		if (sanctionCurrencies == null) {
			sanctionCurrencies = new java.util.ArrayList<String>();
			sanctionCurrencies.add("%");
			for (Currency currency : getCurrencies()) {
				sanctionCurrencies.add(currency.getId());
			}
		}
		return Collections.unmodifiableList(sanctionCurrencies);
	}

	@Override
	public List<KmFkrStatus> getFkrStatuses() {
		if (fkrStatuses == null) {
			fkrStatuses = queryForList(sql.getValue(DictionaryDaoSqlKey.FKR_STATUSES), new KmFkrStatusRm(), "Error getFkrStatuses.");
		}
		return Collections.unmodifiableList(fkrStatuses);
	}
}
