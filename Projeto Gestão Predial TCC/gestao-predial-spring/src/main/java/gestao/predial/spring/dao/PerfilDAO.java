package gestao.predial.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gestao.predial.spring.model.Perfil;

@Repository("perfilDao")
public class PerfilDAO {

	protected EntityManager entityManager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public Perfil find(int id) {
		return entityManager.find(Perfil.class, id);
	}
	
	@Transactional
	public void persist(Perfil perfil) {
		entityManager.persist(perfil);
	}
	
	@Transactional
	public void merge(Perfil perfil) {
		entityManager.merge(perfil);
	}

	@Transactional
	public void remove(Perfil perfil) {
		entityManager.remove(perfil);
	}

	@SuppressWarnings("unchecked")
	public List<Perfil> findAll() {
		return entityManager.createQuery("SELECT p FROM Perfil p").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Perfil> listaPerfil() {
		return entityManager.createQuery("SELECT p.id,p.nome,p.cpf FROM Perfil p").getResultList();
	}

}
