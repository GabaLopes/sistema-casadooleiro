package com.br.simfini.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.br.simfini.models.Clinica;
import com.br.simfini.models.Marcacao;
import com.br.simfini.models.ServicosMedicos;





@Repository
@Transactional
public class ClinicaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Clinica clinica) {
		manager.persist(clinica);
		
	}
	
	public void gravarServico(ServicosMedicos servicos) {
		manager.persist(servicos);
	}
		
	public List<Clinica> listaClinicas() {
		return manager.createQuery("select c from Clinica c ",Clinica.class).getResultList();
	}

	public List<ServicosMedicos> listaServicos() {
		return manager.createQuery("select s from ServicosMedicos s ",ServicosMedicos.class).getResultList();
		
	}
	
	
	public ServicosMedicos find(Integer id) {
		return manager.createQuery("select distinct(s) from ServicosMedicos s "
					+ " where s.id= :id" , ServicosMedicos.class)
					.setParameter("id", id)
					.getSingleResult();
		}

	

	public void remove(ServicosMedicos find) {
		manager.remove(manager.getReference(ServicosMedicos.class, find.getId()));
		
	
	}

	public void atualiza(ServicosMedicos servico) {
		manager.merge(servico);
		
	}
	public void atualizaClinica(Clinica clinica) {
		manager.merge(clinica);
		
	}
	public List<ServicosMedicos> atualizaClinicaServicos(String clinica) {
		return manager.createQuery("select s from ServicosMedicos s where clinica=:clinica",ServicosMedicos.class).setParameter("clinica", clinica)
		.getResultList();
		
	}

	public Clinica findClinica(int id) {
		return manager.createQuery("select distinct(c) from Clinica c "
				+ " where c.id= :id" , Clinica.class)
				.setParameter("id", id)
				.getSingleResult();
	}

	public void removeClinica(Clinica find) {
		Clinica merge = manager.merge(find);
		manager.remove(merge);
	}

	public void removeServicoClinica(List<ServicosMedicos> servicos) {
		manager.remove(servicos);
		
	}

	public void gravarMarcacao(Marcacao marcacao) {
		manager.persist(marcacao);
		
	}

	public List<Marcacao> listaMarcacoes() {
		return manager.createQuery("select m from Marcacao m ",Marcacao.class).getResultList();
		
	}

	public Marcacao findConsulta(int id) {
		return manager.createQuery("select distinct(m) from Marcacao m "
				+ " where m.id= :id" , Marcacao.class)
				.setParameter("id", id)
				.getSingleResult();
		
	}

	public void excluirConsulta(Marcacao findConsulta) {
		Marcacao merge = manager.merge(findConsulta);
		manager.remove(merge);
		
	}

	

			

}



