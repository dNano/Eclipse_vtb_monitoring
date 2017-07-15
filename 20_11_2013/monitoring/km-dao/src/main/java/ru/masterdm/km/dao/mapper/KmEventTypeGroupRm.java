package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventTypeGroup;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class KmEventTypeGroupRm extends BaseRm<KmEventTypeGroup> {

    public KmEventTypeGroupRm() {
        super("ETG_");
    }

    @Override
    protected KmEventTypeGroup map(ResultSetWrapper rsw) throws SQLException {
        KmEventTypeGroup etg = new KmEventTypeGroup();
        etg.setId(rsw.getLong(getAliasPrefix() + "ID"));
        etg.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return etg;
    }
}
