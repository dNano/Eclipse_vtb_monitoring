package ru.masterdm.km.dao;

import java.util.List;

import ru.masterdm.km.common.entity.KmEventChronology;
import ru.masterdm.km.common.entity.EventResult;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.PunitiveMeasure;
import ru.masterdm.km.common.searchfilter.EventsByDateFilter;
import ru.masterdm.km.util.query.SortCriterion;

/**
 * 
 * @author Alexey Chalov
 */
public interface EventDao {

    int getInstanceCount(EventsByDateFilter filter);

    List<KmEventInstance> getInstances(int startIndex, int amount, EventsByDateFilter filter, List<SortCriterion> sortCriteria);

	KmEventInstance getEventForExecute(long eventID);

	List<EventResult> getEventResults();

	void removeEventInstance(long eventInstanceID);

	void saveEventInstance(KmEventInstance event);

	void executeEventInstance(KmEventInstance event);

	List<KmEventChronology> getEventChronology(int startIndex, int i, long eventID);

	int getEventChronologyCount(long eventID);

	KmEventInstance getEventInstance(long eventID);

	List<PunitiveMeasure> getPunitiveMeasures(long idEventType);
}
