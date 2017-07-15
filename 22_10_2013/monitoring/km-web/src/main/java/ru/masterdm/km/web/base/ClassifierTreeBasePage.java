/**
 * 
 */
package ru.masterdm.km.web.base;

import org.apache.tapestry5.PersistenceConstants;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.tree.DefaultTreeModel;
import org.apache.tapestry5.tree.TreeModel;

import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.util.ClassifierValueWrapper;
import ru.masterdm.km.util.ValueWrapper;
import ru.masterdm.km.web.util.ValueWrapperTreeModelAdapter;

/**
 * Общая функциональность для страниц использующих дерево классификатора.
 * 
 * @author Shafigullin Ildar
 * 
 */
public class ClassifierTreeBasePage extends SimpleBasePage {
	protected static final ValueWrapper rootNode = new ValueWrapper("Root", null);

	@Persist(PersistenceConstants.FLASH)
	@Property
	protected ClassifierValueWrapper valueWrapper;

	@Inject
	protected DictionaryDao dictionaryDao;

	void pageLoaded() {
		synchronized (rootNode) {
			if (rootNode.children.isEmpty()) {
				dictionaryDao.initClassifierTree(rootNode);
			}
		}
	}

	public TreeModel<ValueWrapper> getTreeModel() {
		ValueEncoder<ValueWrapper> encoder = new ValueEncoder<ValueWrapper>() {
			public String toClient(ValueWrapper value) {
				return value.uuid;
			}

			public ValueWrapper toValue(String clientValue) {
				return rootNode.seek(clientValue);
			}
		};
		return new DefaultTreeModel<ValueWrapper>(encoder, new ValueWrapperTreeModelAdapter(), rootNode.children);
	}
}
