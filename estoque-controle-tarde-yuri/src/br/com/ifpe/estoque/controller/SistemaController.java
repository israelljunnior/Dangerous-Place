package br.com.ifpe.estoque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SistemaController {

	
	@RequestMapping("olamundoSpring")
	public String olaMundo() {
		System.out.println("Spring MVC");
		return "olaMundo";
	}
}
