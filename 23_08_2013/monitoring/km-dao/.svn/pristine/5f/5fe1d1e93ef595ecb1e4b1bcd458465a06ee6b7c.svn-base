package ru.masterdm.km.util;

import java.util.HashMap;
import java.util.Map;

import ru.masterdm.km.common.util.DataTypeUtil;

/**
 * 
 * @author Alexey Chalov
 */
@SuppressWarnings("serial")
public class StrictMap<K, V> extends HashMap<K, V> {

    private boolean unmodifiable = false;

    public StrictMap<K, V> insert(K key, V value) {
        checkKeyValuePair(key, value);
        super.put(key, value);
        return this;
    }

    @Override
    public V put(K key, V value) {
        checkKeyValuePair(key, value);
        return super.put(key, value);
    }

    @Override
    public void putAll(Map<? extends K, ? extends V> map) {
        for (K key : map.keySet()) {
            checkKeyValuePair(key, map.get(key));
        }
        super.putAll(map);
    }

    @Override
    @Deprecated
    public V get(Object key) {
        throw new UnsupportedOperationException("Use getValue() method instead of this one.");
    }

    public V getValue(K key) {
        return super.get(key);
    }

    public void lock() {
        unmodifiable = true;
    }

    private void checkKeyValuePair(K key, V value) {
        if (unmodifiable) {
            throw new UnsupportedOperationException("Instance is locked.");
        }
        if ((key instanceof String && DataTypeUtil.isEmpty((String) key)) || key == null) {
            throw new IllegalArgumentException("Key must not be null.");
        }
        if ((value instanceof String && DataTypeUtil.isEmpty((String) value)) || value == null) {
            throw new IllegalArgumentException("Value must not be null.");
        }
        if (containsKey(key)) {
            throw new IllegalArgumentException("Duplicate key '" + key + "' found.");
        }
    }
}
