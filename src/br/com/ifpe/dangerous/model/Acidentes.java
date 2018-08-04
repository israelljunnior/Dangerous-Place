package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="dados_acidentes")
public class Acidentes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_dados_acidentes")
	private int id;
	@Column
	private String natureza;
	@Column
	private String tipo;
	@Column
	private String endereco;
	@Column
	private String bairro;
	@Column
	private int onibus;
	@Column
	private int vitima;
	@Column
	private int viatura;
	@Column
	private int pedestre;
	@Column
	private int ciclista;
	@Column
	private int auto;
	@Column
	private int moto;
	@Column
	private int caminhao;
	@ManyToOne
	@JoinColumn(name="id_dados_municipios")
	private Municipio municipio;
	
	
	public String getNatureza() {
		return natureza;
	}
	public void setNatureza(String natureza) {
		this.natureza = natureza;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public int getOnibus() {
		return onibus;
	}
	public void setOnibus(int onibus) {
		this.onibus = onibus;
	}
	public int getVitima() {
		return vitima;
	}
	public void setVitima(int vitima) {
		this.vitima = vitima;
	}
	public int getViatura() {
		return viatura;
	}
	public void setViatura(int viatura) {
		this.viatura = viatura;
	}
	public int getPedestre() {
		return pedestre;
	}
	public void setPedestre(int pedestre) {
		this.pedestre = pedestre;
	}
	public int getCiclista() {
		return ciclista;
	}
	public void setCiclista(int ciclista) {
		ciclista = ciclista;
	}
	public int getAuto() {
		return auto;
	}
	public void setAuto(int auto) {
		this.auto = auto;
	}
	public int getMoto() {
		return moto;
	}
	public void setMoto(int moto) {
		this.moto = moto;
	}
	public int getCaminhao() {
		return caminhao;
	}
	public void setCaminhao(int caminhao) {
		this.caminhao = caminhao;
	}
	public Municipio getMunicipio() {
		return municipio;
	}
	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}
	
	

}
