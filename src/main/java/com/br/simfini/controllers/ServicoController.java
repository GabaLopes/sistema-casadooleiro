package com.br.simfini.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.simfini.daos.ClinicaDAO;
import com.br.simfini.models.Clinica;

@Controller
@RequestMapping("/clinicas/servicos")
public class ServicoController {
	
	@Autowired
	private ClinicaDAO dao;
	
	@RequestMapping(method=RequestMethod.POST)
		public ModelAndView adicionar(Clinica clinica, RedirectAttributes redirectAttributes) {
			
			dao.gravaClinica(clinica);
						
			redirectAttributes.addFlashAttribute("sucesso", "Produto Casatrado com Sucesso !");
			
			return new ModelAndView("redirect:cadastroservicos");
		}
}
