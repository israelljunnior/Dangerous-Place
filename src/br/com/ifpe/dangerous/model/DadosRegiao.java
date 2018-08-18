package br.com.ifpe.dangerous.model;

import java.util.List;

public class DadosRegiao {
	
	private RegiaoAssaltos rAssaltos;
	private RegiaoAssassinatos rAssassinatos;
	
	public DadosRegiao(RegiaoAssaltos rAssaltos, RegiaoAssassinatos rAssassinatos) {
		
		this.rAssaltos = rAssaltos;
		this.rAssassinatos = rAssassinatos;
	}

	public RegiaoAssaltos getrAssaltos() {
		return rAssaltos;
	}

	public void setrAssaltos(RegiaoAssaltos rAssaltos) {
		this.rAssaltos = rAssaltos;
	}

	public RegiaoAssassinatos getrAssassinatos() {
		return rAssassinatos;
	}

	public void setrAssassinatos(RegiaoAssassinatos rAssassinatos) {
		this.rAssassinatos = rAssassinatos;
	}

}
