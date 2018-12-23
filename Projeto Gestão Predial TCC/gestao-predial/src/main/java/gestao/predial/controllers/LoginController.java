package gestao.predial.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import gestao.predial.dao.UsuarioDao;
import gestao.predial.modelos.Usuario;
import gestao.predial.seguranca.Open;
import gestao.predial.seguranca.UsuarioLogado;

@Controller
public class LoginController {
	private UsuarioDao usuarioDao;
	private UsuarioLogado usuarioLogado;
	private Result result;
	private Validator validator;
	
	@Inject
	public LoginController(UsuarioDao usuarioDao, UsuarioLogado usuarioLogado,Result result,Validator validator){
		this.usuarioDao = usuarioDao;
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
    	if(usuario != null){
    		usuarioLogado.fazLogin(usuario);    		
    		result.redirectTo(IndexController.class).index();
    	} else {
    		validator.add(new SimpleMessage("Login_invalido","Login ou senha incorretos"));
    		validator.onErrorRedirectTo(this).form();
    	}
    }
    
	@Open
    public void desloga(){
    	this.usuarioLogado.desloga();
    	result.redirectTo(this).form();
    }
}