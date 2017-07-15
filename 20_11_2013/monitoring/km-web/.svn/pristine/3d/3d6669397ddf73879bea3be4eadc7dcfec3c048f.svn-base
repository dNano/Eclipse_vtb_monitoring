package ru.masterdm.km.web.util;

import java.util.List;

import org.apache.tapestry5.ValueEncoder;

import ru.masterdm.km.common.entity.BaseIndexedEntity;

/**
 * 
 * @author Alexey Chalov
 */
public class BaseEntityValueEncoder<T extends BaseIndexedEntity<? extends Comparable<?>>> implements ValueEncoder<T> {

    private List<T> objectList;

    /**
     * Constructor.
     * @param objectList list of objects that extends {@link IndexedBean} class.
     */
    public BaseEntityValueEncoder(List<T> objectList) {
        this.objectList = objectList;
    }

    @Override
    public String toClient(T value) {
        if (value == null) {
            return null;
        }
        return String.valueOf(value.getId());
    }

    @Override
    public T toValue(String clientValue) {
        if (clientValue == null || objectList == null) {
            return null;
        }
        for (T object : objectList) {
            if (clientValue.equals(String.valueOf(object.getId()))) {
                return object;
            }
        }
        return null;
    }
}
