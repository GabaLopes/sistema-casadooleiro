package com.br.simfini.controllers;



import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.simfini.daos.ClinicaDAO;

import com.br.simfini.models.Clinica;
import com.br.simfini.models.ServicosMedicos;
import com.br.simfini.models.Venda;





@Controller
@RequestMapping("/clinicas")
public class ClinicaController {
	
	@Autowired
	private ClinicaDAO dao;
	
	
	
	@RequestMapping("cadastro")
	public ModelAndView cadastro(){
		List<ServicosMedicos> servicos = dao.listaServicos();
		List<Clinica> clinicas = dao.listaClinicas();
		
		ModelAndView modelAndView = new ModelAndView("clinicas/cadastro");
		modelAndView.addObject("clinica",clinicas);
		modelAndView.addObject("servico", servicos);
		
		return modelAndView;
	}
			
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravarServico(String valor,String valorPart,String valorClinicas,String chString,ServicosMedicos servico, RedirectAttributes redirectAttributes) {
		String valorOleir = valor.replace(",", ".");
		String chCerto = chString.replace(",", ".");
		String valorParticula = valorPart.replace(",", ".");
		String valorClinic = valorClinicas.replace(",", ".");
		BigDecimal chBig = new BigDecimal(chCerto);
		BigDecimal valorOleiro = new BigDecimal(valorOleir);
		BigDecimal valorParticular = new BigDecimal(valorParticula);
		BigDecimal valorClinica = new BigDecimal(valorClinic);
		servico.setValorClinica(valorClinica);
		servico.setValorOleiro(valorOleiro);
		servico.setValorParticular(valorParticular);
		servico.setCh(chBig);
		dao.gravarServico(servico);
		
		
		redirectAttributes.addFlashAttribute("sucesso", "Serviço Médico Cadastrado com Sucesso !");
		return new ModelAndView("redirect:clinicas/cadastro");
		
	}
	
	
	@RequestMapping(value="/adicionar", method=RequestMethod.POST)
	public ModelAndView gravarClinica(Clinica clinicas, RedirectAttributes redirectAttributes) {
		
		dao.gravar(clinicas);
		redirectAttributes.addFlashAttribute("sucessos", "Clinica Cadastrada com Sucesso !");
		return new ModelAndView("redirect:cadastro");
		
	}
	
	
	@RequestMapping(value="/excluir", method=RequestMethod.POST)
	public ModelAndView excluirServico(int id, RedirectAttributes redirectAttributes) {
		
		ServicosMedicos find = dao.find(id);
		dao.remove(find);
		redirectAttributes.addFlashAttribute("excluido", "Serviço Excluido com Sucesso !");
		
		return new ModelAndView("redirect:cadastro");
		
	}
	@RequestMapping(value="/atualizar",method=RequestMethod.GET)
	public ModelAndView atualizar(int id) {
		ModelAndView modelAndView = new ModelAndView("clinicas/atualizar");
		ServicosMedicos find = dao.find(id);
		modelAndView.addObject("servico", find);
		return modelAndView;
		
	}
	
	@RequestMapping(value="/atualizarClinica",method=RequestMethod.POST)
	public ModelAndView atualizarClinica(int clinica,String clinicaNova,RedirectAttributes redirectAttributes) {
		Clinica find = dao.findClinica(clinica);
		String nome = find.getNome();
		find.setNome(clinicaNova);
		dao.atualizaClinica(find);
		List<ServicosMedicos> servicos = dao.atualizaClinicaServicos(nome);
		for(ServicosMedicos serv : servicos ) {
			serv.setClinica(clinicaNova);
			dao.atualiza(serv);
		}
		redirectAttributes.addFlashAttribute("clinicasucesso", "Clinica alterada com sucesso !");
		return new ModelAndView("redirect:/clinicas/cadastro");
		
	}
	@RequestMapping(value="/removerClinica",method=RequestMethod.POST)
	public ModelAndView removerClinica(int clinica,RedirectAttributes redirectAttributes) {
		Clinica findClinica = dao.findClinica(clinica);
		String nome = findClinica.getNome();
		List<ServicosMedicos> servicos = dao.atualizaClinicaServicos(nome);
		for(ServicosMedicos servico : servicos) {
			ServicosMedicos servico2 = servico;
			dao.remove(servico2);
		}
		
		dao.removeClinica(dao.findClinica(clinica));
		redirectAttributes.addFlashAttribute("clinicasucesso", "Clinica removida com sucesso !");
		return new ModelAndView("redirect:/clinicas/cadastro");
		
	}
	
	@RequestMapping(value="/atualizar",method=RequestMethod.POST)
	public ModelAndView atualizar(String valor,String valorPart,String valorClinicas,ServicosMedicos servico,RedirectAttributes redirectAttributes) {
		String valorOleir = valor.replace(",", ".");
		String valorParticula = valorPart.replace(",", ".");
		String valorClinic = valorClinicas.replace(",", ".");
		BigDecimal valorOleiro = new BigDecimal(valorOleir);
		BigDecimal valorParticular = new BigDecimal(valorParticula);
		BigDecimal valorClinica = new BigDecimal(valorClinic);
		servico.setValorClinica(valorClinica);
		servico.setValorOleiro(valorOleiro);
		servico.setValorParticular(valorParticular);
		
		dao.atualiza(servico);
		redirectAttributes.addFlashAttribute("atualizado", "Serviço Atualizado com Sucesso !");
		return new ModelAndView("redirect:cadastro");		
	}
		
		
	@RequestMapping("/lista/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("clinicas/lista");
		ServicosMedicos servico = dao.find(id);		
		modelAndView.addObject("servico", servico);		
		return modelAndView;
	}
	
	

}
