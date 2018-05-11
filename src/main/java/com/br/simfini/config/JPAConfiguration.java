package com.br.simfini.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
public class JPAConfiguration {
	
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf ) {
		return new JpaTransactionManager(emf);
	}
	
	//Criação do Entity Manager Factory Bean
		@Bean
	    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
	        LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
	        
	        
	        JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
	        factoryBean.setJpaVendorAdapter(vendorAdapter);
	       
	        //Configuração de acesso ao banco de dados
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setUsername("root");
	        dataSource.setPassword("1234");
	        dataSource.setUrl("jdbc:mysql://localhost:3306/casadooleiro");
	        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	        //Lançando o DataSource no Entity Manager Factory Bean
	        factoryBean.setDataSource(dataSource);

	        //Criação do Properties que define também dialeto a qual se comunicara com o Banco de Dados
	        Properties props = new Properties();
	        props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
	        props.setProperty("hibernate.show_sql", "true");
	        props.setProperty("hibernate.hbm2ddl.auto", "update");
	        //Lançando o Properties no Factory Bean
	        factoryBean.setJpaProperties(props);
	        
	        //Configuração para dizer onde o Entity encontrara os models
	        factoryBean.setPackagesToScan("com.br.simfini.models");
	        
	        //Retorna toda a Factory Bean
	        return factoryBean;
	
		}
}
