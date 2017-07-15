package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventInstanceStatus;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Michael Kuznetsov
 */
public class KmEventInstanceStatusRm extends BaseRm<KmEventInstanceStatus> {

    public KmEventInstanceStatusRm() {
        super("EIS_");
    }

    @Override
    protected KmEventInstanceStatus map(ResultSetWrapper rsw) throws SQLException {
    	KmEventInstanceStatus c = new KmEventInstanceStatus();
        c.setId(rsw.getLong(getAliasPrefix() + "ID"));
        c.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return c;
    }

}
