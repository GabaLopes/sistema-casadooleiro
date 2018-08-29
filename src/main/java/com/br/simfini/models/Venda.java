package com.br.simfini.models;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.List;


import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Venda {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	
	@DateTimeFormat
	private Calendar dataCompra;
	private String cliente;
	private String dependente;
	private String empresa;
	private BigDecimal cartao = BigDecimal.ZERO;
	private BigDecimal dinheiro = BigDecimal.ZERO;
	private BigDecimal desconto = BigDecimal.ZERO;
	private BigDecimal total;
	
	@ElementCollection(fetch = FetchType.EAGER)
	List<Procedimentos> procedimento = new ArrayList<>();
	
	
	
	public BigDecimal getDesconto() {
		return desconto;
	}
	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public BigDecimal getCartao() {
		return cartao;
	}
	public void setCartao(BigDecimal cartao) {
		this.cartao = cartao;
	}
	public BigDecimal getDinheiro() {
		return dinheiro;
	}
	public void setDinheiro(BigDecimal dinheiro) {
		this.dinheiro = dinheiro;
	}
	
	public String getEmpresa() {
		return empresa;
	}
	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}
	
	public List<Procedimentos> getProcedimento() {
		return procedimento;
	}
	public void adicionaProcedimento(Procedimentos proced) {
		this.procedimento.add(proced);
	}
	public void setProcedimento(List<Procedimentos> procedimento) {
		this.procedimento = procedimento;
	}
	public Calendar getData() {
		return dataCompra;
	}
	public void setData(Calendar data) {
		this.dataCompra = data;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getDependente() {
		return dependente;
	}
	public void setDependente(String dependente) {
		this.dependente = dependente;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Calendar getDataCompra() {
		return dataCompra;
	}
	public void setDataCompra(Calendar dataCompra) {
		this.dataCompra = dataCompra;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return cliente +" PRocedimento: "+ procedimento + ", ";
	}
	

}
