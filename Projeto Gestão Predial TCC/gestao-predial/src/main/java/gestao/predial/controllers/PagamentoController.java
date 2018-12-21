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
import gestao.predial.dao.PagamentoDao;
import gestao.predial.modelos.Pagamento;

@Controller
public class PagamentoController {
	
	private PagamentoDao pagamentoDao;
	private Result result;
	private Validator validator;
	
	@Inject
	public PagamentoController(PagamentoDao pagamentoDao,Result result, Validator validator) {
		this.pagamentoDao = pagamentoDao;
		this.result = result;
		this.validator = validator;
	}
	
	@Deprecated
	public PagamentoController() {}
	
	@Path("pagamento/form")
	public void form() {}
	
	@Post("pagamento/adiciona")
	@IncludeParameters
	public void adiciona(@Valid Pagamento pagamento) {
		validator.onErrorForwardTo(this).form();
		pagamentoDao.adiciona(pagamento);
		result.include("mensagem","Pagamento registrado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Path("pagamento/remove")
	public void remove(Pagamento pagamento) {
		pagamentoDao.remove(pagamento);
		result.include("mensagem","Pagamento excluído com sucesso!");
		result.redirectTo(this).lista();
	}
	
	@Path("pagamento/edita")
	public void edita(Pagamento pagamento) {
		result.include(pagamentoDao.busca(pagamento));
		result.redirectTo(this).lista();
	}
	
	@Get("pagamento/lista")
	public void lista() {
		result.include("pagamento", pagamentoDao.lista());
	}

}
