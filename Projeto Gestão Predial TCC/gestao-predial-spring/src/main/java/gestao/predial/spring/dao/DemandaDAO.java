package gestao.predial.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public void persist(Demanda usuario) {		
		Demanda dem = new Demanda();
		/*
		us.setLogin(usuario.getLogin());
		us.setNome(usuario.getNome());
		us.setNome_guerra(usuario.getNome_guerra());
		us.setPerfilId(usuario.getPerfilId());
		us.setSenha(usuario.getSenha());
		*/
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
	
	@Transactional
	public List<Object[]> listaJson() {
		
		String jpql = "SELECT per.id,per.nome,per.telefone ,dem FROM Demanda as dem JOIN dem.perfil as per";
		TypedQuery<Object[]> query = manager.createQuery(jpql,Object[].class);
		
		List<Object[]> results;
		return results = query.getResultList();
	}

}
