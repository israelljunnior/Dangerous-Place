package br.com.ifpe.dangerous.model;

import java.util.List;

public class DadosMunicipio {
	
	private List<MunicipioAssaltos> mAssaltos;
	private List<MunicipioAssassinatos> mAssassinatos;
	private List <MunicipioViolenciaSexual> mViolSex;
	
	public DadosMunicipio(List<MunicipioAssaltos> mAssaltos, List<MunicipioAssassinatos> mAssassinatos, List<MunicipioViolenciaSexual> mViolSex) {
		
		this.mAssaltos = mAssaltos;
		this.mAssassinatos = mAssassinatos;
		this.mViolSex = mViolSex;
		
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

	public List<MunicipioViolenciaSexual> getmViolSex() {
		return mViolSex;
	}

	public void setmViolSex(List<MunicipioViolenciaSexual> mViolSex) {
		this.mViolSex = mViolSex;
	}

	
	
}
