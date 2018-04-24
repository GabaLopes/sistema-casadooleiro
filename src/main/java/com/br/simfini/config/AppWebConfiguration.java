package com.br.simfini.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.br.simfini.controllers.HomeController;
import com.br.simfini.daos.ClienteDAO;
import com.br.simfini.models.CarrinhoCompras;
import com.br.simfini.models.Cliente;

@EnableWebMvc
@ComponentScan(basePackageClasses={HomeController.class, ClienteDAO.class, Cliente.class, CarrinhoCompras.class})
public class AppWebConfiguration  extends WebMvcConfigurerAdapter {
	
	@Bean
	public InternalResourceViewResolver internalresouveciewresolver() {
		  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		    resolver.setPrefix("/WEB-INF/views/");
		    resolver.setSuffix(".jsp");
		    return resolver;
	}
	
	@Bean
	public FormattingConversionService mvcConversionService(){
	    DefaultFormattingConversionService conversionService = new DefaultFormattingConversionService();
	    DateFormatterRegistrar formatterRegistrar = new DateFormatterRegistrar();
	    formatterRegistrar.setFormatter(new DateFormatter("dd/MM/yyyy"));
	    formatterRegistrar.registerFormatters(conversionService);

	    return conversionService;
	}

}
