package br.com.ifpe.dangerous.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dados_municipio_assassi")
public class MunicipioAssassinatos {
	

		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="id_dados_mun_assassi")
		private int id;
		@Column
		private int ano;
		@Column
		private String municipio;
		@Column(name="total_assassi")
		private int totalAssassinatos;
		@Column(name="qtd_mulher")
		private int quantidadeMulher;
		@Column(name="qtd_homem")
		private int quantidadeHomem;
		@Column(name="qtd_homicidio")
		private int quantidadeHomicidio;
		@Column(name="qtd_latrocinio")
		private int quantidadeLatrocinio;
		@Column(name="qtd_lesado_morte")
		private int quantidadeLesadoMorte;
		@Column(name="qtd_armabranca")
		private int quantidadeArmabranca;
		@Column(name="qtd_armafogo")
		private int quantidadeArmafogo;
		@Column(name="idade_Ate12")
		private int idadeAte12;
		@Column(name="idade_13a17")
		private int idade13a17;
		@Column(name="idade_18a30")
		private int idade18a30;
		@Column(name="idade_31a65")
		private int idade31a65;
		@Column(name="idade_acima65")
		private int idadeAcima65;
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
		public String getMunicipio() {
			return municipio;
		}
		public void setMunicipio(String municipio) {
			this.municipio = municipio;
		}
		public int getTotalAssassinatos() {
			return totalAssassinatos;
		}
		public void setTotalAssassinatos(int totalAssassinatos) {
			this.totalAssassinatos = totalAssassinatos;
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
		public int getIdadeAcima65() {
			return idadeAcima65;
		}
		public void setIdadeAcima65(int idadeAcima65) {
			this.idadeAcima65 = idadeAcima65;
		}
		
	

}
