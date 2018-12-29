package gestao.predial.dao;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import gestao.predial.modelos.Pagamento;
import gestao.predial.modelos.Perfil;
import gestao.predial.modelos.Usuario;

@RequestScoped
public class UsuarioDao {
	private EntityManager manager;
	
	@Inject
	public UsuarioDao(EntityManager manager){
		this.manager = manager;
	}
	
	public UsuarioDao(){}
	
	public void adiciona(Usuario usuario){
		manager.getTransaction().begin();
		
		System.out.println(usuario.getChave_estrangeira());
		
		Perfil perfil = manager.find(Perfil.class, usuario.getChave_estrangeira());
		Usuario usr = new Usuario();
		usr = usuario;
		usr.setPerfil(perfil);
		
		manager.persist(usr);
		manager.getTransaction().commit();
	}
	
	public void remove(Usuario usuario) {
		manager.getTransaction().begin();
		manager.remove(busca(usuario));
		manager.getTransaction().commit();
	}
	
	public Usuario busca(Usuario usuario) {
		return manager.find(Usuario.class, usuario.getId());
	}
		
	public List<Usuario> lista(){
        String jpql = "select u from Usuario u";
        TypedQuery<Usuario> query = manager.createQuery(jpql, Usuario.class);
        
        return query.getResultList();
    }

	public Usuario busca(String login, String senha) {
		TypedQuery<Usuario> query = manager.createQuery("select u from Usuario u where u.login = :login AND u.senha = :senha ",Usuario.class);
		query.setParameter("login",login);
		query.setParameter("senha",senha);
		
		return query.getSingleResult();
	}
}
