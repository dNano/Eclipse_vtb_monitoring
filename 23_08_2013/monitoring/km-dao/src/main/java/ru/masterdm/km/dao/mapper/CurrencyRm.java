package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.Currency;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * 
 * @author Alexey Chalov
 */
public class CurrencyRm extends BaseRm<Currency> {

    public CurrencyRm() {
        super("C_");
    }

    @Override
    protected Currency map(ResultSetWrapper rsw) throws SQLException {
        Currency c = new Currency();
        c.setId(rsw.getString(getAliasPrefix() + "CODE"));
        return c;
    }

}
