package ru.masterdm.km.web.mixins;

import org.apache.tapestry5.ComponentResources;
import org.apache.tapestry5.annotations.AfterRender;
import org.apache.tapestry5.annotations.Environmental;
import org.apache.tapestry5.ioc.annotations.Inject;
import org.apache.tapestry5.services.javascript.JavaScriptSupport;

/**
 * 
 * @author Alexey Chalov
 */
public class DialogAjaxLinkFix {

    @Inject
    private ComponentResources componentResources;
    @Environmental
    private JavaScriptSupport javaScriptSupport;

    @AfterRender
    void prepare() {
        String zone = componentResources.getContainerResources().getInformalParameter("zone", String.class);
        String dialog = componentResources.getContainerResources().getInformalParameter("dialog", String.class);
        javaScriptSupport.addScript(
            "Event.observe('%1s', Tapestry.ZONE_UPDATED_EVENT, function(){jQuery('#%2s').dialog('open');})",
            zone, dialog
        );
    }
}
