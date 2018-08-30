package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dados_regiao_viol_sex")
public class RegiaoViolenciaSexual {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_dados_regiao_viol_sex")
	private int id;

	@Column
	private int ano;
	
	@Column
	private String regiao;
	
	@Column(name="total_viol_sex")
	private int totalSex;

	
	
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
		return regiao;
	}

	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}

	public int getTotalSex() {
		return totalSex;
	}

	public void setTotalSex(int totalSex) {
		this.totalSex = totalSex;
	}
	
	
	
}
