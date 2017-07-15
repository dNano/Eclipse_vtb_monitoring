package ru.masterdm.km.web.services;

import static org.apache.commons.codec.binary.Hex.encodeHex;

import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import org.apache.tapestry5.SymbolConstants;
import org.apache.tapestry5.Translator;
import org.apache.tapestry5.ioc.MappedConfiguration;
import org.apache.tapestry5.ioc.OrderedConfiguration;
import org.apache.tapestry5.ioc.ServiceBinder;
import org.apache.tapestry5.ioc.annotations.Contribute;
import org.apache.tapestry5.ioc.annotations.Startup;
import org.apache.tapestry5.ioc.services.ApplicationDefaults;
import org.apache.tapestry5.ioc.services.SymbolProvider;
import org.apache.tapestry5.ioc.services.cron.CronSchedule;
import org.apache.tapestry5.ioc.services.cron.PeriodicExecutor;
import org.apache.tapestry5.services.ComponentRequestFilter;
import org.apache.tapestry5.services.MarkupRenderer;
import org.apache.tapestry5.services.MarkupRendererFilter;
import org.apache.tapestry5.services.TranslatorSource;
import org.apache.tapestry5.services.javascript.JavaScriptStack;
import org.apache.tapestry5.services.javascript.JavaScriptStackSource;

import ru.masterdm.km.web.js.DynarchCalendarStack;
import ru.masterdm.km.web.services.fkr.FkrService;
import ru.masterdm.km.web.services.fkr.FkrServiceImpl;
import ru.masterdm.km.web.translators.DateTranslator;
import ru.masterdm.km.web.translators.MoneyTranslator;

/**
 * KmWebSite module class.
 * 
 * @author Alexey Chalov
 */
public class KmWebSiteModule {

//	private KmWebSiteModule() {
//	}

	/**
	 * Default CSS deactivating method.
	 * 
	 * @param configuration
	 *            {@link OrderedConfiguration} instance
	 */
	@Contribute(MarkupRenderer.class)
	public static void deactiveDefaultCSS(OrderedConfiguration<MarkupRendererFilter> configuration) {
		configuration.override("InjectDefaultStylesheet", null);
	}

	/**
	 * Setups application defaults.
	 * 
	 * @param configuration
	 *            {@link MappedConfiguration} instance
	 */
	@ApplicationDefaults
	@Contribute(SymbolProvider.class)
	public static void setupDefaults(MappedConfiguration<String, String> configuration) {
		configuration.add(SymbolConstants.MINIFICATION_ENABLED, "true");
		configuration.add(SymbolConstants.OMIT_GENERATOR_META, "true");
		try {
			configuration.add(SymbolConstants.HMAC_PASSPHRASE,
					new String(encodeHex(MessageDigest.getInstance("MD5").digest("www.masterdm.ru/km/hmac-key".getBytes()))));
		} catch (NoSuchAlgorithmException e) {
			/* will never happen */
			e = null;
		}
		configuration.add("dmy-format", "dd.MM.yyyy");
	}

	@Contribute(JavaScriptStackSource.class)
	public static void addStacks(MappedConfiguration<String, JavaScriptStack> configuration) {
		configuration.addInstance(DynarchCalendarStack.class.getSimpleName(), DynarchCalendarStack.class);
	}

	/**
	 * Определение трансляторов
	 * 
	 * @param configuration
	 *            {@link MappedConfiguration конфигурация}
	 */
	@Contribute(TranslatorSource.class)
	public static void contributeTranslatorSource(MappedConfiguration<Class<?>, Translator<?>> configuration) {
		configuration.add(Date.class, new DateTranslator());
		configuration.override(BigDecimal.class, new MoneyTranslator());
	}

	@Startup
	public static void scheduleJobs(PeriodicExecutor executor, final FkrService fkrService) {
		String cronExpr = fkrService.getCronExpr();
		executor.addJob(new CronSchedule(cronExpr), "FKR Job", new Runnable() {
			public void run() {
				fkrService.doJob();
			}
		});
	}

	public static void bind(ServiceBinder binder) {
		binder.bind(FkrService.class, FkrServiceImpl.class);
	}

	// Tell Tapestry how to detect and protect pages that require security.
	// We do this by contributing a custom ComponentRequestFilter to Tapestry's ComponentRequestHandler service.
	// - ComponentRequestHandler is shown in
	// http://tapestry.apache.org/request-processing.html#RequestProcessing-Overview
	// - Based on http://tapestryjava.blogspot.com/2009/12/securing-tapestry-pages-with.html

	public void contributeComponentRequestHandler(OrderedConfiguration<ComponentRequestFilter> configuration) {
		configuration.addInstance("PageProtectionFilter", PageProtectionFilter.class);
	}

}
