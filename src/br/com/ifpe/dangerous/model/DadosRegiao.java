package br.com.ifpe.dangerous.model;

import java.util.List;

public class DadosRegiao {
	
	private List<RegiaoAssaltos> rAssaltos;
	private List<RegiaoAssassinatos> rAssassinatos;
	private List<RegiaoViolenciaSexual> rViolSex;
	
	public DadosRegiao(List<RegiaoAssaltos> rAssaltos, List<RegiaoAssassinatos> rAssassinatos, List<RegiaoViolenciaSexual> rViolSex) {
		
		this.rAssaltos = rAssaltos;
		this.rAssassinatos = rAssassinatos;
		this.rViolSex = rViolSex;
		
	}

	public List<RegiaoViolenciaSexual> getrViolSex() {
		return rViolSex;
	}

	public void setrViolSex(List<RegiaoViolenciaSexual> rViolSex) {
		this.rViolSex = rViolSex;
	}

	public List<RegiaoAssaltos> getrAssaltos() {
		return rAssaltos;
	}

	public void setrAssaltos(List<RegiaoAssaltos> rAssaltos) {
		this.rAssaltos = rAssaltos;
	}

	public List<RegiaoAssassinatos> getrAssassinatos() {
		return rAssassinatos;
	}

	public void setrAssassinatos(List<RegiaoAssassinatos> rAssassinatos) {
		this.rAssassinatos = rAssassinatos;
	}

	

}
