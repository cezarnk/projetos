package gestao.predial.controllers;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import gestao.predial.dao.DemandaDao;
import gestao.predial.modelos.Demanda;

@Controller
public class DemandaController {
	
	private DemandaDao demandaDao;
	private Result result;
	private Validator validator;
	
	@Inject
	public DemandaController(DemandaDao demandaDao,Result result,Validator validator) {
		this.demandaDao = demandaDao;
		this.result = result;
		this.validator = validator;
	}
	
	@Deprecated
	public DemandaController(){}
	
	@Path("demanda/tela_cadastro")
	public void tela_cadastro() {}
	
	@Post("/demanda/adiciona")
	public void adiciona(@Valid Demanda demanda) {
		validator.onErrorForwardTo(this).tela_cadastro();
		demandaDao.adiciona(demanda);
		result.include("mensagem","Solicitação cadastrado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Path("demanda/remove")
	public void remove(Demanda demanda) {
		demandaDao.remove(demanda);
		result.include("mensagem", "Solicitação removido com sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Get("demanda/lista")
	public void lista() {
		result.include("demanda",demandaDao.lista());
	}
	
	@Get("demanda/listaDemanda")
	public void listaDemandaJson() {
		List<Object[]> lista = demandaDao.listaJson();
	    result.use(Results.json()).from(lista).serialize();
	}
}
