package gestao.predial.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gestao.predial.spring.model.Perfil;
import gestao.predial.spring.model.Usuario;

@Repository("usuarioDao")
public class UsuarioDAO {
	
protected EntityManager entityManager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public Usuario find(int id) {
		return entityManager.find(Usuario.class, id);
	}
	
	@Transactional
	public void persist(Usuario usuario) {		
		Usuario us = new Usuario();
		us.setLogin(usuario.getLogin());
		us.setNome(usuario.getNome());
		us.setNome_guerra(usuario.getNome_guerra());
		us.setPerfilId(usuario.getPerfilId());
		us.setSenha(usuario.getSenha());
		
		entityManager.persist(us);
	}
	
	@Transactional
	public void merge(Usuario usuario) {
		entityManager.merge(usuario);
	}

	@Transactional
	public void remove(Usuario usuario) {
		entityManager.remove(usuario);
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> findAll() {
		return entityManager.createQuery("SELECT u FROM Usuario u").getResultList();
	}

}
