package gestao.predial.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gestao.predial.spring.model.Pagamento;

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
		Pagamento pag = new Pagamento();
		/*
		us.setLogin(usuario.getLogin());
		us.setNome(usuario.getNome());
		us.setNome_guerra(usuario.getNome_guerra());
		us.setPerfilId(usuario.getPerfilId());
		us.setSenha(usuario.getSenha());
		*/
		manager.persist(pag);
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
		return manager.createQuery("SELECT p FROM Pagamento p").getResultList();
	}
	
	@Transactional
	public List<Object[]> listaJson() {
		
		String queryStr =  "select NEW package.juntaPacote("+
		     "per.nome,per.cpf,pag.valor) from Pagamento pag join pag.perfil per";
		
		String jpql = "SELECT per.id,per.nome,per.cpf ,pag FROM Pagamento as pag JOIN pag.perfil as per";
		TypedQuery<Object[]> query = manager.createQuery(jpql,Object[].class);
		
		List<Object[]> results;
		return results = query.getResultList();
	}
}
