package br.com.ifpe.dangerous.model;

import java.util.List;

public class DadosMunicipio {
	
	private MunicipioAssaltos mAssaltos;
	private MunicipioAssassinatos mAssassinatos;
	
	public DadosMunicipio(MunicipioAssaltos mAssaltos, MunicipioAssassinatos mAssassinatos) {
		
		this.mAssaltos = mAssaltos;
		this.mAssassinatos = mAssassinatos;
		
	}

	public MunicipioAssaltos getmAssaltos() {
		return mAssaltos;
	}

	public void setmAssaltos(MunicipioAssaltos mAssaltos) {
		this.mAssaltos = mAssaltos;
	}

	public MunicipioAssassinatos getmAssassinatos() {
		return mAssassinatos;
	}

	public void setmAssassinatos(MunicipioAssassinatos mAssassinatos) {
		this.mAssassinatos = mAssassinatos;
	}
	
}
