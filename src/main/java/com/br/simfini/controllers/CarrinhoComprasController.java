package com.br.simfini.controllers;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.br.simfini.daos.VendaDAO;
import com.br.simfini.models.CarrinhoCompras;
import com.br.simfini.models.Cliente;
import com.br.simfini.models.Clinica;
import com.br.simfini.models.Dependente;
import com.br.simfini.models.Marcacao;
import com.br.simfini.models.Procedimentos;
import com.br.simfini.models.ServicosMedicos;
import com.br.simfini.models.Venda;

@Controller
@RequestMapping("/carrinho")

@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {

	@Autowired
	private ClinicaDAO dao;
	
	@Autowired
	private VendaDAO daoVenda;
	
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
		
		//Total CH
		BigDecimal total = BigDecimal.ZERO;
		List<Procedimentos> itens = carrinho.getItens();
		for(Procedimentos item : itens) {
			BigDecimal ch = item.getCh();
			total = total.add(ch);
		}
		
		
		modelAndView.addObject("clinicas", listaClinicas);
		modelAndView.addObject("totalch", total);
		return modelAndView;
	}
	
	@RequestMapping("/addCliente")
	public ModelAndView addCliente(String titular,String empresa, String dependente,String telefone, String idTitular , RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho/atendimento");
		
		String nomeDepen = null;
		String teleDepen = null;
		
		System.out.println(idTitular);
		
	
	
		if(dependente!=null) {			
		int index = Integer.parseInt(dependente);
		int id = Integer.parseInt(idTitular);
		Cliente find = clienteDao.find(id);
		System.out.println(dependente);
	    List<Dependente> dependenteFind = find.getDependente();
	    Dependente dependente2 = dependenteFind.get(index);
		teleDepen = dependente2.getTelefone();
		nomeDepen = dependente2.getNome();
		}
	
		carrinho.setEmpresa(empresa);
		
		if(nomeDepen==null) {
			carrinho.setTitular(titular);
			System.out.println("Entrou " + telefone);
			carrinho.setTelefoneTitular(telefone);
			
		}else {
			carrinho.setTitular(titular);
			System.out.println("Entrou o dependente " + teleDepen);
			carrinho.setDependente(nomeDepen);
			carrinho.setTelefoneDependente(teleDepen);
			carrinho.setEmpresa(empresa);
		}		
		
		redirectAttributes.addFlashAttribute("sucesso", "Cliente Adicionado !");
		
		return modelAndView;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(Clinica nomeClinica, ServicosMedicos servico,RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho/atendimento");
	      
		  String tipo = servico.getTipo();
		  String clinica = servico.getClinica();			  
		  String medico = servico.getMedico();
		  BigDecimal valorClinica = servico.getValorClinica();
		  BigDecimal valorOleiro = servico.getValorOleiro();
		  BigDecimal valorParticular = servico.getValorParticular();
		  long amb = servico.getAmb();
		  BigDecimal ch = servico.getCh();
		  Procedimentos proced = new Procedimentos();	
		  proced.setAmb(amb);
		  proced.setCh(ch);
		  proced.setTipo(tipo);
		  proced.setClinica(clinica);
		  proced.setPrecoCusto(valorClinica);
		  proced.setMedico(medico);
		  proced.setValor(valorOleiro);
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
		System.out.println("Entrou na Bagaça");
		modelAndView.addObject("compra", compras);
		return modelAndView;
	}
	
	@RequestMapping("/guiageral")
	public ModelAndView guiageral(CarrinhoCompras compras) {
		ModelAndView modelAndView = new ModelAndView("carrinho/guiageral");
		modelAndView.addObject("compra", compras);
		List<Venda> listaVendas = daoVenda.listaVendas();
		for(Venda v : listaVendas) {
			BigDecimal total = BigDecimal.ZERO;
			List<Procedimentos> procedimento = v.getProcedimento();
			for(Procedimentos p : procedimento) {
				total = total.add(p.getValor());
			}
			v.setTotal(total);
			daoVenda.atualiza(v);
		}
		
		return modelAndView;
	}
	
	@RequestMapping("vendas")
	public ModelAndView vendas(String dataIni,String dataFim) throws ParseException {
		ModelAndView modelAndView = new ModelAndView("carrinho/vendas");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		String dataInicial = dataIni;
		
		String dataFinal = dataFim;
		
		List<Venda> vendas = daoVenda.listaRelatorioGeral(dataInicial, dataFinal);
		modelAndView.addObject("vendas", vendas);		
		return modelAndView;
	}
	
	@RequestMapping("excluirvenda")
	public ModelAndView excluirvenda(int id, int index) {
		Venda venda = daoVenda.listaVenda(id);
		venda.getProcedimento().remove(index);
		daoVenda.atualiza(venda);
			
		return new ModelAndView("redirect:atendimento");
	}
	
	@RequestMapping("marcacao")
	public ModelAndView marcacao(String atendente, String data, String horario, String paciente,String procedimentos,String clinica) {
		Marcacao marcacao = new Marcacao();
		marcacao.setAtendente(atendente);
		marcacao.setClinica(clinica);
		marcacao.setData(data);
		marcacao.setHorario(horario);
		marcacao.setPaciente(paciente);
		marcacao.setProcedimentos(procedimentos);
		dao.gravarMarcacao(marcacao);
		
			
		return new ModelAndView("redirect:atendimento");
	}
	
	@RequestMapping("/vermarcacoes")
	public ModelAndView vermarcacoes() {
		ModelAndView modelAndView = new ModelAndView("carrinho/vermarcacoes");
		List<Marcacao> listaMarcacoes = dao.listaMarcacoes();
		modelAndView.addObject("marcacoes", listaMarcacoes);
		return modelAndView;
	}
	
	@RequestMapping("/excluirConsulta")
	public ModelAndView excluirConsulta( int id) {
		Marcacao findConsulta = dao.findConsulta(id);
		dao.excluirConsulta(findConsulta);
		return new ModelAndView("redirect:vermarcacoes");
	}
	
	
	
}
