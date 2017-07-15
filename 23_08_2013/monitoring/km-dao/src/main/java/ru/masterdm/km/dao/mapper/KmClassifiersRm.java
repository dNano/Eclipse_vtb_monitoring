package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmClassifier;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Классификатор контрольных мероприятий.
 * 
 * @author Shafgullin Ildar
 * 
 */
public class KmClassifiersRm  extends BaseRm<KmClassifier>{

	public KmClassifiersRm() {
		super("CL_");
	}

	@Override
	protected KmClassifier map(ResultSetWrapper rsw) throws SQLException {
		KmClassifier instanse = new KmClassifier();
		instanse.setMonitoredObjectType(new MonitoredObjectTypeRm().map(rsw));
		instanse.setEventTypeGroup(new KmEventTypeGroupRm().map(rsw));
		instanse.setEventType(new KmEventTypeRm().map(rsw));
		return instanse;
	}

}
