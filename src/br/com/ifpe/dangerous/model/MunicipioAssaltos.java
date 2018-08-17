package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="id_dados_mun_assalt")
public class MunicipioAssaltos{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_dados_mun_assalt")
	private int id;
	@Column
	private int ano;
	@Column
	private String municipio;
	@Column(name = "total_assalt")
	private int totalAssaltos;
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
	@Column(name = "roubo_estabelecimento")
	private int rouboEstabelecimento;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getRegiao() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public int getTotalAssaltos() {
		return totalAssaltos;
	}
	public void setTotalAssaltos(int totalAssaltos) {
		this.totalAssaltos = totalAssaltos;
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
	public int getRouboResidencias() {
		return rouboResidencias;
	}
	public void setRouboResidencias(int rouboResidencias) {
		this.rouboResidencias = rouboResidencias;
	}
	public int getRouboEstabelecimento() {
		return rouboEstabelecimento;
	}
	public void setRouboEstabelecimento(int rouboEstabelecimento) {
		this.rouboEstabelecimento = rouboEstabelecimento;
	}
	
	
	 

}
