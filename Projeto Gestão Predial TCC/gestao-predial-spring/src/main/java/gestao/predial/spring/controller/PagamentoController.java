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

import gestao.predial.spring.dao.PagamentoDAO;
import gestao.predial.spring.model.Pagamento;

@Controller
@RequestMapping("/pagamento/**")
public class PagamentoController {
	
	@Autowired
	private PagamentoDAO pagamentoDao;
	
	@RequestMapping(value = "/pagamento/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Pagamento", pagamentoDao.find(id));
		return "pagamento/lista";
	}
	
	@RequestMapping(value = "/pagamento", method = RequestMethod.GET)
	public String list(ModelMap modelMap) {
		modelMap.addAttribute("Pagamento", pagamentoDao.findAll());
		return "pagamento/lista";
	}
	
	@RequestMapping(value="/pagamento/listajson", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> listJson(ModelMap modelMap){
		return pagamentoDao.listaJson();
	}
	
	@RequestMapping(value = "/pagamento/json", method = RequestMethod.GET)
	@ResponseBody
	public List<Pagamento> lista(ModelMap modelMap) {
		return pagamentoDao.findAll();
	}

	@RequestMapping(value = "/pagamento/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") int id) {
		pagamentoDao.remove(pagamentoDao.find(id));
		return "redirect:/pagamento"; 
	}
	
	@RequestMapping(value="pagamento/removeConta",method = RequestMethod.DELETE)
	public String remove(int id) {
		pagamentoDao.remove(pagamentoDao.find(id));
		return "redirect:/pagamento";
	}

	@RequestMapping(value = "/pagamento/form", method = RequestMethod.GET)
	public String form(ModelMap modelMap) {
		modelMap.addAttribute("Pagamento", new Pagamento());
		return "pagamento/formulario";
	}

	@RequestMapping(value = "/pagamento", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("Pagamento") Pagamento pagamento,BindingResult result) {
		if(result.hasErrors()) {
	      return "pagamento/formulario";
	    }
		
		pagamentoDao.persist(pagamento);
		return "redirect:/pagamento";
	}

	@RequestMapping(value = "/pagamento/{id}/form", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("Pagamento", pagamentoDao.find(id));
		return "pagamento/atualiza";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String update(@ModelAttribute("Pagamento") Pagamento pagamento) {
		pagamentoDao.merge(pagamento);
		return "redirect:/pagamento";
	}
}
