package com.br.simfini.daos;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.br.simfini.models.Cliente;





@Repository
@Transactional
public class ClienteDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public void gravar(Cliente cliente) {
		manager.persist(cliente);
	}
	
	public List<Cliente> lista() {
		return manager.createQuery("select c from Cliente c ",Cliente.class).getResultList();
		
	}
	
	public Cliente find(Integer id) {
		return manager.createQuery("select distinct(c) from Cliente c join fetch c.dependente"
					+ " where c.id= :id" , Cliente.class)
					.setParameter("id", id)
					.getSingleResult();
		}
	
	
	public void excluirCliente(Cliente cliente) {
			
		manager.remove(manager.getReference(Cliente.class, cliente.getId()));
	}

	public void adicionaDependente(Cliente find) {
		manager.merge(find);
		
	}

	
}
