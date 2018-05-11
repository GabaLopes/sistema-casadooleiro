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
	
	@RequestMapping(value="/fechamentoCaixa",method=RequestMethod.POST)
	public ModelAndView fechamentoCaixa(String cartao,String dinheiro,RedirectAttributes redirectAttributes) {
		
		
		String replace = cartao.substring(0).replaceFirst(",","");
		String card = replace.replace(",", ".");
		
		String replace3 = dinheiro.substring(0).replaceFirst(",","");
		String money = replace3.replace(",", ".");
		
		Calendar calendar = new GregorianCalendar();
		Date trialTime = new Date();
		calendar.setTime(trialTime);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = calendar.getTime();
		String format = sdf.format(time);
		
		Calendar calendars = new GregorianCalendar();
		Date times = new Date();
		calendars.setTime(times);
		calendars.add(Calendar.DATE, +1);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		Date data = calendars.getTime();
		String format2 = sdf2.format(data);
		
		BigDecimal cart = new BigDecimal(card);
		BigDecimal din = new BigDecimal(money);
		
		BigDecimal vendadinheiro = BigDecimal.ZERO;
		BigDecimal vendacartao = BigDecimal.ZERO;
		
		List<Venda> vDinheiro = daoVenda.vendaDiaDinheiro(format,format2);
		
		for(Venda v : vDinheiro) {
			List<Procedimentos> procedimento = v.getProcedimento();
			for(Procedimentos proced : procedimento) {
				
				BigDecimal valor = proced.getValor();
				BigDecimal desconto = proced.getDesconto();
				vendadinheiro = vendadinheiro.add(valor.subtract(desconto));
				
			}
		}
		
		List<Venda> vCartao = daoVenda.vendaDiaCartao(format,format2);
		for(Venda v : vCartao) {
			List<Procedimentos> procedimento = v.getProcedimento();
			for(Procedimentos proced : procedimento) {
				BigDecimal valor = proced.getValor();
				BigDecimal desconto = proced.getDesconto();
				vendacartao = vendacartao.add(valor.subtract(desconto));
			}
		}
	
		
		String sucesso = "";
		String falha = "";
		
		
		if(vendacartao.equals(cart) && vendadinheiro.equals(din)) {
			sucesso = "Fechamento efetuado com Sucesso !";
			
		}else {
			
			falha = "Caixa com Saldo indiferente!";
		}
				
		ModelAndView modelAndView = new ModelAndView("/caixa");
		modelAndView.addObject("vendacartao", vendacartao);
		modelAndView.addObject("vendadinheiro", vendadinheiro);
		modelAndView.addObject("caixacartao", cart);
		modelAndView.addObject("caixadinheiro", din);
		modelAndView.addObject("sucesso", sucesso);
		modelAndView.addObject("falha", falha);
	
		
		return modelAndView;
	}

}
