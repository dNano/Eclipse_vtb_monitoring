package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class KmEventTypeRm extends BaseRm<KmEventType> {

    public KmEventTypeRm() {
        super("ET_");
    }

    @Override
    protected KmEventType map(ResultSetWrapper rsw) throws SQLException {
        KmEventType et = new KmEventType();
        et.setId(rsw.getLong(getAliasPrefix() + "ID"));
        et.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return et;
    }
}
