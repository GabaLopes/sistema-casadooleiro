package com.br.simfini.controllers;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.br.simfini.daos.ClienteDAO;
import com.br.simfini.daos.ClinicaDAO;
import com.br.simfini.daos.VendaDAO;
import com.br.simfini.models.Cliente;
import com.br.simfini.models.Clinica;
import com.br.simfini.models.Procedimentos;
import com.br.simfini.models.Venda;

@Controller
@RequestMapping("/relatorio")
public class RelatorioController {

	@Autowired
	private VendaDAO dao;

	@Autowired
	private ClienteDAO clienteDao;

	@Autowired
	private ClinicaDAO daoclinica;

	@RequestMapping("relatorios")
	public ModelAndView relatorio() {
		ModelAndView modelAndView = new ModelAndView("relatorio/relatorios");
		List<Cliente> clientes = clienteDao.lista();
		List<Cliente> listaCliente = clienteDao.listaCliente();
		List<Clinica> listaClinicas = daoclinica.listaClinicas();
		modelAndView.addObject("clinica", listaClinicas);
		modelAndView.addObject("vendas", listaCliente);
		modelAndView.addObject("clientes", clientes);
		
		return modelAndView;
	}

	@RequestMapping("relatoriogeral")
	public ModelAndView geraRelatorioGeral(String dataIni, String dataFim) throws ParseException {
		ModelAndView modelAndView = new ModelAndView("relatorio/relatoriogeral");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date dataInic = sdf.parse(dataIni);
		String dataInicial = sdf.format(dataInic);
		Date dataFi = sdf.parse(dataFim);
		String dataFinal = sdf.format(dataFi);

		BigDecimal total = BigDecimal.ZERO;
		BigDecimal custo = BigDecimal.ZERO;
		BigDecimal dinheiro = BigDecimal.ZERO;
		BigDecimal cartao = BigDecimal.ZERO;
			
		List<Venda> listaRelatorioGeral = dao.listaRelatorioGeral(dataInicial, dataFinal);
		for(Venda v : listaRelatorioGeral) {
			total = total.add(v.getTotal());
			dinheiro = dinheiro.add(v.getDinheiro());
			cartao = cartao.add(v.getCartao());
			for(Procedimentos p : v.getProcedimento()) {
				custo = custo.add(p.getPrecoCusto());
			}
						
		}
		BigDecimal lucro = BigDecimal.ZERO;
		lucro = lucro.add(total);
		lucro = lucro.subtract(custo);
		
		modelAndView.addObject("vendas", listaRelatorioGeral);
		modelAndView.addObject("dataini", dataInic);
		modelAndView.addObject("datafim", dataFi);
		modelAndView.addObject("lucro", lucro);
		modelAndView.addObject("total", total);
		modelAndView.addObject("custo", custo);
		modelAndView.addObject("cartao", cartao);
		modelAndView.addObject("dinheiro", dinheiro);
		

		return modelAndView;

	}

	@RequestMapping("relatoriomes")
	public ModelAndView geraRelatorioMes(String clinica, String dataIni, String dataFim) throws ParseException {
		ModelAndView modelAndView = new ModelAndView("relatorio/relatorioclinica");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");

		Date dataInic = sdf.parse(dataIni);
		String dataInicial = sdf.format(dataInic);

		Date dataFi = sdf.parse(dataFim);
		String dataFinal = sdf.format(dataFi);

		
		BigDecimal total = BigDecimal.ZERO;
		BigDecimal custo = BigDecimal.ZERO;

		List<Venda> listaRelatorio = dao.listaRelatorio(dataInicial, dataFinal, clinica);

		List<Venda> vendasClinica = new ArrayList<>();

		

		for (Venda venda : listaRelatorio) {
			
			Venda venda2 = new Venda();
			
			List<Procedimentos> listaProcedimentoClinica = new ArrayList<>();
			
			for (Procedimentos proced : venda.getProcedimento()) {
				
				if (proced.getClinica().equals(clinica)) {
					listaProcedimentoClinica.add(proced);
					total = total.add(proced.getValor());

				}
			}

			venda2.setCliente(venda.getCliente());
			venda2.setCartao(venda.getCartao());
			venda2.setDinheiro(venda.getDinheiro());
			venda2.setTotal(venda.getTotal());
			venda2.setDataCompra(venda.getDataCompra());
			venda2.setDependente(venda.getDependente());
			venda2.setProcedimento(listaProcedimentoClinica);
			if (venda2.getProcedimento().isEmpty()) {
				break;
			} else
				vendasClinica.add(venda2);
		}

		
		 		 
		 
		 for(Venda venda : vendasClinica) {
		 for(Procedimentos proced : venda.getProcedimento()) {
		 BigDecimal valorCusto = proced.getPrecoCusto();
		 custo = custo.add(valorCusto);
		 }
		 }

		BigDecimal subtract = total.subtract(custo);
		modelAndView.addObject("vendas", vendasClinica);
		modelAndView.addObject("dataini", dataInic);
		modelAndView.addObject("datafim", dataFi);
		modelAndView.addObject("total", total);
		modelAndView.addObject("custo", custo);
		modelAndView.addObject("lucro", subtract);

		return modelAndView;
	}

	@RequestMapping("relatorioporempresa")
	public ModelAndView geraRelatorioPorEmpresa(String dataIni, String dataFim, String empresa) throws ParseException {
		ModelAndView modelAndView = new ModelAndView("relatorio/relatorioporempresa");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date dataInic = sdf.parse(dataIni);
		String dataInicial = sdf.format(dataInic);
		Date dataFi = sdf.parse(dataFim);
		String dataFinal = sdf.format(dataFi);

		BigDecimal total = BigDecimal.ZERO;
		BigDecimal custo = BigDecimal.ZERO;

		List<Venda> listaRelatorioGeral = dao.listaRelatorioEmpresa(dataInicial, dataFinal, empresa);
		for (Venda venda : listaRelatorioGeral) {
			total = total.add(venda.getTotal());
			System.out.println(venda.getTotal());
		
		}
		for (Venda venda : listaRelatorioGeral) {
			for (Procedimentos proced : venda.getProcedimento()) {
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
		modelAndView.addObject("empresa", empresa);
		System.out.println(empresa);

		return modelAndView;

	}
	
	@RequestMapping("relatorioporcliente")
	public ModelAndView geraRelatorioPorCliente(String dataIni, String dataFim, String cliente) throws ParseException {
		ModelAndView modelAndView = new ModelAndView("relatorio/relatorioporcliente");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date dataInic = sdf.parse(dataIni);
		String dataInicial = sdf.format(dataInic);
		Date dataFi = sdf.parse(dataFim);
		String dataFinal = sdf.format(dataFi);

		BigDecimal total = BigDecimal.ZERO;
		BigDecimal desconto = BigDecimal.ZERO;
		
		List<Venda> listaRelatorioGeral = dao.listaRelatorioCliente(dataInicial, dataFinal, cliente);
		for (Venda venda : listaRelatorioGeral) {
			total = total.add(venda.getTotal());
			desconto = desconto.add(venda.getDesconto());
			System.out.println(venda.getTotal());
		
		}

		modelAndView.addObject("vendas", listaRelatorioGeral);
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("dataini", dataInic);
		modelAndView.addObject("datafim", dataFi);
		modelAndView.addObject("total", total);
		modelAndView.addObject("desconto", desconto);

		return modelAndView;

	}
}
