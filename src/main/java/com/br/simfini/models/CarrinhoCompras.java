package com.br.simfini.models;



import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class CarrinhoCompras implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String cliente;
	
	private List<ServicosMedicos> itens = new ArrayList<ServicosMedicos>();
	
	
	public void add(ServicosMedicos item){
		System.out.println(item);
		itens.add(item);
	}


	public List<ServicosMedicos> getItens() {
		return itens;
		
	}
	
	
	
	public void setItens(List<ServicosMedicos> itens) {
		this.itens = itens;		
	}
	
	public BigDecimal getValor(ServicosMedicos item) {
		return item.getValorOleiro();
	}
	
	public BigDecimal getTotal(){
		BigDecimal total = BigDecimal.ZERO;
		for (ServicosMedicos item : itens) {
			total = total.add(getValor(item));
		}
		return total;
	}
	
	
}
