package ru.masterdm.km.dao;

import java.util.List;

import ru.masterdm.km.common.entity.FkrGroup;
import ru.masterdm.km.common.entity.FkrType;
import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.common.entity.KmFkrStatusChange;
import ru.masterdm.km.common.searchfilter.FkrFilter;
import ru.masterdm.km.util.query.SortCriterion;

/**
 * DAO интерфейс для сущности "ФКР"
 * 
 * @author Shafigullin Ildar
 * 
 */
public interface FkrDao {

	List<KmFkrInstance> getInstances(int startIndex, int i, FkrFilter filter, List<SortCriterion> sortCriteria);

	int getInstanceCount(FkrFilter filter);
	
	KmFkrInstance getFkrInstance(long fkrID);

	void saveFkrInstance(KmFkrInstance fkr);

	List<KmFkrStatusChange> getFkrChange(int startIndex, int i, long fkrID);

	int getFkrChangeCount(long fkrID);

	void addFkrInstance(KmFkrInstance fkr);

	List<FkrGroup> getFkrGroupsForEvent(Long idEventType);

	List<FkrType> getFkrTypesForEvent(Long groupID, Long idEventType);

}
