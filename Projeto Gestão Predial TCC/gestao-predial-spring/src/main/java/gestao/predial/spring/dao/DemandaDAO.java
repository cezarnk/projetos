package gestao.predial.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import gestao.predial.spring.model.Demanda;

@Repository("demandaDao")
public class DemandaDAO {
	
	protected EntityManager manager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager manager) {
		this.manager = manager;
	}
	
	public Demanda find(int id) {
		return manager.find(Demanda.class, id);
	}
	
	@Transactional
	public void persist(Demanda demanda) {		
		Demanda dem = new Demanda();
		dem.setAssunto(demanda.getAssunto());
		dem.setDescricao(demanda.getDescricao());
		dem.setLocal(demanda.getLocal());
		dem.setPerfilId(demanda.getPerfilId());

		manager.persist(dem);
	}
	
	@Transactional
	public void merge(Demanda demanda) {
		manager.merge(demanda);
	}

	@Transactional
	public void remove(Demanda demanda) {
		manager.remove(demanda);
	}

	@SuppressWarnings("unchecked")
	public List<Demanda> findAll() {
		return manager.createQuery("SELECT d FROM Demanda d").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> listaDemandas() {
		
		//String jpql = "SELECT per.id,per.nome,per.telefone ,dem FROM Demanda as dem JOIN dem.perfil as per";
		
		String jpql = "SELECT per.id,per.nome,per.telefone ,dem FROM Perfil per inner join per.demanda as dem";	
		return manager.createQuery(jpql).getResultList();
		
	}

}
