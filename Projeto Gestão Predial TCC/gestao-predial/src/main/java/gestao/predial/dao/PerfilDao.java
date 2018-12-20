package gestao.predial.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import gestao.predial.modelos.Perfil;

@RequestScoped
public class PerfilDao {

	private EntityManager manager;
	
	@Inject
	public PerfilDao(EntityManager manager) {
		this.manager = manager;
	}
	
	@Deprecated
	public PerfilDao() {}
	
	public void adiciona(Perfil perfil) {
		manager.getTransaction().begin();
		int idPerfil = perfil.getId();
        if(idPerfil == 0) {
            manager.persist(perfil);
        } else {
            manager.merge(perfil);
        }
        
		manager.getTransaction().commit();
	}
	
	public void remove(Perfil perfil) {
		manager.getTransaction().begin();
		manager.remove(busca(perfil));
		manager.getTransaction().commit();
	}
	
	public Perfil busca(Perfil perfil) {
		return manager.find(Perfil.class, perfil.getId());
	}
	
	public List<Perfil> lista() {
		String jpql = "select p from Perfil p";
		TypedQuery<Perfil> query = manager.createQuery(jpql,Perfil.class);
		
		return query.getResultList();
	}

}
