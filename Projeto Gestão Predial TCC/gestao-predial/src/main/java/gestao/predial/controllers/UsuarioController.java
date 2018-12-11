package gestao.predial.controllers;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import gestao.predial.dao.UsuarioDao;
import gestao.predial.modelos.Usuario;

@Controller
public class UsuarioController {
	private UsuarioDao usuarioDao;
	private Result result;
	private Validator validator;
	@Inject
	public UsuarioController(UsuarioDao usuarioDao,Result result,Validator validator){
    	this.usuarioDao = usuarioDao;
    	this.result = result;
    	this.validator = validator;
    }

	public UsuarioController(){}
	
    @Post("/usuario/adiciona")
    @IncludeParameters
    public void adiciona(@Valid Usuario usuario){
    	validator.onErrorForwardTo(this).form();
    	usuarioDao.adiciona(usuario);    	
    	result.redirectTo(this).lista();
    	result.include("mensagem","Usuario cadastrado com sucesso!");
    }
    
    @Path("/usuario/remove")
    public void remove(Usuario usuario) {
    	usuarioDao.remove(usuario);
    	result.include("mensagem","Usuario removido com sucesso!");
    	result.redirectTo(this).lista();
    }

    public void form(){}

    @Get("/usuario/lista")
    public void lista(){
        result.include("usuarios", usuarioDao.lista());
    }
}