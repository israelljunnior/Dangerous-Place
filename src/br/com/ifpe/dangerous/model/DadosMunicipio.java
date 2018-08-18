package br.com.ifpe.dangerous.model;

import java.util.List;

public class DadosMunicipio {
	
	private List<MunicipioAssaltos> mAssaltos;
	private List<MunicipioAssassinatos> mAssassinatos;
	
	public DadosMunicipio(List<MunicipioAssaltos> mAssaltos, List<MunicipioAssassinatos> mAssassinatos) {
		
		this.mAssaltos = mAssaltos;
		this.mAssassinatos = mAssassinatos;
		
	}

	public List<MunicipioAssaltos> getmAssaltos() {
		return mAssaltos;
	}

	public void setmAssaltos(List<MunicipioAssaltos> mAssaltos) {
		this.mAssaltos = mAssaltos;
	}

	public List<MunicipioAssassinatos> getmAssassinatos() {
		return mAssassinatos;
	}

	public void setmAssassinatos(List<MunicipioAssassinatos> mAssassinatos) {
		this.mAssassinatos = mAssassinatos;
	}
	
}
