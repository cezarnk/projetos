package gestao.predial.spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gestao.predial.spring.dao.PerfilDAO;
import gestao.predial.spring.model.Perfil;

@Controller
@RequestMapping("/perfil/**")
public class PerfilController {
	
	@Autowired
	private PerfilDAO perfilDao;
	
	@RequestMapping(value = "/perfil/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Perfil", perfilDao.find(id));
		return "perfil/lista";
	}
	


	@RequestMapping(value = "/perfil/listaPerfil", method = RequestMethod.GET)
	@ResponseBody
	public List<Perfil> listaPerfil(ModelMap modelMap) {
		return perfilDao.listaPerfil();
	}
	

	@RequestMapping(value = "/perfil/form", method = RequestMethod.GET)
	public String form(ModelMap modelMap) {
		modelMap.addAttribute("Perfil", new Perfil());
		return "perfil/formulario";
	}

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
	
	@RequestMapping(value = "/perfil/{id}/form", method = RequestMethod.GET)
	public String atualizaForms(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Perfil", perfilDao.find(id));
		return "perfil/atualiza";
	}

		

}
