package com.br.simfini.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.br.simfini.daos.ClinicaDAO;
import com.br.simfini.models.CarrinhoCompras;
import com.br.simfini.models.ServicosMedicos;

@Controller
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {

	@Autowired
	private ClinicaDAO dao;
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@RequestMapping("atendimento")
	public ModelAndView atendimento() {
		List<ServicosMedicos> servicos = dao.listaServicos();
		ModelAndView modelAndView = new ModelAndView("carrinho/atendimento");
		modelAndView.addObject("servico", servicos);
		return modelAndView;
	}
	
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens() {
		ModelAndView modelAndView = new ModelAndView("carrinho/itens");
		modelAndView.addObject("carrinhoCompras", carrinho);
		List<ServicosMedicos> listaServicos = dao.listaServicos();
		modelAndView.addObject("servicos", listaServicos);
		return modelAndView;
	}
	
	
	@RequestMapping("/add")
	public ModelAndView add(ServicosMedicos servicos) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");
		carrinho.add(servicos);
		
		return modelAndView;
	}
}
