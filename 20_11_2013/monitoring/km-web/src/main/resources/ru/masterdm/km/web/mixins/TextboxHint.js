TextboxHint = Class.create({
    initialize : function(textboxId, hintText, hintColor) {
        this.textbox = $(textboxId);
        this.hintText = hintText;
        this.hintColor = hintColor;
        this.normalColor = this.textbox.getStyle('color');

        Event.observe(this.textbox, 'focus', this.doClearHint.bindAsEventListener(this));
        Event.observe(this.textbox, 'blur', this.doCheckHint.bindAsEventListener(this));
        Event.observe(this.textbox, 'change', this.doCheckHint.bindAsEventListener(this));
        Event.observe(this.textbox.form, 'submit', this.doClearHint.bindAsEventListener(this));
        
        this.doCheckHint();
    },

    doClearHint : function(e) {
        if (this.textbox.value == this.hintText) {
            this.textbox.value = "";
        }
        this.textbox.setStyle({color: this.normalColor});
    },

    doCheckHint : function(e) {
        if (this.textbox.value.length == 0) {
            this.textbox.value = this.hintText;
            this.textbox.setStyle({color: this.hintColor});
        }
        else if (this.textbox.value == this.hintText) {
            this.textbox.setStyle({color: this.hintColor});
        }
        else {
            this.textbox.setStyle({color: this.normalColor});
        }
    }
});

Tapestry.Initializer.textboxHint = function(spec) {
    new TextboxHint(spec.textboxId, spec.hintText, spec.hintColor);
};
