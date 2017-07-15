package ru.masterdm.km.util;

import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

/**
 * 
 * @author Alexey Chalov
 */
public class ResultSetWrapper {

    private ResultSet resultSet;

    private Set<String> columnLabels = new TreeSet<String>();

    public ResultSetWrapper(ResultSet resultSet) throws SQLException {
        if (resultSet == null) {
            throw new NullPointerException("ResultSet is null.");
        }
        this.resultSet = resultSet;
        ResultSetMetaData rsmd = this.resultSet.getMetaData();
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            columnLabels.add(rsmd.getColumnLabel(i));
        }
    }

    public Integer getInt(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            int value = resultSet.getInt(columnLabel);
            if (!resultSet.wasNull()) {
                return value;
            }
        }
        return null;
    }

    public Long getLong(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            long value = resultSet.getLong(columnLabel);
            if (!resultSet.wasNull()) {
                return value;
            }
        }
        return null;
    }

    public String getString(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            return resultSet.getString(columnLabel);
        }
        return null;
    }

    public Boolean getBoolean(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            boolean value = resultSet.getBoolean(columnLabel);
            if (!resultSet.wasNull()) {
                return value;
            }
        }
        return null;
    }

    public Double getDouble(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            double value = resultSet.getDouble(columnLabel);
            if (!resultSet.wasNull()) {
                return value;
            }
        }
        return null;
    }

    public Float getFloat(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            float value = resultSet.getFloat(columnLabel);
            if (!resultSet.wasNull()) {
                return value;
            }
        }
        return null;
    }

    public Timestamp getTimestamp(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            return resultSet.getTimestamp(columnLabel);
        }
        return null;
    }

    public Date getDate(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            return resultSet.getDate(columnLabel);
        }
        return null;
    }

    public InputStream getBinaryStream(String columnLabel) throws SQLException {
        if (columnLabels.contains(columnLabel)) {
            return resultSet.getBinaryStream(columnLabel);
        }
        return null;
    }
}
