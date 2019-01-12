package gestao.predial.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.common.reflection.java.generics.TypeEnvironmentFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gestao.predial.spring.model.Pagamento;
import java.math.BigDecimal;

@Repository("pagamentoDao")
public class PagamentoDAO {
	
	protected EntityManager manager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager manager) {
		this.manager = manager;
	}
	
	public Pagamento find(int id) {
		return manager.find(Pagamento.class, id);
	}
	
	@Transactional
	public void persist(Pagamento pagamento) {		
		manager.persist(pagamento);
	}
	
	@Transactional
	public void merge(Pagamento pagamento) {
		manager.merge(pagamento);
	}

	@Transactional
	public void remove(Pagamento pagamento) {
		manager.remove(pagamento);
	}

	@SuppressWarnings("unchecked")
	public List<Pagamento> findAll() {
		return manager.createQuery("SELECT p.condominio FROM Pagamento p").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> listaJson() {		
		String jpql = "SELECT per.id,per.nome,per.cpf ,pag FROM Perfil per inner join per.pagamentos as pag";	
		return manager.createQuery(jpql).getResultList();
	}
}
