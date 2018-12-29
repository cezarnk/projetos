package gestao.predial.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import gestao.predial.modelos.Demanda;
import gestao.predial.modelos.Pagamento;
import gestao.predial.modelos.Perfil;

@RequestScoped
public class DemandaDao {
	
	private EntityManager manager;
	
	@Inject
	public DemandaDao(EntityManager manager) {
		this.manager = manager;
	}
	
	@Deprecated
	public DemandaDao() {}
	
	public void adiciona(Demanda demanda) {
		manager.getTransaction().begin();

		Perfil perfil = manager.find(Perfil.class, demanda.getUsuario_chave());
		Demanda dem = new Demanda();
		dem = demanda;
		dem.setPerfil(perfil);
		manager.persist(dem);
		manager.getTransaction().commit();
	}
	
	public void remove(Demanda demanda) {
		manager.getTransaction().begin();
		Object dem = manager.merge(demanda);
		manager.remove(dem);
		
		manager.getTransaction().commit();
	}
	
	public Demanda busca(Demanda demanda) {
		return manager.find(Demanda.class, demanda.getId());
	}
	
	public List<Demanda> lista() {
		String jpql = "select d from Demanda d";
		TypedQuery<Demanda> query = manager.createQuery(jpql,Demanda.class);
		
	   return query.getResultList();
	}
	
	public List<Object[]> listaJson() {
		
		String jpql = "SELECT per.id,per.nome,per.telefone ,dem FROM Demanda as dem JOIN dem.perfil as per";
		TypedQuery<Object[]> query = manager.createQuery(jpql,Object[].class);
		
		List<Object[]> results;
		return results = query.getResultList();
	}
}
