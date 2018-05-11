package com.br.simfini.controllers;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.br.simfini.daos.ClinicaDAO;
import com.br.simfini.daos.VendaDAO;
import com.br.simfini.models.Clinica;
import com.br.simfini.models.Procedimentos;
import com.br.simfini.models.Venda;

@Controller
@RequestMapping("/relatorio")
public class RelatorioController {
	
	@Autowired
	private VendaDAO dao;
	
	@Autowired
	private ClinicaDAO daoclinica; 

	@RequestMapping("relatorios")
	public ModelAndView relatorio() {
		ModelAndView modelAndView = new ModelAndView("relatorio/relatorios");
		List<Venda> listaVendas = dao.listaVendas();
		List<Clinica> listaClinicas = daoclinica.listaClinicas();
		System.out.println(listaVendas);
		modelAndView.addObject("clinica", listaClinicas);
		modelAndView.addObject("vendas", listaVendas);
		return modelAndView;
	}
	
	@RequestMapping("relatoriogeral")
	public ModelAndView geraRelatorioGeral(String dataIni,String dataFim) throws ParseException{
		ModelAndView modelAndView = new ModelAndView("relatorio/relatoriogeral");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date dataInic = sdf.parse(dataIni);
		String dataInicial = sdf.format(dataInic);
		Date dataFi = sdf.parse(dataFim);
		String dataFinal = sdf.format(dataFi);
		
		BigDecimal total = BigDecimal.ZERO;
		BigDecimal custo = BigDecimal.ZERO;		
		List<Venda> listaRelatorioGeral = dao.listaRelatorioGeral(dataInicial,dataFinal);
		for(Venda venda : listaRelatorioGeral) {
			for(Procedimentos proced : venda.getProcedimento()) {
				BigDecimal valor = proced.getValor();
				BigDecimal desconto = BigDecimal.ZERO;
				desconto = proced.getDesconto();
				total = total.add(valor.subtract(desconto));
			}
		}
		for(Venda venda : listaRelatorioGeral) {
			for(Procedimentos proced : venda.getProcedimento()) {
				BigDecimal valorCusto = proced.getPrecoCusto();
				custo = custo.add(valorCusto);
			}
		}
		
		BigDecimal subtract = total.subtract(custo);
		modelAndView.addObject("vendas", listaRelatorioGeral);
		modelAndView.addObject("dataini", dataInic);
		modelAndView.addObject("datafim", dataFi);
		modelAndView.addObject("total", total);
		modelAndView.addObject("custo", custo);
		modelAndView.addObject("lucro", subtract);
		
		return modelAndView;
		
	}
	
	@RequestMapping("relatoriomes")
	public ModelAndView geraRelatorioMes(String clinica,String dataIni,String dataFim) throws ParseException{
		ModelAndView modelAndView = new ModelAndView("relatorio/relatorioclinica");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
		
		Date dataInic = sdf.parse(dataIni);
		String dataInicial = sdf.format(dataInic);
		
		Date dataFi = sdf.parse(dataFim);
		String dataFinal = sdf.format(dataFi);
		
		System.out.println(dataInicial + ","+ dataFinal);
		BigDecimal total = BigDecimal.ZERO;
		BigDecimal custo = BigDecimal.ZERO;
		
		List<Venda> listaRelatorio = dao.listaRelatorio(dataInicial,dataFinal,clinica);
		for(Venda venda : listaRelatorio) {
			for(Procedimentos proced : venda.getProcedimento()) {
				BigDecimal valor = proced.getValor();
				BigDecimal desconto = proced.getDesconto();
				total = total.add(valor.subtract(desconto));
			}
		}
		for(Venda venda : listaRelatorio) {
			for(Procedimentos proced : venda.getProcedimento()) {
				BigDecimal valorCusto = proced.getPrecoCusto();
				custo = custo.add(valorCusto);
			}
		}
		
		BigDecimal subtract = total.subtract(custo);
		modelAndView.addObject("vendas", listaRelatorio);
		modelAndView.addObject("dataini", dataInic);
		modelAndView.addObject("datafim", dataFi);
		modelAndView.addObject("total", total);
		modelAndView.addObject("custo", custo);
		modelAndView.addObject("lucro", subtract);
		
		return modelAndView;
	}
}
