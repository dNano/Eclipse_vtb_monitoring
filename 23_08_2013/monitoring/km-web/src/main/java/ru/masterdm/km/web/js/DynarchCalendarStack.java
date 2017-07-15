package ru.masterdm.km.web.js;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.tapestry5.Asset;
import org.apache.tapestry5.services.AssetSource;
import org.apache.tapestry5.services.javascript.JavaScriptStack;
import org.apache.tapestry5.services.javascript.StylesheetLink;

/**
 * 
 * @author Alexey Chalov
 */
public class DynarchCalendarStack implements JavaScriptStack {

    private AssetSource assetSource;
    private static final String ROOT = "ru/masterdm/km/web/components/calendar";

    public DynarchCalendarStack(AssetSource assetSource) {
        this.assetSource = assetSource;
    }

    @Override
    public List<Asset> getJavaScriptLibraries() {
        List<Asset> ret = new ArrayList<Asset>();
        ret.add(assetSource.getClasspathAsset(ROOT + "/js/jscal2.js"));
        ret.add(assetSource.getClasspathAsset(ROOT + "/calendar-ru.js"));
        return ret;
    }

    @Override
    public List<StylesheetLink> getStylesheets() {
        List<StylesheetLink> ret = new ArrayList<StylesheetLink>();
        ret.add(new StylesheetLink(assetSource.getClasspathAsset(ROOT + "/css/jscal2.css")));
        ret.add(new StylesheetLink(assetSource.getClasspathAsset(ROOT + "/css/border-radius.css")));
        return ret;
    }

    @Override
    public List<String> getStacks() {
        return Collections.emptyList();
    }

    @Override
    public String getInitialization() {
        return null;
    }
}