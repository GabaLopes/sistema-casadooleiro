package com.br.simfini.controllers;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.simfini.daos.UsuarioDAO;
import com.br.simfini.daos.VendaDAO;
import com.br.simfini.models.Procedimentos;
import com.br.simfini.models.Role;
import com.br.simfini.models.Usuario;
import com.br.simfini.models.Venda;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	@Autowired
	private UsuarioDAO dao;
	
	@Autowired
	private VendaDAO daoVenda;
	
	@RequestMapping(value="/cadastrar",method=RequestMethod.POST)
	public ModelAndView cadastrar(String nome,String login,String senha ) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(senha);
		System.out.println(encodedPassword);
		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		usuario.setNome(nome);
		usuario.setSenha(encodedPassword);
		Role role = new Role();
		role.setNome("ADMIN_ROLE");
		List<Role> roles = new ArrayList<>();
		roles.add(role);
		usuario.setRoles(roles);
		dao.gravar(usuario);
		return new ModelAndView("redirect:/cadastrar");
	}
	
	@RequestMapping("/cadastrar")
	public ModelAndView cadastrar() {
		ModelAndView modelAndView = new ModelAndView("cadastrar/cadastrarusuario");
		return modelAndView;
	}
	
	

}
