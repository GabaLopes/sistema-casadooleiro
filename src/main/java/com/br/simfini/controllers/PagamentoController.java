package com.br.simfini.controllers;



import java.math.BigDecimal;
import java.util.ArrayList;
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
	private ModelAndView finalizar(String cartao,String desconto,String total,String dinheiro,RedirectAttributes model){
		
		String replace = cartao.replaceFirst(",", "");
		String replace2 = dinheiro.replaceFirst(",", "");
		String replace6 = replace.replace(",", ".");
		String replace5 = replace2.replace(",", ".");
		String replace3 = desconto.replace(",", ".");
		
		String replace4 = total.replace(",", "");
		
		BigDecimal cartaoV = new BigDecimal(replace6);
		BigDecimal dinheiroV = new BigDecimal(replace5);
		BigDecimal descontoV = new BigDecimal(replace3);
		BigDecimal totalV = BigDecimal.ZERO;
		totalV = totalV.add(dinheiroV);
		totalV = totalV.add(cartaoV);
		
		System.out.println(totalV);
		
		Calendar calendar = new GregorianCalendar();
		Date trialTime = new Date();
		calendar.setTime(trialTime);
		
		
		String titular = carrinho.getTitular();
		String dependente = carrinho.getDependente();
		String empresa = carrinho.getEmpresa();
		List<Procedimentos> servicos = carrinho.getItens();
		
		
		Venda venda = new Venda();
		
		venda.setCliente(titular);
		venda.setCartao(cartaoV);
		venda.setDinheiro(dinheiroV);
		venda.setTotal(totalV);
		venda.setDesconto(descontoV);
		venda.setEmpresa(empresa);
		venda.setDependente(dependente);		
		venda.setDataCompra(calendar);
		venda.setProcedimento(servicos);
		
		dao.gravarVenda(venda);
		
		carrinho.getItens().clear();
		carrinho.setTitular(null);
		carrinho.setDependente(null);
		carrinho.setEmpresa(null);
		
		
		model.addFlashAttribute("vendasucesso", "Venda Realizada com Sucesso !");
		
		return new ModelAndView("redirect:/carrinho/atendimento");
	}
	
	
	
	
}
