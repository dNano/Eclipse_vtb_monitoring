package ru.masterdm.km.util;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/**
 * 
 * @author Alexey Chalov
 */
public abstract class AbstractRowMapper<T> implements RowMapper<T> {

    @Override
    public T mapRow(ResultSet rs, int rowNum) throws SQLException {
        return map(new ResultSetWrapper(rs));
    }

    protected abstract T map(ResultSetWrapper rsw) throws SQLException;
}
