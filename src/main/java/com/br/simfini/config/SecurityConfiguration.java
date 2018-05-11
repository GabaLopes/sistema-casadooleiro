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
		
		.antMatchers("/clientes/**").hasRole("ADMIN")
		.antMatchers(HttpMethod.POST,"/clientes").hasRole("ADMIN")
		.antMatchers(HttpMethod.GET,"/clientes").hasRole("ADMIN")
		.antMatchers("/carrinho/**").hasRole("ADMIN")
		.antMatchers(HttpMethod.POST,"/carrinho").hasRole("ADMIN")
		.antMatchers(HttpMethod.GET,"/carrinho").hasRole("ADMIN")
		.antMatchers("/clinicas/**").hasRole("ADMIN")
		.antMatchers(HttpMethod.POST,"/clinicas").hasRole("ADMIN")
		.antMatchers(HttpMethod.GET,"/clinicas").hasRole("ADMIN")
		.antMatchers("/relatorio/**").hasRole("ADMIN")
		.antMatchers(HttpMethod.POST,"/relatorio").hasRole("ADMIN")
		.antMatchers(HttpMethod.GET,"/relatorio").hasRole("ADMIN")
		.antMatchers("/resources/**").permitAll()
		.antMatchers("/").hasRole("ADMIN")
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/login").permitAll()
		.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}
}
