//----------------------- Quadro 1 -------------------------

/** VRaptor **/

@Controller
public class PerfilController {

private PerfilDao perfilDao;

@Inject
public PerfilController(PerfilDao perfilDao) {
    this.perfilDao = perfilDao;				
}
	
@Deprecated
public PerfilController() {}
	
  
/** Spring MVC **/
    
@Controller
public class PerfilController {
	
@Autowired
private PerfilDAO perfilDao;
	

//----------------------- Quadro 2 -------------------------
    
/** VRaptor **/

@Post("perfil/adiciona")
@IncludeParameters
public void adiciona(@Valid Perfil perfil) {
    validator.onErrorForwardTo(this).form();
    perfilDao.adiciona(perfil);
    result.include("mensagem","Perfil cadastrado com sucesso!");
    result.redirectTo(this).lista();
}

@Delete("/perfil/remove")
public void remove(Perfil perfil) {
    perfilDao.remove(perfil);
    result.include("mensagem","Perfil removido com sucesso!");
    result.redirectTo(this).lista();
}

@Put("/perfil/edita")
public void edita(Perfil perfil){
    result.include(perfilDao.busca(perfil));
    result.redirectTo(this).form();
}

@Get("perfil/lista")
public void lista() {
    result.include("perfil",perfilDao.lista());
}
    
/** Spring MVC **/
    
@RequestMapping(value = "/perfil", method = RequestMethod.POST)
public String adiciona(@Valid @ModelAttribute("Perfil") Perfil perfil,BindingResult result) {
    if(result.hasErrors()) {
      return "perfil/formulario";
    }

    perfilDao.persist(perfil);
    return "redirect:/perfil";
}

@RequestMapping(value = "/perfil/{id}", method = RequestMethod.DELETE)
public String remove(@PathVariable("id") int id) {
    perfilDao.remove(perfilDao.find(id));
    return "redirect:/perfil"; 
}

@RequestMapping(method = RequestMethod.PUT)
public String edita(@ModelAttribute("Perfil") Perfil perfil) {
    perfilDao.merge(perfil);
    return "redirect:/perfil";
}

@RequestMapping(value = "/perfil", method = RequestMethod.GET)
public String lista(ModelMap modelMap) {
    modelMap.addAttribute("Perfil", perfilDao.findAll());
    return "perfil/lista";
}
    
//----------------------- Quadro 3 -------------------------
    
/** VRaptor **/ 
  
<form action="${linkTo[PerfilController].adiciona(null) }" method="POST">
<div class="row">
  <div class="col-md-7">
    <div class="form-group">
      <label for="nome">Nome:</label> <input type="text"
        placeholder="Digite o nome do usuario *" name="perfil.nome"
        class="form-control" value="${perfil.nome}" />      
    </div>
  </div>
        
/** Spring MVC **/
          
<form:form action="${url}" method="POST" modelAttribute="Perfil">
<div class="row">
  <div class="col-md-7">
    <div class="form-group">
      <label for="nome">Nome:</label> <input type="text"
        placeholder="Digite o nome do usuario *" name="nome"
        class="form-control" value="${perfil.nome}" /> 
    </div>
  </div>

//----------------------- Quadro 4 -------------------------         
          
/** VRaptor **/          

@Get("perfil/lista")
public void lista() {
    result.include("perfil",perfilDao.lista());
}   
  
/** Spring MVC **/
  
@RequestMapping(value = "/perfil", method = RequestMethod.GET)
public String lista(ModelMap modelMap) {
		modelMap.addAttribute("Perfil", perfilDao.findAll());
		return "perfil/lista";
}
  
//----------------------- Quadro 5 -------------------------     

/** Página JSP **/ 
  
<tbody>
<c:forEach items="${perfil}" var="perfil">
  <tr>
      <td>${perfil.id}</td>
      <td>${perfil.nome}</td>
      <td>${perfil.cpf}</td>
      <td>${perfil.data_nascimento}</td>
      <td>${perfil.estado_civil}</td>
      <td>${perfil.andar_ocupado}</td>
  </tr>
</c:forEach>
</tbody>
    
//----------------------- Quadro 6 -------------------------       
  
/** VRaptor **/
  
import javax.validation.Valid;
  
@Controller
public class PerfilController {

	private PerfilDao perfilDao;	
	private Validator validator;
  private Result result;
	
	@Inject
	public PerfilController(PerfilDao perfilDao,Validator validator, Result result) {
		this.perfilDao = perfilDao;
		this.validator = validator;
    this.result = result;
	}
	
  @Post("perfil/adiciona")	
	public void adiciona(@Valid Perfil perfil) {
		validator.onErrorForwardTo(this).form();
		perfilDao.adiciona(perfil);
		result.redirectTo(this).lista();
	}
  
/** Spring MVC **/
  
import javax.validation.Valid;

@Controller
@RequestMapping("/perfil/**")
public class PerfilController {
	
	@Autowired
	private PerfilDAO perfilDao;
  
  @RequestMapping(value = "/perfil", method = RequestMethod.POST)
	public String adiciona(@Valid @ModelAttribute("Perfil") Perfil perfil,BindingResult result) {
		if(result.hasErrors()) {
	      return "perfil/formulario";
	    }
		
		perfilDao.persist(perfil);
		return "redirect:/perfil";
  } 
  
//----------------------- Quadro 7 -------------------------      
  
/** Models **/
  
import java.io.Serializable;
  
@Entity
public class Pagamento implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private BigDecimal valor;
	private BigDecimal multa;
  
/** VRaptor **/

@Get("pagamento/listaPagamento")
public void listaPagamento() {
  List<Object[]> lista = pagamentoDao.listaJson();
    result.use(Results.json()).from(lista).serialize();
}
  
/** Spring MVC **/

import org.springframework.web.bind.annotation.ResponseBody;
  
@RequestMapping(value="/pagamento/listajson", method = RequestMethod.GET)
@ResponseBody
public List<Object[]> listJson(ModelMap modelMap){
  return pagamentoDao.listaJson();
}
  
//----------------------- Quadro 8 -------------------------      
  
/** VRaptor - LoginController **/
  
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
  
//----------------------- Quadro 9 -------------------------   

/** VRaptor - UsuarioLogado **/
  
import java.io.Serializable;

@Named
@SessionScoped
public class UsuarioLogado implements Serializable{
	private Usuario usuario;
  
  public void fazLogin(Usuario usuario){
		this.usuario = usuario;
	} 
  public boolean isLogado(){
		return this.usuario != null;
	}
}
  
//----------------------- Quadro 10 -------------------------   
  
/** VRaptor - AutorizaçãoInterceptor **/
  
public AutorizacaoInterceptor() {}
	
@Accepts
public boolean accept(){
  return !method.containsAnnotation(Open.class);
}

@AroundCall
public void intercept(SimpleInterceptorStack stack){
  if(usuarioLogado.isLogado()){
    stack.next();
  } else {
    result.redirectTo(LoginController.class).form();
  }
}
  
//----------------------- Quadro 11 -------------------------   
  
/** Spring MVC - LoginController **/
  
@RequestMapping("/login/efetuaLogin")
public String efetuaLogin(Usuario usuario, HttpSession session) {

if(usuarioDao.busca(usuario)) {
    // usuario existe, guardaremos ele na session
    session.setAttribute("usuarioLogado", usuario);
    session.setAttribute("usuarioNome",usuario.getNome_guerra());
    return "redirect:/index";
  }
  // ele errou a senha, voltou para o formulario
  return "redirect:/";
}
	
	
@RequestMapping("/login/loginEfetua")
public String autentica(Usuario usuario,HttpSession session,Model model){
  Usuario us = usuarioDao.procura(usuario);

  if(us != null){
    session.setAttribute("usuarioLogado", us);
    return "redirect:/index";
  } else {
    System.out.println("nÃ£o encontrado");
    model.addAttribute("mensagem","Login ou senha invalido!");
    return "login/form";
  }
}
  
//----------------------- Quadro 12 -------------------------   
  
/** Spring MVC - AutorizadorInterceptor **/
  
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
	throws Exception {
		
		String uri = request.getRequestURI();
		if(uri.endsWith("/") || uri.endsWith("loginEfetua") || uri.contains("resources")) {
			return true;
		}
		
		if(request.getSession().getAttribute("usuarioLogado")!=null) {
			return true;
		} else {
			response.sendRedirect("redirect:/");
			return false;
		}
		
	}
}