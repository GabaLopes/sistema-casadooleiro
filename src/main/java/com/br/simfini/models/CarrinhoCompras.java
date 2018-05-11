package com.br.simfini.models;



import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)
public class CarrinhoCompras implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String titular;
	
	private String telefoneTitular;
	
	private String dependente;
	
	private String telefoneDependente;
	
	private List<Procedimentos> itens = new ArrayList<>();
	
	
	public void add(Procedimentos item){
		System.out.println(item);		
		itens.add(item);
	}
	
	
	
	public String getTelefoneTitular() {
		return telefoneTitular;
	}



	public void setTelefoneTitular(String telefoneTitular) {
		this.telefoneTitular = telefoneTitular;
	}



	public String getTelefoneDependente() {
		return telefoneDependente;
	}



	public void setTelefoneDependente(String telefoneDependente) {
		this.telefoneDependente = telefoneDependente;
	}



	public String getTitular() {
		return titular;
	}



	public void setTitular(String titular) {
		this.titular = titular;
	}



	public String getDependente() {
		return dependente;
	}



	public void setDependente(String dependente) {
		this.dependente = dependente;
	}



	public List<Procedimentos> getItens() {
		return itens;
		
	}
	
	
	
	public void setItens(List<Procedimentos> itens) {
		this.itens = itens;		
	}
	
	public BigDecimal getValor(Procedimentos item) {
		return item.getValor();
	}
	public BigDecimal getDesconto(Procedimentos item) {
		return item.getDesconto();
	}
	
	public BigDecimal getTotal(){
		BigDecimal total = BigDecimal.ZERO;
		for (Procedimentos item : itens) {
			BigDecimal valor = getValor(item);
			BigDecimal desconto = getDesconto(item);
			total = total.add(valor.subtract(desconto));
		}
		return total;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Titular: "+ titular + " Dependente: "+ dependente + " Itens: " + itens;
	}



	public void remove(int item) {
				
		Procedimentos procedimentosMedicos = itens.get(item);
		itens.remove(procedimentosMedicos);
	}



	
	
}
