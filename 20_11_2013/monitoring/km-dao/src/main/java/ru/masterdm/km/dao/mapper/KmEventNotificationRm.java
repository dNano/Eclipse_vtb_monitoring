package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEventNotification;
import ru.masterdm.km.util.ResultSetWrapper;

/**
 * map for Уведомление о наступлении мероприятий.
 * 
 * @author Shafgullin Ildar
 * 
 */
public class KmEventNotificationRm extends BaseRm<KmEventNotification> {

	public KmEventNotificationRm() {
		super("EN_");
	}

	@Override
	protected KmEventNotification map(ResultSetWrapper rsw) throws SQLException {
		KmEventNotification notification = new KmEventNotification();
		notification.setPeriod(rsw.getLong(getAliasPrefix() + "PERIOD"));
		notification.setPeriodKind(rsw.getLong(getAliasPrefix() + "PERIOD_KIND"));
		if (rsw.getLong(getAliasPrefix() + "NOTIFY_AT_DAY") != null) {
			notification.setAlarmOnEventStartDay(rsw.getLong(getAliasPrefix() + "NOTIFY_AT_DAY") == 1);
		}
		if (rsw.getLong(getAliasPrefix() + "NOTIFY_AFTER") != null) {
			notification.setContinueToAlarmWhenUnfulfilled(rsw.getLong(getAliasPrefix() + "NOTIFY_AFTER") == 1);
		}
		if (rsw.getLong(getAliasPrefix() + "NOTIFY_LINK_MSG") != null) {
			notification.setIncludeLinkInTextMessage(rsw.getLong(getAliasPrefix() + "NOTIFY_LINK_MSG") == 1);
		}
		return notification;
	}

}
