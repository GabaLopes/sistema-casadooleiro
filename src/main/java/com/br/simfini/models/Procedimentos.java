package com.br.simfini.models;

import java.math.BigDecimal;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Index;



@Embeddable
public class Procedimentos {
	
	
	private String clinica;
	private String tipo;
	private BigDecimal precoCusto;
	private BigDecimal valor;
	private BigDecimal valorParticular;
	private String medico;
	private long amb;
	private BigDecimal ch;
	
	
	
	
	public long getAmb() {
		return amb;
	}
	public void setAmb(long amb) {
		this.amb = amb;
	}
	public BigDecimal getCh() {
		return ch;
	}
	public void setCh(BigDecimal ch2) {
		this.ch = ch2;
	}
	public String getClinica() {
		return clinica;
	}
	public void setClinica(String clinica) {
		this.clinica = clinica;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public BigDecimal getPrecoCusto() {
		return precoCusto;
	}
	public void setPrecoCusto(BigDecimal precoCusto) {
		this.precoCusto = precoCusto;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public BigDecimal getValorParticular() {
		return valorParticular;
	}
	public void setValorParticular(BigDecimal valorParticular) {
		this.valorParticular = valorParticular;
	}
	public String getMedico() {
		return medico;
	}
	public void setMedico(String medico) {
		this.medico = medico;
	}

	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Tipo: "+ tipo +" Médico: "+ medico + " Clinica: "+ clinica + " Valor: "+ valor + " Preco de Custo: "+ precoCusto + " Valor Particular: "+ valorParticular ;
	}
}
