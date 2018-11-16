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




/** REST Spring MVC */ 
 
@RestController
public class HelloWorldRestController {
 
    @Autowired
    UserService userService;  //Service which will do all data retrieval/manipulation work
 
     
    //-------------------Retrieve All Users--------------------------------------------------------
     
    @RequestMapping(value = "/user/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.findAllUsers();
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }
 
 
    //-------------------Retrieve Single User--------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("id") long id) {
        System.out.println("Fetching User with id " + id);
        User user = userService.findById(id);
        if (user == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
 
     
     
    //-------------------Create a User--------------------------------------------------------
     
    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody User user,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + user.getName());
 
        if (userService.isUserExist(user)) {
            System.out.println("A User with name " + user.getName() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
 
        userService.saveUser(user);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
 
     
    //------------------- Update a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<User> updateUser(@PathVariable("id") long id, @RequestBody User user) {
        System.out.println("Updating User " + id);
         
        User currentUser = userService.findById(id);
         
        if (currentUser==null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
 
        currentUser.setName(user.getName());
        currentUser.setAge(user.getAge());
        currentUser.setSalary(user.getSalary());
         
        userService.updateUser(currentUser);
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }
 
    //------------------- Delete a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteUser(@PathVariable("id") long id) {
        System.out.println("Fetching & Deleting User with id " + id);
 
        User user = userService.findById(id);
        if (user == null) {
            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
 
        userService.deleteUserById(id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
 
     
    //------------------- Delete All Users --------------------------------------------------------
     
    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteAllUsers() {
        System.out.println("Deleting All Users");
 
        userService.deleteAllUsers();
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
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
