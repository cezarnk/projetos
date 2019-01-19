package gestao.predial.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import gestao.predial.dao.PerfilDao;
import gestao.predial.dao.UsuarioDao;
import gestao.predial.modelos.Usuario;
import gestao.predial.modelos.Perfil;
import gestao.predial.seguranca.Open;
import gestao.predial.seguranca.UsuarioLogado;

@Controller
public class LoginController {
	private UsuarioDao usuarioDao;
	private PerfilDao perfilDao;
	private UsuarioLogado usuarioLogado;
	private Result result;
	private Validator validator;
	
	@Inject
	public LoginController(UsuarioDao usuarioDao, PerfilDao perfilDao, UsuarioLogado usuarioLogado,Result result,Validator validator){
		this.usuarioDao = usuarioDao;
		this.perfilDao = perfilDao;
		this.usuarioLogado = usuarioLogado;
		this.result = result;
		this.validator = validator;
	}
	public LoginController(){}
	
	@Open
    public void form(){
    	
    }
    
	@Open	
    public void autentica(String login, String senha){
    	Usuario usuario = usuarioDao.busca(login,senha);
    	System.out.println(usuario);
    	if(usuario != null){
    		usuarioLogado.fazLogin(usuario);    	
    		System.out.println(usuario.getNome());
    		result.redirectTo(IndexController.class).index();
    	} else {
    		validator.add(new SimpleMessage("Login_invalido","Login ou senha incorretos"));
    		validator.onErrorRedirectTo(this).form();
    		System.out.println("não encontrado");
    	}
    }
    
	@Open
    public void desloga(){
    	this.usuarioLogado.desloga();
    	result.redirectTo(this).form();
    }
	
	@Open
	@Path("/cria-usuario")
	public void criarUsuario() {
		System.out.println("Fui clicado");
		Perfil perfil = new Perfil();
		perfil.setNome("Administrador");
		perfil.setCpf("123.456.789-00");
		perfil.setData_nascimento("01/01/2019");
		perfil.setEstado_civil("Solteiro");
		perfil.setQnt_filhos(0);
		perfil.setEmail("adm@gpredial.com.br");
		perfil.setTelefone("(11) 2242-0000");
		perfil.setQnt_moradores(0);
		perfil.setAndar_ocupado(0);
		perfil.setAdministrador("true");
		perfilDao.adiciona(perfil);
		
		Usuario usuario = new Usuario();
		usuario.setNome("Administrador Root");
		usuario.setNome_guerra("Administrador");
		usuario.setLogin("admin");
		usuario.setSenha("admin");
		usuario.setChave_estrangeira(1);
		usuario.setPerfil(perfil);
		usuarioDao.adiciona(usuario);
		
		result.include("usuarioCriado","Login: "+usuario.getLogin()+" - Senha: "+usuario.getSenha());
		result.include("botao","btn");
		result.redirectTo(this).form();
		System.out.println("Foi gravado");
	}
}