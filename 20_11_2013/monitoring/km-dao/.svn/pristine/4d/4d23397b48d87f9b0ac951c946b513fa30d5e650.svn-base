package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.Contractor;
import ru.masterdm.km.common.entity.KmEventInstance;
import ru.masterdm.km.common.entity.KmFkrInstance;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for списка ФКР.
 * 
 * @author Shafgullin Ildar
 * 
 */
public class KmFkrInstanceRm extends BaseRm<KmFkrInstance> {
	public KmFkrInstanceRm() {
		super("KFI_");
	}

	@Override
	protected KmFkrInstance map(ResultSetWrapper rsw) throws SQLException {
		KmFkrInstance instance = new KmFkrInstance();

		instance.setFkr(new KmFkrRm().map(rsw));
		instance.setClient(initClient("KF_CO_", rsw));
		instance.setChange(new KmFkrStatusChangeRm().map(rsw));
		instance.setEvent(initEventInstance("KF_EI_D_", rsw));
		instance.setInfo(new OfficialInfoRm().map(rsw));
		
		return instance;
	}

	private KmEventInstance initEventInstance(String aliasPrefix, ResultSetWrapper rsw) throws SQLException {
		KmEventInstance instance = new KmEventInstanceRm().map(rsw);
		instance.getEvent().getDeal().setSpkpNumber(rsw.getString(aliasPrefix + "SPKP_NUMBER"));
		return instance;
	}

	private Contractor initClient(String aliasPrefix, ResultSetWrapper rsw) throws SQLException {
		Contractor client = new Contractor();
		client.setId(rsw.getString(aliasPrefix + "ID"));
		client.setName(rsw.getString(aliasPrefix + "NAME"));
		client.setInn(rsw.getString(aliasPrefix + "INN"));
		client.setNumber(rsw.getString(aliasPrefix + "NUMBER"));
		return client;
	}
}
