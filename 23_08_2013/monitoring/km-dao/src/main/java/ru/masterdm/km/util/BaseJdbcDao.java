package ru.masterdm.km.util;

import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import ru.masterdm.km.common.util.DataTypeUtil;

/**
 * 
 * @author Alexey Chalov
 */
public abstract class BaseJdbcDao<K extends Enumerable> implements InitializingBean {

    private JdbcTemplate jdbcTemplate;
    protected StrictMap<K, String> sql;
 
    private static final Logger LOG = LoggerFactory.getLogger(BaseJdbcDao.class);

    protected boolean isEmpty(String param) {
        return DataTypeUtil.isEmpty(param);
    }

    protected <T> List<T> queryForList(String sql, RowMapper<T> rowMapper, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.query(sql, rowMapper, params);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected <T> List<T> queryForList(String sql, Class<T> targetClass, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.queryForList(sql, targetClass, params);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected SqlRowSet queryForRowSet(String sql, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.queryForRowSet(sql, params);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected <T> T queryForObject(String sql, RowMapper<T> rowMapper, String errorMessage, Object... params) {
        return queryForObject(sql, rowMapper, errorMessage, false, null, params);
    }

    protected <T> T queryForObject(String sql, Class<T> targetClass, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.queryForObject(sql, targetClass, params);
        } catch (EmptyResultDataAccessException e) {
            return null;
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected <T> T queryForObject(String sql, RowMapper<T> rowMapper, String errorMessage,
                                   boolean rizeExceptionIfNotFound, String notFoundMessage, Object... params) {
        try {
            return jdbcTemplate.queryForObject(sql, rowMapper, params);
        } catch (EmptyResultDataAccessException e) {
            if (rizeExceptionIfNotFound) {
                throw new RuntimeException(notFoundMessage);
            }
            return null;
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected int queryForInt(String sql, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.queryForInt(sql, params);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected Long queryForLong(String sql, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.queryForLong(sql, params);
        } catch (EmptyResultDataAccessException e) {
            return null;
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected int update(String sql, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.update(sql, params);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected int update2(String sql, String errorMessage, Object... params) {
        try {
            return jdbcTemplate.update(sql, params);
        } catch (DataIntegrityViolationException e) {
            throw new RuntimeException(errorMessage);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected int update(PreparedStatementCreator psc, String errorMessage) {
        try {
            return jdbcTemplate.update(psc);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected int update(PreparedStatementCreator psc, KeyHolder keyHolder, String errorMessage) {
        try {
            return jdbcTemplate.update(psc, keyHolder);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected int[] batchUpdate(String sql, String errorMessage, List<Object[]> batchArgs) {
        try {
            return jdbcTemplate.batchUpdate(sql, batchArgs);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected InputStream queryForInputStream(String sql, String errorMessage, Object... params) {
        return queryForInputStream(sql, errorMessage, null, params);
    }

    protected InputStream queryForInputStream(String sql, String errorMessage,
                                           final LobHandler lobHandler, Object... params) {
        try {
            return jdbcTemplate.queryForObject(sql, new RowMapper<InputStream>() {

                @Override
                public InputStream mapRow(ResultSet rs, int rowNum) throws SQLException {
                    LobHandler tmpLobHandler = lobHandler;
                    if (tmpLobHandler == null) {
                        tmpLobHandler = new DefaultLobHandler();
                    }
                    return tmpLobHandler.getBlobAsBinaryStream(rs, 1);
                }
            }, params);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    protected void execute(String sql, String errorMessage) {
        try {
            jdbcTemplate.execute(sql);
        } catch (DataAccessException e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        } catch (Exception e) {
            LOG.error(errorMessage, e);
            throw new RuntimeException(errorMessage, e);
        }
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        if (jdbcTemplate == null) {
            throw new NullPointerException("JdbcTemplate is null");
        }
        if (sql == null) {
            sql = new StrictMap<K, String>();
        }
        if (!sql.isEmpty()) {
            K firstKey = sql.keySet().iterator().next();
            if (firstKey.getElementCount() != sql.size()) {
                throw new RuntimeException("Sql enumeration names count mismatches sql query map elements count.");
            }
        }
    }

    public void setDataSource(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void setSql(StrictMap<K, String> sql) {
        this.sql = sql;
        sql.lock();    }
}
