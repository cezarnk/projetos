package gestao.predial.spring.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gestao.predial.spring.dao.UsuarioDAO;
import gestao.predial.spring.model.Usuario;

@Controller
@RequestMapping("/usuario/**")
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@RequestMapping(value = "/usuario/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Usuario", usuarioDao.find(id));
		return "usuario/lista";
	}
	
	@RequestMapping(value = "/usuario", method = RequestMethod.GET)
	public String list(ModelMap modelMap) {
		modelMap.addAttribute("Usuario", usuarioDao.findAll());
		return "usuario/lista";
	}

	@RequestMapping(value = "/usuario/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") int id) {
		usuarioDao.remove(usuarioDao.find(id));
		return "redirect:/usuario"; 
	}
	

	@RequestMapping(value = "/usuario/form", method = RequestMethod.GET)
	public String form(ModelMap modelMap) {
		modelMap.addAttribute("Usuario", new Usuario());
		return "usuario/formulario";
	}

	@RequestMapping(value = "/usuario", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("Usuario") Usuario usuario,BindingResult result) {
	    // se tiver erro, redirecione para o formulário
	    if(result.hasErrors()) {
	      return "usuario/formulario";
	    }		
		usuarioDao.persist(usuario);
		return "redirect:/usuario";
	}

	@RequestMapping(value = "/usuario/{id}/form", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Usuario", usuarioDao.find(id));
		return "usuario/atualiza";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String update(@ModelAttribute("Usuario") Usuario usuario) {
		usuarioDao.merge(usuario);
		return "redirect:/usuario";
	}	
	
}
