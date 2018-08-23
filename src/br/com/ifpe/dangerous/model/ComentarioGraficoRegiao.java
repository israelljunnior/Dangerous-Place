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
@Table(name="comentario_regiao")
public class ComentarioGraficoRegiao {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_comentario_regiao")
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
	@JoinColumn(name="id_regiao")
	private RegiaoAssaltos regiaoAssaltos;
	
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
	public RegiaoAssaltos getRegiaoAssaltos() {
		return regiaoAssaltos;
	}
	public void setRegiaoAssaltos(RegiaoAssaltos regiaoAssaltos) {
		this.regiaoAssaltos = regiaoAssaltos;
	}
	
	
}
