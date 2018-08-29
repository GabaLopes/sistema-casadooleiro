package com.br.simfini.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.br.simfini.daos.UsuarioDAO;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private UsuarioDAO usuarioDao;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(usuarioDao)
		.passwordEncoder(new BCryptPasswordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		CharacterEncodingFilter filter = new CharacterEncodingFilter(); 
		filter.setEncoding("UTF-8"); filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		http.authorizeRequests()
		
		.antMatchers("/clientes/**").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.POST,"/clientes").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.GET,"/clientes").hasAnyRole("ADMIN","GERENTE")
		.antMatchers("/carrinho/**").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.POST,"/carrinho").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.GET,"/carrinho").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.POST,"/clinicas").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.POST,"/clinicas/removerClinica").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.GET,"/clinicas").hasAnyRole("ADMIN","GERENTE")
		.antMatchers("/relatorio/**").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.POST,"/relatorio").hasAnyRole("ADMIN","GERENTE")
		.antMatchers(HttpMethod.GET,"/relatorio").hasAnyRole("ADMIN","GERENTE")
		.antMatchers("/resources/**").permitAll()
		.antMatchers("/").hasAnyRole("ADMIN","GERENTE")
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/login").permitAll()
		.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}
}
