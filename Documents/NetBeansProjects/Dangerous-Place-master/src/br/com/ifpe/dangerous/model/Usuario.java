package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="id_usuario")
private int id;
@Column
private String nome;
@Column
private String email;
@Column
private String senha;
@Column
private String sexo;
@Column
private String endereco;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getNome() {
	return nome;
}

public void setNome(String nome) {
	this.nome = nome;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getSenha() {
	return senha;
}

public void setSenha(String senha) {
	this.senha = senha;
}

public String getSexo() {
	return sexo;
}

public void setSexo(String sexo) {
	this.sexo = sexo;
}

public String getEndereco() {
	return endereco;
}

public void setEndereco(String endereco) {
	this.endereco = endereco;
}

}
