package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class MunicipioCvli {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_dados_municipios_cvli")
	private int id;
	@Column
	private int totalCvli;
	private int quantidadeMulher;
	private int quantidadeHomem;
	private int quantidadeConflitoFam;
	private int quantidadeConflitoComu;
	private int quantidadeCriminal;
	private int quantidadeHomicidio;
	private int quantidadeLatrocinio;
	private int quantidadeLesadoMorte;
	private int quantidadeArmabranca;
	private int quantidadeArmafogo;
	private int idadeAte12;
	private int idade13a17;
	private int idade18a30;
	private int idade31a65;
	private Municipio municipio;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTotalCvli() {
		return totalCvli;
	}
	public void setTotalCvli(int totalCvli) {
		this.totalCvli = totalCvli;
	}
	public int getQuantidadeMulher() {
		return quantidadeMulher;
	}
	public void setQuantidadeMulher(int quantidadeMulher) {
		this.quantidadeMulher = quantidadeMulher;
	}
	public int getQuantidadeHomem() {
		return quantidadeHomem;
	}
	public void setQuantidadeHomem(int quantidadeHomem) {
		this.quantidadeHomem = quantidadeHomem;
	}
	public int getQuantidadeConflitoFam() {
		return quantidadeConflitoFam;
	}
	public void setQuantidadeConflitoFam(int quantidadeConflitoFam) {
		this.quantidadeConflitoFam = quantidadeConflitoFam;
	}
	public int getQuantidadeConflitoComu() {
		return quantidadeConflitoComu;
	}
	public void setQuantidadeConflitoComu(int quantidadeConflitoComu) {
		this.quantidadeConflitoComu = quantidadeConflitoComu;
	}
	public int getQuantidadeCriminal() {
		return quantidadeCriminal;
	}
	public void setQuantidadeCriminal(int quantidadeCriminal) {
		this.quantidadeCriminal = quantidadeCriminal;
	}
	public int getQuantidadeHomicidio() {
		return quantidadeHomicidio;
	}
	public void setQuantidadeHomicidio(int quantidadeHomicidio) {
		this.quantidadeHomicidio = quantidadeHomicidio;
	}
	public int getQuantidadeLatrocinio() {
		return quantidadeLatrocinio;
	}
	public void setQuantidadeLatrocinio(int quantidadeLatrocinio) {
		this.quantidadeLatrocinio = quantidadeLatrocinio;
	}
	public int getQuantidadeLesadoMorte() {
		return quantidadeLesadoMorte;
	}
	public void setQuantidadeLesadoMorte(int quantidadeLesadoMorte) {
		this.quantidadeLesadoMorte = quantidadeLesadoMorte;
	}
	public int getQuantidadeArmabranca() {
		return quantidadeArmabranca;
	}
	public void setQuantidadeArmabranca(int quantidadeArmabranca) {
		this.quantidadeArmabranca = quantidadeArmabranca;
	}
	public int getQuantidadeArmafogo() {
		return quantidadeArmafogo;
	}
	public void setQuantidadeArmafogo(int quantidadeArmafogo) {
		this.quantidadeArmafogo = quantidadeArmafogo;
	}
	public int getIdadeAte12() {
		return idadeAte12;
	}
	public void setIdadeAte12(int idadeAte12) {
		this.idadeAte12 = idadeAte12;
	}
	public int getIdade13a17() {
		return idade13a17;
	}
	public void setIdade13a17(int idade13a17) {
		this.idade13a17 = idade13a17;
	}
	public int getIdade18a30() {
		return idade18a30;
	}
	public void setIdade18a30(int idade18a30) {
		this.idade18a30 = idade18a30;
	}
	public int getIdade31a65() {
		return idade31a65;
	}
	public void setIdade31a65(int idade31a65) {
		this.idade31a65 = idade31a65;
	}
	public Municipio getMunicipio() {
		return municipio;
	}
	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}

}
