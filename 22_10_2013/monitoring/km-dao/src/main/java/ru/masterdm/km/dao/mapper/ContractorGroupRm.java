package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.ContractorGroup;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Michael Kuanetsov
 */
public class ContractorGroupRm extends BaseRm<ContractorGroup> {

    public ContractorGroupRm() {
        super("CG_");
    }

    @Override
    protected ContractorGroup map(ResultSetWrapper rsw) throws SQLException {
    	ContractorGroup u = new ContractorGroup();
        u.setId(rsw.getString(getAliasPrefix() + "ID"));
        u.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return u;
    }
}
