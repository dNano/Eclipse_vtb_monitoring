package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.ContractorType;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class ContractorTypeRm extends BaseRm<ContractorType> {

    public ContractorTypeRm() {
        super("CT_");
    }

    @Override
    protected ContractorType map(ResultSetWrapper rsw) throws SQLException {
        ContractorType ct = new ContractorType();
        ct.setId(rsw.getLong(getAliasPrefix() + "ID"));
        ct.setName(rsw.getString(getAliasPrefix() + "NAME"));
        return ct;
    }
}
