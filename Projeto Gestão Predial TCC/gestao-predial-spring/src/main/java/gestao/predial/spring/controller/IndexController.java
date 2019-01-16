package gestao.predial.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping(value = "/portfolio")
	public String portfolio() {
		return "index/portfolio";
	}
	
	@RequestMapping(value = "/index")
	public String index() {
		return "index/index";
	}
}
