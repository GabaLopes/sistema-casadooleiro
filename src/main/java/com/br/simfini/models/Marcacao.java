package com.br.simfini.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Marcacao {

	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String atendente;
	private String data;
	private String horario;
	private String paciente;
	private String clinica;
	private String procedimentos;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAtendente() {
		return atendente;
	}
	public void setAtendente(String atendente) {
		this.atendente = atendente;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public String getPaciente() {
		return paciente;
	}
	public void setPaciente(String paciente) {
		this.paciente = paciente;
	}
	public String getClinica() {
		return clinica;
	}
	public void setClinica(String clinica) {
		this.clinica = clinica;
	}
	public String getProcedimentos() {
		return procedimentos;
	}
	public void setProcedimentos(String procedimentos) {
		this.procedimentos = procedimentos;
	}
	
	
}
