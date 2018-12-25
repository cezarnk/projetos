package gestao.predial.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;

import gestao.predial.dao.UsuarioDao;
import gestao.predial.modelos.Usuario;
import gestao.predial.seguranca.UsuarioLogado;

@Controller
public class IndexController {
	
	private Result result;
	
	@Inject
	public IndexController(Result result) {
		this.result = result;
	}
	
	@Deprecated
	public IndexController() {}
	
    @Path("/")
    public void index(){
    	
    }
    
    @Path("telefone-uteis")
    public void telefoneuteis() {}
    
    @Path("portfolio")
    public void portfolio() {}
}