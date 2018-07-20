package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class Publicacao {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_publicação")
	private int id;
	@Column
	private String tipo;
	@Column
	private String titulo;
	@Column
	private String tema;
	@Column
	private String conteudo;
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario idUsuario;
	@ManyToOne
	@JoinColumn(name="id_adm")
	private Adm idAdm;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getTema() {
		return tema;
	}
	public void setTema(String tema) {
		this.tema = tema;
	}
	public String getConteudo() {
		return conteudo;
	}
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	public Usuario getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Usuario idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Adm getIdAdm() {
		return idAdm;
	}
	public void setIdAdm(Adm idAdm) {
		this.idAdm = idAdm;
	}

}
