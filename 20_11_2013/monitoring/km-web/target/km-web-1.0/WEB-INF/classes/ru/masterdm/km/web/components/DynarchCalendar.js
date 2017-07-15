var DynarchCalendar = Class.create({
    initialize: function(spec) {
        this.inputField = $(spec.inputFieldId);
        this.triggerId = spec.inputFieldId + '-trigger';
        this.deleteId = spec.inputFieldId + '-delete';
        this.parseURL = spec.parseURL;
        this.dateFormat = spec.dateFormat;
        this.errorClassName = spec.errorClassName;
        this.immediate = spec.immediate;
        this.zone = spec.zone;
        if (this.zone) {
            $T(this.inputField).zoneId = this.zone;
            this.zoneUpdateURL = spec.zoneUpdateURL;
        }
        this.calendar = Calendar.setup({
            inputField : this.inputField.id,
            trigger    : this.triggerId,
            onSelect   : this.onSelect.bind(this),
            bottomBar  : false,
            weekNumbers: false,
            dateFormat : this.dateFormat
        });
        if ((this.immediate || this.zone) && !spec.inputFieldHidden && !spec.inputFieldDisabled) {
            this.inputField.observe('blur', this.onSelect.bindAsEventListener(this));
        }
        $(this.deleteId).observe('click', this.deleteDate.bindAsEventListener(this));
        if (this.zone) {
            var zoneElement = this.zone == '^' ? $(this.inputField).up('.t-zone') : $(this.zone);
            if (zoneElement) {
                $T(this.inputField).zoneId = zoneElement.id;
            }
        }
    },

    deleteDate: function() {
        if (this.inputField.value) {
            this.inputField.setValue('');
            this.onSelect.call(this);
        }
    },

    onSelect: function() {
        if (this.immediate || this.zone) {
            var errorHandler = function(errorMessage) {
                this.inputField.addClassName(this.errorClassName);
                return;
            };

            var successHandler = function(response) {
                var json = response.responseJSON;
                var redirectURL = json.redirectURL;
                if (redirectURL) {
                    window.location.href = redirectURL;
                    return;
                }
                var error = json.error;
                if (error) {
                    errorHandler.call(this, error);
                } else {
                    this.inputField.removeClassName(this.errorClassName);
                    if (this.zone) {
                        var zoneManager = Tapestry.findZoneManager(this.inputField);
                        if (zoneManager) {
                            zoneManager.updateFromURL(this.zoneUpdateURL, {});
                        }
                    }
                }
            }.bind(this);

            Tapestry.ajaxRequest(this.parseURL, {
                method : 'get',
                parameters : {
                    input : this.inputField.value,
                    iefix : new Date().getTime()
                },
                onSuccess : successHandler
            });
        }
        this.calendar.hide();
    }
});

Tapestry.Initializer.dynarchCalendar = function(spec) {
    new DynarchCalendar(spec);
};
