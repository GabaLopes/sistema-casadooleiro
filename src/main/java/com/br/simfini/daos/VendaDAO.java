package com.br.simfini.daos;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.br.simfini.models.Venda;

@Repository
@Transactional
public class VendaDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravarVenda(Venda venda) {
		manager.persist(venda);
		
	}
	
	public void removerVenda(Venda venda) {
		Venda merge = manager.merge(venda);
		manager.remove(merge);
		
	}

	public List<Venda> listaVendas() {
		return manager.createQuery("select v from Venda v join fetch v.procedimento group by v.dataCompra ",Venda.class).getResultList();
		
	}
	
	

	public List<Venda> listaRelatorio(String dataInicial, String dataFinal, String clinica) {
		return manager.createQuery("select v from Venda v inner join v.procedimento p where p.clinica=:clinica and dataCompra>= :dataInicial and dataCompra <= :dataFinal group by v.dataCompra " ,Venda.class).setParameter("dataInicial", dataInicial)
				.setParameter("dataFinal", dataFinal).setParameter("clinica", clinica).getResultList();
		
	}

	public List<Venda> listaRelatorioGeral(String dataInicial, String dataFinal) {
		
		return manager.createQuery("select v from Venda v inner join v.procedimento p where dataCompra>= :dataInicial and dataCompra <= :dataFinal group by v.dataCompra",Venda.class).setParameter("dataInicial", dataInicial)
				.setParameter("dataFinal", dataFinal).getResultList();
		
	}
   
	
	public Venda listaVenda(int id){
		return manager.createQuery("select v from Venda v inner join v.procedimento where id=:id group by v.dataCompra",Venda.class).setParameter("id", id).getSingleResult();
	}
	
	public List<Venda> listaVendaCartao() {
		return manager.createQuery("select v from Venda v inner join v.procedimento where tipoPagamento='cartao'",Venda.class).getResultList();
	}
	
	
	public List<Venda> listaVendasCaixa(String data) {
		return manager.createQuery("select v from Venda v inner join v.procedimento where dataCompra=:data group by v.dataCompra",Venda.class).setParameter("data", data).getResultList();
		
	}

	public List<Venda> listaRelatorioEmpresa(String dataInicial, String dataFinal, String empresa) {
		return manager.createQuery("select v from Venda v inner join v.procedimento where dataCompra>= :dataInicial and dataCompra <= :dataFinal and empresa=:empresa group by v.dataCompra",Venda.class).setParameter("dataInicial", dataInicial)
				.setParameter("dataFinal", dataFinal).setParameter("empresa", empresa).getResultList();
		
	}

	public void atualiza(Venda venda) {
		manager.merge(venda);
		
	}

	public List<Venda> listaRelatorioCliente(String dataInicial, String dataFinal, String cliente) {
		return manager.createQuery("select v from Venda v inner join v.procedimento where dataCompra>= :dataInicial and dataCompra <= :dataFinal and cliente=:cliente group by v.dataCompra",Venda.class).setParameter("dataInicial", dataInicial)
				.setParameter("dataFinal", dataFinal).setParameter("cliente", cliente).getResultList();
	}

	
}
