package ru.masterdm.km.common.entity;

/**
 * Base entity that contains name.
 * @author Alexey Chalov
 */
@SuppressWarnings("serial")
public class BaseNamedEntity<T> extends BaseIndexedEntity<T> {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
