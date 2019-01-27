package gestao.predial.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import gestao.predial.spring.dao.PerfilDAO;
import gestao.predial.spring.dao.UsuarioDAO;
import gestao.predial.spring.model.Perfil;
import gestao.predial.spring.model.Usuario;

@Controller
@SessionAttributes("usuarioLogado")
public class LoginController {
	
	@Autowired
	public UsuarioDAO usuarioDao;
	
	@Autowired
	public PerfilDAO perfilDao;

	@RequestMapping("/")
	public String loginForm() {
		return "login/form";
	}
	

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
    		System.out.println("não encontrado");
    		model.addAttribute("mensagem","Login ou senha invalido!");
    		return "login/form";
    	}
    }
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/";
	}
	
	@RequestMapping("/cria-usuario")
	public String criarUsuario(Model model) {
		Perfil perfil = new Perfil();
		perfil.setNome("Administrador");
		perfil.setCpf("123.456.789-00");
		perfil.setData_nascimento("01/01/2019");
		perfil.setEstado_civil("Solteiro");
		perfil.setQnt_filhos(0);
		perfil.setEmail("adm@gpredial.com.br");
		perfil.setTelefone("(11) 2242-0000");
		perfil.setQnt_moradores(0);
		perfil.setAndar_ocupado(0);
		perfil.setAdministrador("true");
		perfilDao.persist(perfil);
		System.out.println(perfil.getId());
		Usuario usuario = new Usuario();
		usuario.setLogin("admin");
		usuario.setNome("Administrador Root");
		usuario.setNome_guerra("Administrador");
		usuario.setSenha("admin");
		usuario.setPerfilId(1);
		usuarioDao.persist(usuario);
		model.addAttribute("usuarioCriado","Login: "+usuario.getLogin()+" - Senha: "+usuario.getSenha());
		model.addAttribute("botao","btn");
		return "login/form";
	}

}
