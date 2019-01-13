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

import gestao.predial.spring.dao.UsuarioDAO;
import gestao.predial.spring.model.Usuario;

@Controller
@SessionAttributes("usuarioLogado")
public class LoginController {
	
	@Autowired
	public UsuarioDAO usuarioDao;

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "login/form";
	}
	

	@RequestMapping("/login/efetuaLogin")
	  public String efetuaLogin(Usuario usuario, HttpSession session) {
		
		if(usuarioDao.busca(usuario)) {
	      // usuario existe, guardaremos ele na session
	      session.setAttribute("usuarioLogado", usuario);
	      session.setAttribute("usuarioNome",usuario.getNome_guerra());
	      return "redirect:/";
	    }
	    // ele errou a senha, voltou para o formulario
	    return "login/form";
	  }
	
	
	@RequestMapping("/login/loginEfetua")
    public String autentica(Usuario usuario,HttpSession session,Model model){
    	Usuario us = usuarioDao.procura(usuario);
    	
    	if(us != null){
    		session.setAttribute("usuarioLogado", us);
    		return "redirect:/";
    	} else {
    		System.out.println("não encontrado");
    		model.addAttribute("mensagem","Login ou senha invalido!");
    		return "login/form";
    	}
    }
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "login/form";
	}

}
