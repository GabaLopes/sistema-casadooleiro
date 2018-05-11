package com.br.simfini.controllers;



import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.simfini.daos.VendaDAO;

import com.br.simfini.models.CarrinhoCompras;
import com.br.simfini.models.Procedimentos;

import com.br.simfini.models.Venda;

@RequestMapping("/pagamento")
@Controller
public class PagamentoController {
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@Autowired
	private VendaDAO dao;
	
	
	@RequestMapping(value="/finalizar", method=RequestMethod.POST)	
	private ModelAndView finalizar(String tipoPagamento,RedirectAttributes model){
		String replace = tipoPagamento.replace(",", "");
		Calendar calendar = new GregorianCalendar();
		Date trialTime = new Date();
		calendar.setTime(trialTime);
		
		
		String titular = carrinho.getTitular();
		String dependente = carrinho.getDependente();
		List<Procedimentos> servicos = carrinho.getItens();
		Venda venda = new Venda();
		venda.setTipo(replace);
		venda.setCliente(titular);
		venda.setDependente(dependente);		
		venda.setDataCompra(calendar);
		venda.setProcedimento(servicos);
		
		BigDecimal total = carrinho.getTotal();
		
		dao.gravarVenda(venda);
		
		carrinho.getItens().clear();
		carrinho.setTitular(null);
		carrinho.setDependente(null);
		
		
		model.addFlashAttribute("vendasucesso", "Venda Realizada com Sucesso !");
		
		return new ModelAndView("redirect:/carrinho/atendimento");
	}
	
	
	
	
}
