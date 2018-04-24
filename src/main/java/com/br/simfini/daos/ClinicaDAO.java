package com.br.simfini.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.br.simfini.models.Clinica;
import com.br.simfini.models.ServicosMedicos;





@Repository
@Transactional
public class ClinicaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(ServicosMedicos servico) {
		manager.persist(servico);
		
	}
	
	public void gravaClinica(Clinica clinica) {
		manager.persist(clinica);
		
	}
	
	public List<ServicosMedicos> lista() {
		return manager.createQuery("select s from ServicosMedicos c",ServicosMedicos.class).getResultList();
	}
	public List<Clinica> listaClinicas() {
		return manager.createQuery("select c from Clinica c",Clinica.class).getResultList();
	}
	public List<ServicosMedicos> listaServicos() {
		return manager.createQuery("select s from ServicosMedicos s",ServicosMedicos.class).getResultList();
	}

	public ServicosMedicos find(Integer id) {
		return manager.createQuery("select distinct(s) from ServicosMedicos s"
					+ " where s.id= :id" , ServicosMedicos.class)
					.setParameter("id", id)
					.getSingleResult();
		}

	public void excluirServico(ServicosMedicos servico) {
		System.out.println(servico);
		manager.remove(manager.getReference(ServicosMedicos.class, servico.getId()));
	}

		

}



