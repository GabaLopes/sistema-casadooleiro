package com.br.simfini.models;


import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Cliente {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@DateTimeFormat
	private Calendar dataCadastro;
	
	private String nome;
	private Long telefone;
	
	@ElementCollection
	private List<Dependente> dependente;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	//geters e setters	
	
	public Calendar getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public String getNome() {
		return nome;
	}
	public Long getTelefone() {
		return telefone;
	}
	public void setTelefone(Long telefone) {
		this.telefone = telefone;
	}
	public List<Dependente> getDependente() {
		return dependente;
	}
	public void setDependente(List<Dependente> dependente) {
		this.dependente = dependente;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Cliente: " + nome;
	}
		

}
