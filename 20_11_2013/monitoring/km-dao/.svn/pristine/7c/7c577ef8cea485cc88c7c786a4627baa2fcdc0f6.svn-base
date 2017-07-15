package ru.masterdm.km.dao;

import java.io.InputStream;
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
import ru.masterdm.km.util.ValueWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public interface DictionaryDao {

	List<MonitoredObjectType> getMonitoredObjectTypes();

	List<KmEventTypeGroup> getEventTypeGroups(Long monitoredObjectTypeId);

	List<KmEventType> getKmEventTypes(Long kmEventTypeGroupId);

	List<ContractorType> getContractorTypes();

	int getUserCount(String lastNamePattern);

	List<User> getUsers(int startIndex, int amount, String lastNamePattern);

	User getUser(Long id);

	List<KmEventInstanceStatus> getInstanceStatuses();

	List<KmEventInstanceStatus> getInstanceStatusesForDeal();

	List<Currency> getCurrencies();

	List<DealType> getDealTypes();

	int getContractorCount(String namePattern);

	List<Contractor> getContractors(int startIndex, int amount, String namePattern);

	Contractor getContractor(String id);

	int getContractorGroupCount(String namePattern);

	List<ContractorGroup> getContractorGroups(int startIndex, int amount, String namePattern);

	ContractorGroup getContractorGroup(String id);

	List<KmRepeatType> getKmRepeatTypes();

	List<DayOfWeek> getDaysOfWeek();

	List<Month> getMonths();

	void initClassifierTree(ValueWrapper rootNode);

	List<KmConfirmationType> getKmConfirmationTypes();

	List<DocumentGroup> getDocumentGroups();

	List<DocumentType> getDocumentTypes(Long groupID);

	List<FkrGroup> getFkrGroups();

	List<FkrType> getFkrTypes(Long groupID);

	List<KmSourceDoc> getKmSourceDocs();

	List<PunitiveMeasure> getPunitiveMeasures();

	List<String> getSanctionCurrencies();

	List<KmFkrStatus> getFkrStatuses();

	InputStream getDocAsStream(String docID);
	
	InputStream getDocData(String docID);
}
