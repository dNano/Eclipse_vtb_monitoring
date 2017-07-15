package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Michael Kuanetsov
 */
public class ContractorRm extends BaseRm<Contractor> {

    public ContractorRm() {
        super("CO_");
    }

    @Override
    protected Contractor map(ResultSetWrapper rsw) throws SQLException {
    	Contractor u = new Contractor();
        u.setId(rsw.getString(getAliasPrefix() + "ID"));
        u.setName(rsw.getString(getAliasPrefix() + "NAME"));
        u.setInn(rsw.getString(getAliasPrefix() + "INN"));
        u.setNumber(rsw.getString(getAliasPrefix() + "NUMBER"));
        return u;
    }
}
