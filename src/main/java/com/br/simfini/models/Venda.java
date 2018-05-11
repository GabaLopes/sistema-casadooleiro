package com.br.simfini.models;


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
	private String tipoPagamento;
	
	@ElementCollection(fetch = FetchType.EAGER)
	List<Procedimentos> procedimento = new ArrayList<>();
	
	
	
	public String getTipo() {
		return tipoPagamento;
	}
	public void setTipo(String tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
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
