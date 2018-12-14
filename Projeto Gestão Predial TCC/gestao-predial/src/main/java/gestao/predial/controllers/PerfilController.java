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
	
	@Get("perfil/lista")
	public void lista() {
		result.include("perfil",perfilDao.lista());
	}
}
