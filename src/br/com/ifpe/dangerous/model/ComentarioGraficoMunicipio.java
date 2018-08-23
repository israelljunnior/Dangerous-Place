package br.com.ifpe.dangerous.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="comentario_municipio")
public class ComentarioGraficoMunicipio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_comentario_municipio")
	private int id;
	@Column
	private String conteudo;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="data_hora")
	private Date data;
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;
	@ManyToOne
	@JoinColumn(name="id_municipio")
	private MunicipioAssaltos municipioAssaltos;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public MunicipioAssaltos getMunicipioAssaltos() {
		return municipioAssaltos;
	}
	public void setMunicipioAssaltos(MunicipioAssaltos municipioAssaltos) {
		this.municipioAssaltos = municipioAssaltos;
	}
	
	
}
