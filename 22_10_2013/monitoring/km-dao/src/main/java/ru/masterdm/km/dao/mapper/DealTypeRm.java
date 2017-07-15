package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.DealType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Michael Kuznetsov
 */
public class DealTypeRm extends BaseRm<DealType> {

    public DealTypeRm() {
        super("DT_");
    }

    @Override
    protected DealType map(ResultSetWrapper rsw) throws SQLException {
    	DealType c = new DealType();
        c.setId(rsw.getString(getAliasPrefix() + "ID"));
        c.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return c;
    }
}
