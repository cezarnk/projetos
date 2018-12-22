package gestao.predial.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import gestao.predial.modelos.Pagamento;
import gestao.predial.modelos.Perfil;

@RequestScoped
public class PagamentoDao {
	
	private EntityManager manager;
	
	@Inject
	public PagamentoDao(EntityManager manager) {
		this.manager = manager;
	}
	
	@Deprecated
	public PagamentoDao() {}
	
	public void adiciona(Pagamento pagamento) {
		manager.getTransaction().begin();
		System.out.println(pagamento.getChave_estrangeira());
		
		Perfil perfil = manager.find(Perfil.class, pagamento.getChave_estrangeira());
		Pagamento pag = new Pagamento();
		pag = pagamento;
		pag.setPerfil(perfil);
		manager.persist(pag);
	
		manager.getTransaction().commit();
	}
	
	public void remove(Pagamento pagamento) {
		manager.getTransaction().begin();
		manager.remove(pagamento);
		manager.getTransaction().commit();
	}
	
	public Pagamento busca(Pagamento pagamento) {
		return manager.find(Pagamento.class, pagamento.getId());
	}
	
	public List<Pagamento> lista() {
		String jpql = "select p from Pagamento p";
		TypedQuery<Pagamento> query = manager.createQuery(jpql,Pagamento.class);
		
		return query.getResultList();
	}

}
