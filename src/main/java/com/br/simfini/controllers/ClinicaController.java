package com.br.simfini.controllers;


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





@Controller
@RequestMapping("/clinicas")
public class ClinicaController {
		
	@RequestMapping("cadastro")
	public ModelAndView cadastro(){
		List<Clinica> clinicas = dao.listaClinicas();
		List<ServicosMedicos> servicos = dao.listaServicos();
		ModelAndView modelAndView = new ModelAndView("clinicas/cadastro");
		modelAndView.addObject("clinica",clinicas);
		modelAndView.addObject("servico", servicos);
		return modelAndView;
	}
	
	
	@Autowired
	private ClinicaDAO dao;
	
	
	
	
	
	@RequestMapping("cadastroservicos")
	public ModelAndView cadastroservicos() {
		ModelAndView modelAndView = new ModelAndView("clinicas/cadastroservicos");
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(ServicosMedicos servicos, RedirectAttributes redirectAttributes) {
		
				
		dao.gravar(servicos);
		redirectAttributes.addFlashAttribute("sucesso", "Serviço Cadastrado com Sucesso !");
		
		return new ModelAndView("redirect:clinicas/cadastro");
	}
	@RequestMapping(value="/adicionar", method=RequestMethod.POST)
	public ModelAndView gravarClinica(Clinica clinicas, RedirectAttributes redirectAttributes) {
		
		dao.gravaClinica(clinicas);
		redirectAttributes.addFlashAttribute("sucessos", "Clinica Cadastrada com Sucesso !");
		return new ModelAndView("redirect:cadastro");
		
	}
	
	
	@RequestMapping(value="/excluir", method=RequestMethod.POST)
	public ModelAndView excluirServico(int id, RedirectAttributes redirectAttributes) {
				
		ServicosMedicos find = dao.find(id);
		dao.excluirServico(find);
		redirectAttributes.addFlashAttribute("excluido", "Serviço excluido com Sucesso !");
		return new ModelAndView("redirect:cadastro");
		
	}
	
		
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar() {
		List<ServicosMedicos> lista = dao.lista();
		ModelAndView modelAndView = new ModelAndView("clinicas/detalhe");
		modelAndView.addObject("servicos", lista);
		return modelAndView;
	}
	
	@RequestMapping("/lista/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("clinicas/lista");
		ServicosMedicos servico = dao.find(id);
		
		modelAndView.addObject("servico", servico);
		
		return modelAndView;
	}
	
	

}
