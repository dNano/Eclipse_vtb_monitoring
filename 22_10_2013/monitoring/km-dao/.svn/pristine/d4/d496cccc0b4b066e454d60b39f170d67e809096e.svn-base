package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.PunitiveMeasure;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Санкции за неисполнение.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class PunitiveMeasureRm extends BaseRm<PunitiveMeasure> {

	public PunitiveMeasureRm() {
		super("PM_");
	}

	@Override
	protected PunitiveMeasure map(ResultSetWrapper rsw) throws SQLException {
		PunitiveMeasure measure = new PunitiveMeasure();
		measure.setId(rsw.getLong(getAliasPrefix() + "ID"));
		measure.setName(rsw.getString(getAliasPrefix() + "NAME"));
		measure.setSumDesc(rsw.getString(getAliasPrefix() + "SUM_DESC"));
		return measure;
	}
}
