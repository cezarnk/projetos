package gestao.predial.controllers;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.IncludeParameters;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import gestao.predial.dao.PerfilDao;
import gestao.predial.modelos.Perfil;

@Controller
public class PerfilController {

	private PerfilDao perfilDao;
	private Result result;
	private Validator validator;
	
	@Inject
	public PerfilController(PerfilDao perfilDao,Result result, Validator validator) {
		this.perfilDao = perfilDao;
		this.result = result;
		this.validator = validator;
	}
	
	@Deprecated
	public PerfilController() {}
	
	@Path("perfil/form")
	public void form() {}
	
	@Post("perfil/adiciona")
	@IncludeParameters
	public void adiciona(@Valid Perfil perfil) {
		validator.onErrorForwardTo(this).form();
		perfilDao.adiciona(perfil);
		result.include("mensagem","Perfil cadastrado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Path("/perfil/remove")
	public void remove(Perfil perfil) {
		perfilDao.remove(perfil);
		result.include("mensagem","Perfil removido com sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Path("/perfil/edita")
	public void edita(Perfil perfil){
        result.include(perfilDao.busca(perfil));
        result.redirectTo(this).form();
    }
	
	@Get("perfil/lista")
	public void lista() {
		result.include("perfil",perfilDao.lista());
	}
	
	@Get("perfil/listaJson")
	public void listaJson() {
		List<Perfil> lista = perfilDao.lista();
	    result.use(Results.json()).from(lista).serialize();
	}
}
