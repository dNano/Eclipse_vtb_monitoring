package ru.masterdm.km.dao.mapper;

import ru.masterdm.km.util.AbstractRowMapper;

/**
 * 
 * @author Alexey Chalov
 */
public abstract class BaseRm<T> extends AbstractRowMapper<T> {

    private String aliasPrefix;

    BaseRm() {
        throw new RuntimeException("No default alias prefix configured.");
    }

    BaseRm(String aliasPrefix) {
        this.aliasPrefix = aliasPrefix;
    }

    public String getAliasPrefix() {
        return aliasPrefix;
    }
}
