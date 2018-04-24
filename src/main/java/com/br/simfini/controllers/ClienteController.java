package com.br.simfini.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.simfini.daos.ClienteDAO;
import com.br.simfini.models.Cliente;
import com.br.simfini.models.Dependente;
import com.br.simfini.models.ServicosMedicos;








@Controller
@RequestMapping("/clientes")
public class ClienteController {
	
	@Autowired
	private ClienteDAO dao;
	
	@RequestMapping("form")
    public ModelAndView form(){
		ModelAndView modelAndView = new ModelAndView("clientes/form");
		List<Cliente> clientes = dao.lista();
		modelAndView.addObject("clientes", clientes);
		
 		
        return modelAndView;
    }
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(Cliente cliente, RedirectAttributes redirectAttributes){
		dao.gravar(cliente);
	    redirectAttributes.addFlashAttribute("sucesso","Cliente Cadastrado com Sucesso !");
	    
	    return new ModelAndView("redirect:clientes/form");
	}
	
	@RequestMapping(value="adicionardependente", method=RequestMethod.POST)
	public ModelAndView adicionarDependente(int id,String nome, String dataNascimento,Long telefone, RedirectAttributes redirectAttributes) {
		
		
		Cliente find = dao.find(id);
		List<Dependente> dependente = find.getDependente();
		Dependente dependente2 = new Dependente();
		dependente2.setNome(nome);
		try {
			String data = dataNascimento;
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdf.parse(data));
			dependente2.setDataNascimento(cal);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		dependente2.setTelefone(telefone);
		dependente.add(dependente2);
		find.setDependente(dependente);
		dao.adicionaDependente(find);
		
		return new ModelAndView("redirect:form");
		
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar() {
		List<Cliente> clientes= dao.lista();
		ModelAndView modelAndView = new ModelAndView("clientes/lista");
		modelAndView.addObject("cliente", clientes);
		return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhes(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("clientes/detalhe");
		Cliente cliente = dao.find(id);		
		modelAndView.addObject("clientes", cliente);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/excluir", method=RequestMethod.POST)
	public ModelAndView excluirCliente(int id, RedirectAttributes redirectAttributes) {
				
		Cliente find = dao.find(id);
		dao.excluirCliente(find);
		redirectAttributes.addFlashAttribute("excluido", "Cliente excluido com Sucesso !");
		return new ModelAndView("redirect:form");
		
	}
	
	


}
