package br.com.caelum.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {

	@RequestMapping("/adicionaConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {
		
		if(result.hasErrors()) {
			return "conta/formulario";
		}
		
		ContaDAO dao = new ContaDAO();
		dao.adiciona(conta);
		return "conta-adicionada";
	}

	@RequestMapping(value = "/form")
	public String form() {
		return "conta/formulario";
	}

	@RequestMapping("/removeConta")
	public String remove(Conta conta) {
		ContaDAO dao = new ContaDAO();
		dao.remove(conta);
		return "redirect:listaContas";
	}
	
	@RequestMapping("/mostraConta")
	public String mostra(Long id, Model model) {
	  ContaDAO dao = new ContaDAO();
	  model.addAttribute("conta", dao.buscaPorId(id));
	  return "conta/mostra";
	}
	
	@RequestMapping("/pagaConta")
	public void paga(Long id, HttpServletResponse response) {
	  ContaDAO dao = new ContaDAO();
	  dao.paga(id);
	  response.setStatus(200);
	}
	
	@RequestMapping("/alteraConta")
	public String altera(Conta conta) {
	  ContaDAO dao = new ContaDAO();
	  dao.altera(conta);
	  return "redirect:listaContas";
	}

	@RequestMapping("/listaContas")
	public ModelAndView lista() {
		ContaDAO dao = new ContaDAO();
		List<Conta> contas = dao.lista();
		System.out.println(contas);
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("todasContas", contas);
		return mv;
	}
}