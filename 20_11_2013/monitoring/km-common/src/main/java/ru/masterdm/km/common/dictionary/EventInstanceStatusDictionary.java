package ru.masterdm.km.common.dictionary;

/**
 * 
 * @author Alexey Chalov
 */
public enum EventInstanceStatusDictionary {

    CREDIT_RISK_DETECTED(1L), EXPIRED(2L), NOT_EXECUTED(3L), EXECUTED(4L);

    private final long id;

    private EventInstanceStatusDictionary(long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }
}
