package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.MonitoredObjectType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class MonitoredObjectTypeRm extends BaseRm<MonitoredObjectType> {

    public MonitoredObjectTypeRm() {
        super("MO_");
    }

    @Override
    protected MonitoredObjectType map(ResultSetWrapper rsw) throws SQLException {
        MonitoredObjectType mot = new MonitoredObjectType();
        mot.setId(rsw.getLong(getAliasPrefix() + "ID"));
        mot.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return mot;
    }
}
