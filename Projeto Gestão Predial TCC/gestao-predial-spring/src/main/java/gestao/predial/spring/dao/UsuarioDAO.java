package gestao.predial.spring.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
	
	@Transactional
	public boolean busca(Usuario usuario) {
		boolean isValidUser = false;
		try {
			String login = usuario.getLogin();
			String senha = usuario.getSenha();
			System.out.println(login+" - "+senha);
			
			TypedQuery<Usuario> query = entityManager.createQuery("select u from Usuario u where u.login = :login AND u.senha = :senha ",Usuario.class);
			query.setParameter("login",login);
			query.setParameter("senha",senha);
			List<Usuario> us = query.getResultList();
			
			System.out.println(us.get(0).getNome());
			
			if(us != null && us.size() > 0) {
				System.out.println("Nome: "+us.get(0).getNome());
				isValidUser = true;
			}
			
		}catch (NoResultException e) {
			System.out.println("Usuário não localizado!");
			isValidUser = false;
		}catch (IndexOutOfBoundsException e) {
			System.out.println("Usuário não localizado!");
			isValidUser = false;
		}
		return isValidUser;
	}

}
