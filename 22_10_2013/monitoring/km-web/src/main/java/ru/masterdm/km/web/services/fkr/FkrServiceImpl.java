package ru.masterdm.km.web.services.fkr;

import org.apache.tapestry5.ioc.Messages;
import org.apache.tapestry5.ioc.annotations.Inject;

import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.dao.FkrDao;

/**
 * Механизм автоматической смены статуса контрольных мероприятий на "просрочено"
 * 
 * @author Shafigullin Ildar
 * 
 */
public class FkrServiceImpl implements FkrService {
	@Inject
	private FkrDao fkrDao;
	@Inject
	private DictionaryDao dictionaryDao;
	@Inject
	private Messages messages;

	/*
	 * (non-Javadoc)
	 * 
	 * @see ru.masterdm.km.web.services.fkr.FkrService#doJob()
	 */
	@Override
	public void doJob() {
		// TODO Auto-generated method stub
		System.out.println("--------cron Time schedule --------" + messages.get("cronSchedule-fkr"));
		System.out.println("--------temp out from DB(currency list)--------" + dictionaryDao.getCurrencies());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see ru.masterdm.km.web.services.fkr.FkrService#getCronExpr()
	 */
	@Override
	public String getCronExpr() {
		return messages.get("cronSchedule-fkr");
	}

}
