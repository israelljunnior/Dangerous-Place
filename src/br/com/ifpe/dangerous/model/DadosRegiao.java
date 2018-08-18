package br.com.ifpe.dangerous.model;

import java.util.List;

public class DadosRegiao {
	
	private List<RegiaoAssaltos > rAssaltos;
	private List<RegiaoAssassinatos> rAssassinatos;
	
	public DadosRegiao(List<RegiaoAssaltos> rAssaltos, List<RegiaoAssassinatos> rAssassinatos) {
		
		this.rAssaltos = rAssaltos;
		this.rAssassinatos = rAssassinatos;
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
