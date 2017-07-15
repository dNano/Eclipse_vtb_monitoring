package ru.masterdm.km.web.mixins;

import org.apache.tapestry5.BindingConstants;
import org.apache.tapestry5.ClientElement;
import org.apache.tapestry5.annotations.AfterRender;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.annotations.Import;
import org.apache.tapestry5.annotations.InjectContainer;
import org.apache.tapestry5.annotations.Parameter;
import org.apache.tapestry5.json.JSONObject;
import org.apache.tapestry5.services.javascript.JavaScriptSupport;

/**
 * 
 * @author Alexey Chalov
 */
@Import(library = "TextboxHint.js")
public class TextboxHint {

    @Environmental
    private JavaScriptSupport javaScriptSupport;

    @InjectContainer
    private ClientElement clientElement;

    @Parameter(required = true, defaultPrefix = BindingConstants.LITERAL)
    private String hintText;
    @Parameter(required = true, defaultPrefix = BindingConstants.LITERAL)
    private String hintColor;

    @AfterRender
    public void prepare() {
        JSONObject spec = new JSONObject();
        spec.put("textboxId", clientElement.getClientId());
        spec.put("hintText", hintText);
        spec.put("hintColor", hintColor);
        javaScriptSupport.addInitializerCall("textboxHint", spec);
    }
}
