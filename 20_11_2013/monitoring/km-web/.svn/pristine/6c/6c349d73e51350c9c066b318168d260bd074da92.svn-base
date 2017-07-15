package ru.masterdm.km.web.pages;

import static ru.masterdm.km.common.util.DataTypeUtil.isEmpty;

import java.util.Collections;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.Pattern;

import org.apache.tapestry5.ComponentResources;
import org.apache.tapestry5.EventConstants;
import org.apache.tapestry5.SelectModel;
import org.apache.tapestry5.ValidationTracker;
import org.apache.tapestry5.ValueEncoder;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.annotations.InjectComponent;
import org.apache.tapestry5.annotations.OnEvent;
import org.apache.tapestry5.annotations.PageLoaded;
import org.apache.tapestry5.annotations.Persist;
import org.apache.tapestry5.annotations.Property;
import org.apache.tapestry5.beaneditor.BeanModel;
import org.apache.tapestry5.corelib.components.TextField;
import org.apache.tapestry5.corelib.components.Zone;
import org.apache.tapestry5.grid.GridDataSource;
import org.apache.tapestry5.grid.SortConstraint;
import org.apache.tapestry5.ioc.Messages;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.BeanModelSource;
import org.apache.tapestry5.services.SelectModelFactory;
import org.apache.tapestry5.services.ajax.AjaxResponseRenderer;

import ru.masterdm.km.common.dictionary.MonitoredObjectDictionary;
import ru.masterdm.km.common.entity.ContractorType;
import ru.masterdm.km.common.entity.KmEvent;
import ru.masterdm.km.common.entity.KmEventNotification;
import ru.masterdm.km.common.entity.KmEventType;
import ru.masterdm.km.common.entity.KmEventTypeGroup;
import ru.masterdm.km.common.entity.MonitoredObjectType;
import ru.masterdm.km.common.entity.NotificationRecipient;
import ru.masterdm.km.common.entity.User;
import ru.masterdm.km.dao.DictionaryDao;
import ru.masterdm.km.web.util.BaseEntityValueEncoder;

/**
 * 
 * @author Alexey Chalov
 */
public class CreatePlainEvent {

    @Inject
    private DictionaryDao dictionaryDao;
    @Inject
    private SelectModelFactory selectModelFactory;
    @Inject
    private AjaxResponseRenderer ajaxResponseRenderer;
    @Inject
    private ComponentResources componentResources;
    @Inject
    private BeanModelSource beanModelSource;
    @Inject
    private Messages messages;

    @Environmental
    private ValidationTracker validationTracker;

    @InjectComponent
    private Zone eventCategoryZone;
    @InjectComponent
    private Zone createKmEventZone;
    @InjectComponent
    private Zone recipientsZone;
    @InjectComponent
    private Zone userListZone;
    @InjectComponent
    private TextField rcptFullNameTextField;
    @InjectComponent
    private TextField rcptEmailTextField;
    @InjectComponent
    private TextField eventNameInput;

    @Persist
    @Property
    private KmEvent kmEvent;
    @Persist
    @Property
    private KmEventNotification kmEventNotification;
    @Property
    private NotificationRecipient notificationRecipient;
    @Property
    @SuppressWarnings("unused")
    private NotificationRecipient loopRcpt;
    @Property
    private ContractorType contractorType;

    @Property
    @Persist
    private String lastNamePattern;

    private Pattern emailPattern;

    private List<MonitoredObjectType> monitoredObjectTypes;
    private List<KmEventTypeGroup> kmEventTypeGroups;
    private List<KmEventType> kmEventTypes;
    private List<ContractorType> contractorTypes;

    @Property
    @SuppressWarnings("unused")
    private User user;

    @Property(write = false)
    @SuppressWarnings("unused")
    private boolean dialogAppeared;

    private Action action;

    private enum Action {
        CREATE_EVENT, CANCEL, ADD_RECIPIENT;
    }

    @OnEvent(value = EventConstants.ACTION, component = "selectRecepientLink")
    void prepareUserSelectDialog() {
        dialogAppeared = true;
        lastNamePattern = null;
        ajaxResponseRenderer.addRender(userListZone);
    }

    @OnEvent(value = EventConstants.SELECTED, component = "userSearchButton")
    void searchUsers() {
        ajaxResponseRenderer.addRender(userListZone);
    }

    @OnEvent(value = EventConstants.ACTION, component = "selectUserLink")
    void addRecepient(Long userId) {
        User u = dictionaryDao.getUser(userId);
        if (u != null && !isEmpty(u.getEmail())) {
            NotificationRecipient rcpt = new NotificationRecipient();
            rcpt.setFullName(u.getFullName());
            rcpt.setEmail(u.getEmail());
            if (!kmEventNotification.getRecipients().contains(rcpt)) {
                kmEventNotification.getRecipients().add(rcpt);
                ajaxResponseRenderer.addRender(recipientsZone);
            }
        }
    }

    //TODO: отдизайнить
    @OnEvent(value = EventConstants.VALIDATE, component = "createKmEventForm")
    void validateKmEvent() {
        switch (action) {
            case CREATE_EVENT:
                if (isEmpty(kmEvent.getName()) || kmEvent.getName().equals(messages.get("event-name-watermark"))) {
                    validationTracker.recordError(eventNameInput, messages.get("eventNameInput-required-message"));
                }
                if (isRenderContractorTypes() && kmEvent.getContractorTypes().isEmpty()) {
                    validationTracker.recordError(messages.get("contractorType-required-message"));
                }
                break;
            case ADD_RECIPIENT:
                validationTracker.clear();
                String fullName = notificationRecipient.getFullName();
                if (isEmpty(fullName)) {
                    validationTracker.recordError(rcptFullNameTextField, messages.get("rcptFullNameTextField-required-message"));
                } else if (fullName.trim().length() > Integer.parseInt(messages.get("rcptFullNameTextField-maxLength"))) {
                    validationTracker.recordError(rcptFullNameTextField, messages.get("rcptFullNameTextField-maxLength-message"));
                }

                String email = notificationRecipient.getEmail();
                if (isEmpty(email)) {
                    validationTracker.recordError(rcptEmailTextField, messages.get("rcptEmailTextField-required-message"));
                } else if (email.trim().length() > Integer.parseInt(messages.get("rcptEmailTextField-maxLength"))) {
                    validationTracker.recordError(rcptEmailTextField, messages.get("rcptEmailTextField-maxLength-message"));
                } else if (!emailPattern.matcher(email).matches()) {
                    validationTracker.recordError(rcptEmailTextField, messages.get("rcptEmailTextField-regexp-message"));
                }
                if (!validationTracker.getHasErrors()) {
                    for (NotificationRecipient rcpt : kmEventNotification.getRecipients()) {
                        if (rcpt.getEmail().equals(email)) {
                            validationTracker.recordError(rcptEmailTextField, messages.get("not-unique-email-message"));
                        }
                    }
                }
                break;
            default:
                break;
        }
    }

    @OnEvent(value = EventConstants.SUCCESS, component = "createKmEventForm")
    Object createKmEvent() {
        switch (action) {
            case CREATE_EVENT:
                //TODO: complete event creation
                componentResources.discardPersistentFieldChanges();
                return Index.class;
            case ADD_RECIPIENT:
                kmEventNotification.getRecipients().add(notificationRecipient);
                notificationRecipient = new NotificationRecipient();
                return null;
            default:
                return null;
        }
    }

    @OnEvent(value = EventConstants.SUBMIT, component = "createKmEventForm")
    void refreshPage() {
        ajaxResponseRenderer.addRender(createKmEventZone);
    }
    
    @OnEvent(value = EventConstants.SELECTED, component = "createEventButton")
    void createRequested() {
        action = Action.CREATE_EVENT;
    }

    @OnEvent(value = EventConstants.SELECTED, component = "cancelButton")
    Object cancelRequested() {
        action = Action.CANCEL;
        componentResources.discardPersistentFieldChanges();
        return Index.class;
    }

    @OnEvent(value = EventConstants.SELECTED, component = "addRecipientButton")
    void addRecepientRequested() {
        action = Action.ADD_RECIPIENT;
    }

    @OnEvent(value = "deleteRecipient")
    void deleteRecipient(String email) {
        for (ListIterator<NotificationRecipient> li = kmEventNotification.getRecipients().listIterator(); li.hasNext();) {
            if (li.next().getEmail().equals(email)) {
                li.remove();
            }
        }
        ajaxResponseRenderer.addRender(recipientsZone);
    }

    @OnEvent(value = EventConstants.VALUE_CHANGED, component = "monitoredObjectTypeSelect")
    void selectMonitoredObjectType(MonitoredObjectType monitoredObjectType) {
        kmEvent.setMonitoredObjectType(monitoredObjectType);
        selectEventTypeGroup(null);
    }

    @OnEvent(value = EventConstants.VALUE_CHANGED, component = "eventTypeGroupSelect")
    void selectEventTypeGroup(KmEventTypeGroup eventTypeGroup) {
        kmEvent.setEventTypeGroup(eventTypeGroup);
        kmEvent.setEventType(null);
        ajaxResponseRenderer.addRender(eventCategoryZone);        
    }

    @OnEvent(value = EventConstants.ACTIVATE)
    void prepare() {
        if (kmEvent == null) {
            kmEvent = new KmEvent();
        }
        if (kmEventNotification == null) {
            kmEventNotification = new KmEventNotification();
        }
        notificationRecipient = new NotificationRecipient();
    }

    @PageLoaded
    public void initialize() {
        emailPattern = Pattern.compile(messages.get("rcptEmailTextField-regexp"));
    }

    public BeanModel<User> getUserModel() {
        BeanModel<User> userModel = beanModelSource.createDisplayModel(User.class, messages);
        for (String prop: userModel.getPropertyNames()) {
            userModel.get(prop).sortable(false);
        }
        return userModel;
    }

    public GridDataSource getUsers() {
        return new GridDataSource() {

            private int startIndex;
            private List<User> users;

            @Override
            public void prepare(int startIndex, int endIndex, List<SortConstraint> sortConstraints) {
                this.startIndex = startIndex;
                users = dictionaryDao.getUsers(startIndex, endIndex - startIndex + 1, lastNamePattern);
            }

            @Override
            public Object getRowValue(int index) {
                return users.get(index - startIndex);
            }

            @Override
            public Class<?> getRowType() {
                return User.class;
            }

            @Override
            public int getAvailableRows() {
                return dictionaryDao.getUserCount(lastNamePattern);
            }
        };
    }

    public SelectModel getMonitoredObjectTypeSelectModel(){
        return selectModelFactory.create(getMonitoredObjectTypes(), "name");
    }

    public SelectModel getEventTypeGroupSelectModel() {
        return selectModelFactory.create(getKmEventTypeGroups() != null ? getKmEventTypeGroups() : Collections.emptyList(), "name");
    }

    public SelectModel getEventTypeSelectModel() {
        return selectModelFactory.create(getKmEventTypes() != null ? getKmEventTypes() : Collections.emptyList(), "name");
    }

    public ValueEncoder<MonitoredObjectType> getMonitoredObjectTypeValueEncoder() {
        return new BaseEntityValueEncoder<MonitoredObjectType>(getMonitoredObjectTypes());
    }

    public ValueEncoder<KmEventTypeGroup> getEventTypeGroupValueEncoder() {
        return new BaseEntityValueEncoder<KmEventTypeGroup>(getKmEventTypeGroups());
    }

    public ValueEncoder<KmEventType> getEventTypeValueEncoder() {
        return new BaseEntityValueEncoder<KmEventType>(getKmEventTypes());
    }

    public ValueEncoder<ContractorType> getContractorTypeValueEncoder() {
        return new BaseEntityValueEncoder<ContractorType>(getContractorTypes());
    }

    public boolean isRenderContractorTypes() {
        return kmEvent.getMonitoredObjectType() != null && MonitoredObjectDictionary.CONTRACTOR.getId().equals(kmEvent.getMonitoredObjectType().getId());
    }

    private List<MonitoredObjectType> getMonitoredObjectTypes() {
        if (monitoredObjectTypes == null) {
            monitoredObjectTypes = dictionaryDao.getMonitoredObjectTypes();
        }
        return monitoredObjectTypes;
    }

    private List<KmEventTypeGroup> getKmEventTypeGroups() {
        if (kmEventTypeGroups == null && kmEvent.getMonitoredObjectType() != null) {
            kmEventTypeGroups = dictionaryDao.getEventTypeGroups(kmEvent.getMonitoredObjectType().getId());
        }
        return kmEventTypeGroups;
    }

    private List<KmEventType> getKmEventTypes() {
        if (kmEventTypes == null && kmEvent.getEventTypeGroup() != null) {
            kmEventTypes = dictionaryDao.getKmEventTypes(kmEvent.getEventTypeGroup().getId());
        }
        return kmEventTypes;
    }

    public List<ContractorType> getContractorTypes() {
        if (contractorTypes == null) {
            contractorTypes = dictionaryDao.getContractorTypes();
        }
        return contractorTypes;
    }

    public boolean isContractorTypeSelected() {
        return kmEvent.getContractorTypes().contains(contractorType);
    }

    public void setContractorTypeSelected(boolean contractorTypeSelected) {
        if (contractorTypeSelected) {
            if (!kmEvent.getContractorTypes().contains(contractorType)) {
                kmEvent.getContractorTypes().add(contractorType);
            }
        } else {
            kmEvent.getContractorTypes().remove(contractorType);
        }
    }
}
