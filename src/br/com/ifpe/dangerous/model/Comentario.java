package br.com.ifpe.dangerous.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

public class Comentario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_comentario")
	private int id;
	@Column
	private String conteudo;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date data;
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;
	@ManyToOne
	@JoinColumn(name="id_publicacao")
	private Publicacao publicacao;
	
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
	public Publicacao getPublicacao() {
		return publicacao;
	}
	public void setPublicacao(Publicacao publicacao) {
		this.publicacao = publicacao;
	}

}
