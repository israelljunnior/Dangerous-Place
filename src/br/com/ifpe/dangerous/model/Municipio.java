package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Municipio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_dados_municipios")
	private int id;
	@Column(name="dados_municipios")
	private String nomeMunicipio;
	

}
