package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="dados_municipio_cvp")
public class MunicipioCvp {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_dados_municipio_cvp")
	private int id;
	@Column(name = "roubo_transeunte")
	private int rouboTranseunte;
	@Column(name = "roubo_veiculo")
	private int rouboVeiculo;
	@Column(name = "roubo_extorsao")
	private int rouboExtorsao;
	@Column(name = "roubo_inst_financ")
	private int rouboInstFinanc;
	@Column(name = "roubo_carga")
	private int rouboCarga;
	@Column(name = "roubo_motoneta")
	private int rouboMotoneta;
	@Column(name = "roubo_onibus")
	private int rouboOnibus;
	@Column(name = "roubo_residencias")
	private int rouboResidencias;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "id_dados_municipios")
	private Municipio municipio;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRouboTranseunte() {
		return rouboTranseunte;
	}

	public void setRouboTranseunte(int rouboTranseunte) {
		this.rouboTranseunte = rouboTranseunte;
	}

	public int getRouboVeiculo() {
		return rouboVeiculo;
	}

	public void setRouboVeiculo(int rouboVeiculo) {
		this.rouboVeiculo = rouboVeiculo;
	}

	public int getRouboExtorsao() {
		return rouboExtorsao;
	}

	public void setRouboExtorsao(int rouboExtorsao) {
		this.rouboExtorsao = rouboExtorsao;
	}

	public int getRouboInstFinanc() {
		return rouboInstFinanc;
	}

	public void setRouboInstFinanc(int rouboInstFinanc) {
		this.rouboInstFinanc = rouboInstFinanc;
	}

	public int getRouboCarga() {
		return rouboCarga;
	}

	public void setRouboCarga(int rouboCarga) {
		this.rouboCarga = rouboCarga;
	}

	public int getRouboMotoneta() {
		return rouboMotoneta;
	}

	public void setRouboMotoneta(int rouboMotoneta) {
		this.rouboMotoneta = rouboMotoneta;
	}

	public int getRouboOnibus() {
		return rouboOnibus;
	}

	public void setRouboOnibus(int rouboOnibus) {
		this.rouboOnibus = rouboOnibus;
	}

	public int getResidencias() {
		return rouboResidencias;
	}

	public void setResidencias(int residencias) {
		this.rouboResidencias = residencias;
	}

	public Municipio getMunicipio() {
		return municipio;
	}

	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}

	public int getTotal() {
		return this.rouboResidencias + this.rouboOnibus + this.rouboMotoneta + this.rouboCarga + this.rouboInstFinanc + this.rouboExtorsao + this.rouboVeiculo + this.rouboTranseunte;
	}

}
