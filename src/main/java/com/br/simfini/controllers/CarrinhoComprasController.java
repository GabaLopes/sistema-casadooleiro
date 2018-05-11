package com.br.simfini.controllers;


import java.math.BigDecimal;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.simfini.daos.ClienteDAO;
import com.br.simfini.daos.ClinicaDAO;
import com.br.simfini.models.CarrinhoCompras;
import com.br.simfini.models.Cliente;
import com.br.simfini.models.Clinica;
import com.br.simfini.models.Procedimentos;
import com.br.simfini.models.ServicosMedicos;

@Controller
@RequestMapping("/carrinho")

@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {

	@Autowired
	private ClinicaDAO dao;
	
	@Autowired
	private ClienteDAO clienteDao;
	
	@Autowired
	private CarrinhoCompras carrinho;
	
	@RequestMapping("atendimento")
	public ModelAndView atendimento() {
		List<ServicosMedicos> servicos = dao.listaServicos();
		List<Cliente> clientes = clienteDao.listaCliente();
		ModelAndView modelAndView = new ModelAndView("carrinho/atendimento");
		modelAndView.addObject("servico", servicos);		
		modelAndView.addObject("clientes", clientes);
		return modelAndView;
	}
	
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens() {
		ModelAndView modelAndView = new ModelAndView("carrinho/itens");
		
		modelAndView.addObject("carrinhoCompras", carrinho);
		List<Clinica> listaClinicas = dao.listaClinicas();
		modelAndView.addObject("clinicas", listaClinicas);
		return modelAndView;
	}
	
	@RequestMapping("/addCliente")
	public ModelAndView addCliente(String titular, String dependente,String telefone ,String telefoneDependente, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho/atendimento");
		if(dependente==null) {
			carrinho.setTitular(titular);
			System.out.println("Entrou " + telefone);
			carrinho.setTelefoneTitular(telefone);
		}else {
			carrinho.setTitular(titular);
			System.out.println("Entrou o dependente " + telefoneDependente);
			carrinho.setDependente(dependente);
			carrinho.setTelefoneDependente(telefoneDependente);
		}		
		
		redirectAttributes.addFlashAttribute("sucesso", "Cliente Adicionado !");
		
		return modelAndView;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(Clinica nomeClinica,String desconto, ServicosMedicos servico,RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho/atendimento");
		
		if(desconto.isEmpty()) {
			System.out.println("entrou");
			String zero = "0";
			desconto = zero;
		}
		String desconto2 = desconto.replace(",", ".");
		System.out.println(desconto2);
		
		BigDecimal desc = new BigDecimal(desconto2);
		
		
	      
		  String tipo = servico.getTipo();
		  String clinica = servico.getClinica();			  
		  String medico = servico.getMedico();
		  BigDecimal valorClinica = servico.getValorClinica();
		  BigDecimal valorOleiro = servico.getValorOleiro();
		  BigDecimal valorParticular = servico.getValorParticular();
		  long amb = servico.getAmb();
		  int ch = servico.getCh();
		  Procedimentos proced = new Procedimentos();	
		  proced.setAmb(amb);
		  proced.setCh(ch);
		  proced.setTipo(tipo);
		  proced.setClinica(clinica);
		  proced.setPrecoCusto(valorClinica);
		  proced.setMedico(medico);
		  proced.setValor(valorOleiro);
		  proced.setDesconto(desc);
		  proced.setValorParticular(valorParticular);
		  carrinho.add(proced);
		  
		  redirectAttributes.addFlashAttribute("sucessos", "Procedimento Adicionado !");
		
		return modelAndView;
	}
	
	@RequestMapping("/remover")
	public ModelAndView remover(String item) {
		
		int parseInt = Integer.parseInt(item);
		System.out.println(parseInt);
		carrinho.remove(parseInt);
		
		return new ModelAndView("redirect:/carrinho");
	}
	
	@RequestMapping("/cancelar")
	public ModelAndView cancelar() {
		
		List<Procedimentos> itens = carrinho.getItens();
		itens.clear();
		carrinho.setTitular(null);
		carrinho.setTelefoneTitular(null);
		carrinho.setTelefoneDependente(null);
		carrinho.setDependente(null);
		
		return new ModelAndView("redirect:/carrinho/atendimento");
	}
	
	
	
	
	@RequestMapping("/guiamedico")
	public ModelAndView guiamedico(CarrinhoCompras compras) {
		ModelAndView modelAndView = new ModelAndView("carrinho/guiamedico");
		modelAndView.addObject("compra", compras);
		return modelAndView;
	}
	
	@RequestMapping("/guiageral")
	public ModelAndView guiageral(CarrinhoCompras compras) {
		ModelAndView modelAndView = new ModelAndView("carrinho/guiageral");
		modelAndView.addObject("compra", compras);
		return modelAndView;
	}
	
	
}
