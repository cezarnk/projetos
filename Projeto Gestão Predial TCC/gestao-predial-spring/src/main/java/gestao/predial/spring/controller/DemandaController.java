package gestao.predial.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gestao.predial.spring.dao.DemandaDAO;
import gestao.predial.spring.model.Demanda;

@Controller
@RequestMapping("/demanda/**")
public class DemandaController {

	@Autowired
	private DemandaDAO demandaDao;
	
	@RequestMapping(value = "/demanda/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Demanda", demandaDao.find(id));
		return "demanda/lista";
	}
	
	@RequestMapping(value = "/demanda", method = RequestMethod.GET)
	public String list(ModelMap modelMap) {
		modelMap.addAttribute("Demanda", demandaDao.findAll());
		return "demanda/lista";
	}
	
	@RequestMapping(value = "/demanda/listaDemandas", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> listaDemandas(ModelMap modelMap) {
		return demandaDao.listaDemandas();
	}

	@RequestMapping(value = "/demanda/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") int id) {
		demandaDao.remove(demandaDao.find(id));
		return "redirect:/demanda"; 
	}
	

	@RequestMapping(value = "/demanda/form", method = RequestMethod.GET)
	public String form(ModelMap modelMap) {
		modelMap.addAttribute("Demanda", new Demanda());
		return "demanda/formulario";
	}

	@RequestMapping(value = "/demanda", method = RequestMethod.POST)
	public String create(@ModelAttribute("Demanda") Demanda demanda) {
		demandaDao.persist(demanda);
		return "redirect:/demanda";
	}

	@RequestMapping(value = "/demanda/{id}/form", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Demanda", demandaDao.find(id));
		return "demanda/atualiza";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String update(@ModelAttribute("Demanda") Demanda demanda) {
		demandaDao.merge(demanda);
		return "redirect:/demanda";
	}
}
