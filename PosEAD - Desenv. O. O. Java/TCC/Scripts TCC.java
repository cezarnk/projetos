/** Controller - Spring MVC */

// C1
@Controller
public class HomeController {
 
  @RequestMapping("/")
  public String index() {
    return "index.jsp";
  }
}

// C2
@Controller //Define que minha classe será um controller
public class HomeController {
 
} 

// C3
@Controller //Define que minha classe será um controller
public class HomeController {
     
    @RequestMapping("/home") //Define a url que quando for requisitada chamara o metodo
    public ModelAndView home(){
         //Retorna a view que deve ser chamada, no caso home (home.jsp) aqui o .jsp é omitido
        return new ModelAndView("home");
    }
     
} 

// C4
@Controller //Define que minha classe será um controller
@RequestMapping("/home") //Define que qualquer ação desse controler deve preceder /home
public class HomeController {
     
    //Define a url que quando for requisitada chamara o metodo no caso /home/principal ou /home/ ou /home
    //Note que não é obrigado apenas uma url, pode-se mapear varias para o mesmo metodo 
    @RequestMapping( value = { "/" , "" ,"/principal" }) 
    public ModelAndView homePrincipal(){
         //Retorna a view que deve ser chamada, no caso principal (principal.jsp) que esta dentro da pasta /home
        return new ModelAndView("home/principal");
    }
     
    //Define a url que quando for requisitada chamara o metodo
    @RequestMapping( "/secundaria" ) 
    public ModelAndView homeSecundaria(){
         //Retorna a view que deve ser chamada, no caso secundaria (secundaria.jsp) que esta dentro da pasta /home
        return new ModelAndView("home/secundaria");
    }
     
}

// C5

@Controller
public class HelloController {
   @RequestMapping(value = "/hello", method = RequestMethod.GET)
   public String printHello(ModelMap model) {
      model.addAttribute("message", "Hello Spring MVC Framework!");
      return "hello";
   }
}

// V1
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Lista de Produtos</title>
</head>
<body>
    <h1>Exibir Mensagem - Spring MVC</h1>
    
    <c:if test="${not empty mensagem}">
        <span class="alert alert-success">${mensagem}</span>
    </c:if>
    
</body>
</html>


/** Ioc DI Injeção de Dependencia - Spring MVC */
Controlador:

// Di1
@Controller
public class TarefasController {
    private final JdbcTarefaDao dao;
 
    @Autowired
    public TarefasController(JdbcTarefaDao dao) {
        this.dao = dao;
    }
 
}

DAO:

@Repository
public class JdbcTarefaDao {
    private final Connection connection;
 
    @Autowired
    public JdbcTarefaDao(DataSource dataSource) throws SQLException {
        this.connection = dataSource.getConnection();
    }
    // Resto do DAO, usando a connection sem instanciá-la em cada método
}

@Component
public class Cliente {
 
    private String nome;
     
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
}

@Service
public class ClienteService {
 
    @Autowired
    ClienteDao clienteDAO;
    @Autowired
    Cliente cliente;
  
    public void save() {
        cliente.setNome("Leonel Messi");
        System.out.println("Cliente foi manipulado no Service");
        clienteDAO.save(cliente);
    }
}

/** Interceptor - Spring MVC */ 

// Interceptor - I1
@Override
public boolean preHandle(
  HttpServletRequest request,
  HttpServletResponse response, 
  Object handler) throws Exception {
    // your code
    return true;
}

// Interceptor - I2
@Override
public void postHandle(
  HttpServletRequest request, 
  HttpServletResponse response,
  Object handler, 
  ModelAndView modelAndView) throws Exception {
    // your code
}

// Interceptor - I3
@Override
public void afterCompletion(
  HttpServletRequest request, 
  HttpServletResponse response,
  Object handler, Exception ex) {
    // your code
}

/** Validator - Spring MVC */ 

// Validator - V1
public class Tarefa {

    private Long id;

    @Size(min=5)
    private String descricao;

    private boolean finalizado;
    private Calendar dataFinalizacao;

    //...
}

// Validator - V2
@RequestMapping("adicionaTarefa")
public String adiciona(@Valid Tarefa tarefa) {
    JdbcTarefaDao dao = new JdbcTarefaDao();        
    dao.adiciona(tarefa);
    return "tarefa/adicionada";
}

// Validator - V3
@RequestMapping("adicionaTarefa")
public String adiciona(@Valid Tarefa tarefa, BindingResult result) {

    if(result.hasFieldErrors("descricao")) {
        return "tarefa/formulario";
    }

    JdbcTarefaDao dao = new JdbcTarefaDao();
    dao.adiciona(tarefa);
    return "tarefa/adicionada";
}

// Validator - V4
@RequestMapping("adicionaTarefa")
public String adiciona(@Valid Tarefa tarefa, BindingResult result) {

if(result.hasErrors()) {
    return "tarefa/formulario";
}

// Validator - V5
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<body>
    <h3>Adicionar tarefas</h3>
    <form action="adicionaTarefa" method="post">
        Descrição:
            <br/>
        <textarea rows="5" cols="100" name="descricao"></textarea> 
            <br/>         
        <form:errors path="tarefa.descricao" cssStyle="color:red"/>
            <br/>
        <input type="submit" value="Adicionar"/>
    </form>
</body>
</html>



/** VRaptor Controller - C1 */
@Controller
public class UsuarioController {
 	public void lista() {
... 
}
}

/** VRaptor Controller - C2 */
@Get("alguma/outra/url")
public void lista(){ ... }


/** VRaptor Views - V1 */
@Controller
class ClientController {

    @Inject
    private Result result;

    public void busca(int id) {
        result.include("mensagem", "Alguma mensagem");
        result.include("cliente", new Cliente(id));
    }
}

/** VRaptor Views - V2 */
@Controller
class ClientController {

    @Inject
    private Result result;

    public void busca(int id) {
        result.include("Alguma mensagem").include(new Cliente(id));
    }
}

/** VRaptor Views - V3 */
public class ClientsController {
    public void list() { 
        //... 
    }
}


/** VRaptor Views - V4 */
@Specializes
public class FreemarkerPathResolver extends DefaultPathResolver {
    protected String getPrefix() {
        return "/WEB-INF/freemarker/";
    }

    protected String getExtension() {
        return "ftl";
    }
}


/** VRaptor Views - V5 */
@Controller
public class ClientsController {

    @Inject
    private Result result;

    public void list() { ... }

    public void save(Client client) {
        //...
        result.use(Results.logic()).redirectTo(ClientsController.class).list();
    }
}


/** VRaptor DI - D1 */
@Controller
public class ClienteController {

    private final ClienteDao dao;

    /**
     * @deprecated CDI eyes only
     */
    protected ClienteController() {
        this(null);
    }

    @Inject
    public ClienteController(ClienteDao dao) {
        this.dao = dao;
    }

    @Post
    public void adiciona(Cliente cliente) {
        this.dao.adiciona(cliente);
    }
}

/** VRaptor DI - D1 */
@Named
public class ClienteService {
 
    @Inject
    ClienteDao clienteDAO;
    @Inject
    Cliente cliente;
  
    public void grava() {
        ...
    }

// D2
@ApplicationScoped
public class HibernateControl {

    private final SessionFactory factory;

    public HibernateControl() {
        this.factory = new AnnotationConfiguration().configure().buildSessionFactory();
    }

    public Session getSession() {
        return factory.openSession();
    }
}

/** Inserir código VRaptor Validator – V1 */ 
//Validador Clássico
if(cliente.getNome() == null){
    //Mensagem simples
    validator.add(new SimpleMessage("nome","O nome deve ser preenchid"));

    //Mensagem internacionalizada
    validator.add(new I18Message("nome","O nome deve ser preenchid"));
}

//Validador atraves do Bean Validation
@Post
public void adiciona(@NotNull @Valid Cliente cliente){
    validator.onErrorForwardTo(this).form();
    dao.inserir(cliente);
    result.redirectTo(this).listar();
}

//Validador Fluente
validator.addIf(cliente.getNome() == null, new SimpleMessage("nome","O nome deve ser preenchid"));

validator.ensure(cliente.getNome() != null, new SimpleMessage("nome","O nome deve ser preenchid"));





    