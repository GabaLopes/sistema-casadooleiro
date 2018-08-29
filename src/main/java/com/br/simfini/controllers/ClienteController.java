package com.br.simfini.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;

import javax.swing.JFormattedTextField;
import javax.swing.text.MaskFormatter;

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
	public ModelAndView gravar(String dataCadastro,String nome,String telefone,String dataNascimento,
			String cpf,String endereco, String cidade,String cep,String bairro,String empresa,String telefone2,
			RedirectAttributes redirectAttributes){
		
		Cliente cliente= new Cliente();
		
		List<Dependente> list = new ArrayList<>();
		
		cliente.setDependente(list);
		cliente.setNome(nome);
		cliente.setEmpresa(empresa);
		cliente.setTelefone(telefone);
		cliente.setTelefone2(telefone2);
		cliente.setBairro(bairro);
		cliente.setCep(cep);
		cliente.setCidade(cidade);
		cliente.setCpf(cpf);
		cliente.setDataNascimento(dataNascimento);
		
		try {
			String data = dataCadastro;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cale = Calendar.getInstance();
			cale.setTime(sdf.parse(data));
			cliente.setDataCadastro(cale);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.gravar(cliente);
	    redirectAttributes.addFlashAttribute("sucesso","Cliente Cadastrado com Sucesso !");
	    
	    return new ModelAndView("redirect:clientes/form");
	}
	
	@RequestMapping(value="adicionardependente", method=RequestMethod.POST)
	public ModelAndView adicionarDependente(int id,String nome, String dataNascimento,String dependenteTelefone,String dependenteTelefone2,
			String dependenteCpf,String dependenteCidade,String dependenteEndereco,String dependenteCep,String dependenteBairro,RedirectAttributes redirectAttributes) {
		
		
		Cliente find = dao.find(id);
		
		Dependente dependente2 = new Dependente();
		dependente2.setNome(nome);
		try {
			String data = dataNascimento;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(sdf.parse(data));
			dependente2.setDataNascimento(cal);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		dependente2.setBairro(dependenteBairro);
		dependente2.setCidade(dependenteCidade);
		dependente2.setCpf(dependenteCpf);
		dependente2.setEndereco(dependenteEndereco);
		dependente2.setCep(dependenteCep);
		dependente2.setTelefone(dependenteTelefone);
		dependente2.setTelefone2(dependenteTelefone2);
		List<Dependente> dependente = find.getDependente();
		dependente.add(dependente2);
		
		dao.adicionaDependente(find);
		
		redirectAttributes.addFlashAttribute("dependentesucesso","Dependente inserido com Sucesso !");
		
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
	
	@RequestMapping(value="/atualizar", method=RequestMethod.GET)
	public ModelAndView atualizar(int id) {
		ModelAndView modelAndView = new ModelAndView("clientes/atualizar");		
		Cliente find = dao.find(id);
		modelAndView.addObject("cliente", find);
		return modelAndView;
		
	}
	
	@RequestMapping(value="/atualizar", method=RequestMethod.POST)
	public ModelAndView atualizarCliente(Date data,Cliente cliente, RedirectAttributes redirectAttributes) {
		System.out.println(data);
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String format = sdf.format(data);
			Date date = sdf.parse(format);
			cal.setTime(date);
			cliente.setDataCadastro(cal);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.atualiza(cliente);
		redirectAttributes.addFlashAttribute("atualizado", "Cliente atualizado com Sucesso !");
		return new ModelAndView("redirect:form");
		
	}
	
	
	
	


}
