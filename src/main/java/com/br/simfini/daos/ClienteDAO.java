package com.br.simfini.daos;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.br.simfini.models.Cliente;
import com.br.simfini.models.Dependente;





@Repository
@Transactional
public class ClienteDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public void gravar(Cliente cliente) {
		manager.persist(cliente);
	}
	
	public List<Cliente> listaCliente(){
		return manager.createQuery("select distinct(c) from Cliente c left join fetch c.dependente",Cliente.class).getResultList();
	}
	
	public List<Cliente> lista() {
		return manager.createQuery("select c from Cliente c ",Cliente.class).getResultList();
		
	}
	
	public Cliente find(Integer id) {
		return manager.createQuery("select distinct(c) from Cliente c left join fetch c.dependente"
					+ " where c.id= :id" , Cliente.class)
					.setParameter("id", id)
					.getSingleResult();
		}
	
	public Cliente findDependente(String nome) {
		return manager.createQuery("select distinct(c) from Cliente c inner join c.dependente d"
					+ " where d.nome= :nome" , Cliente.class)
					.setParameter("nome", nome)
					.getSingleResult();
		}
	
	public void excluirCliente(Cliente cliente) {
			
		manager.remove(manager.getReference(Cliente.class, cliente.getId()));
		
	}

	public void adicionaDependente(Cliente find) {
		manager.merge(find);
		
	}

	public void atualiza(Cliente cliente) {
		manager.merge(cliente);
		
	}

	
	
	 
	
	
}
