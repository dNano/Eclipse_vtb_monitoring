package ru.masterdm.km.dao.mapper;

import java.sql.SQLException;

import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.util.ResultSetWrapper;

public class KmEventRm extends BaseRm<KmEvent> {

    public KmEventRm() {
        super("E_");
    }

    @Override
    protected KmEvent map(ResultSetWrapper rsw) throws SQLException {
        KmEvent event = new KmEvent();
        event.setId(rsw.getLong(getAliasPrefix() + "ID"));
        event.setName(rsw.getString(getAliasPrefix() + "NAME"));
        event.setDeal(new DealRm().map(rsw));
        event.setMonitoredObjectType(new MonitoredObjectTypeRm().map(rsw));
        event.setEventTypeGroup(new KmEventTypeGroupRm().map(rsw));
        event.setEventType(new KmEventTypeRm().map(rsw));
        event.setRepeatType(new KmRepeatTypeRm().map(rsw));
		event.setStartDate(rsw.getDate(getAliasPrefix() + "START_DATE"));
		event.setEndDate(rsw.getDate(getAliasPrefix() + "END_DATE"));
		event.setPeriodDate(rsw.getLong(getAliasPrefix() + "REPEAT_PERIOD"));
		event.setPeriodDetails(rsw.getLong(getAliasPrefix() + "REPEAT_PERIOD_KIND"));
		event.setPeriodWeekend(rsw.getLong(getAliasPrefix() + "REPEAT_PERIOD_WEEKEND"));
		if (rsw.getLong(getAliasPrefix() + "WEEKEND_EXCLUDE") != null) {
			event.setExcludeHoliday(rsw.getLong(getAliasPrefix() + "WEEKEND_EXCLUDE") == 1);
		}

        return event;
    }

}
