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

	public List<Venda> listaVendas() {
		return manager.createQuery("select  distinct(v) from Venda v join fetch v.procedimento where dataCompra between '2018-05-02' and '2018-05-05' and clinica='sermec'",Venda.class).getResultList();
		
	}

	public List<Venda> listaRelatorio(String dataInicial, String dataFinal, String clinica) {
		return manager.createQuery("select distinct(v) from Venda v left join fetch v.procedimento where dataCompra>= :dataInicial and dataCompra <= :dataFinal and clinica=:clinica",Venda.class).setParameter("dataInicial", dataInicial)
				.setParameter("dataFinal", dataFinal).setParameter("clinica", clinica).getResultList();
		
	}

	public List<Venda> listaRelatorioGeral(String dataInicial, String dataFinal) {
		
		return manager.createQuery("select distinct(v) from Venda v left join fetch v.procedimento where dataCompra>= :dataInicial and dataCompra <= :dataFinal ",Venda.class).setParameter("dataInicial", dataInicial)
				.setParameter("dataFinal", dataFinal).getResultList();
		
	}
	
	public Venda listaVenda(int id){
		return manager.createQuery("select distinct(v) from Venda join fetch v.procedimento where id=:id",Venda.class).setParameter("id", id).getSingleResult();
	}
	
	public List<Venda> vendaDiaDinheiro(String data,String data2){
		return manager.createQuery("select distinct(v) from Venda v left join fetch v.procedimento where dataCompra>=:data and dataCompra<:data2 and tipoPagamento='dinheiro'",Venda.class).setParameter("data", data).setParameter("data2", data2).getResultList();
	}
	public List<Venda> vendaDiaCartao(String data,String data2){
		return manager.createQuery("select distinct(v) from Venda v left join fetch v.procedimento where dataCompra>=:data and dataCompra<:data2 and tipoPagamento='cartão'",Venda.class).setParameter("data", data).setParameter("data2", data2).getResultList();
	}
	
	public List<Venda> listaVendasCaixa(String data) {
		return manager.createQuery("select distinct (v) from Venda v join fetch v.procedimento where dataCompra=:data",Venda.class).setParameter("data", data).getResultList();
		
	}

	
}
