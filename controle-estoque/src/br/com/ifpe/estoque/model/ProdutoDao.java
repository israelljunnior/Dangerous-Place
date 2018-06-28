package br.com.ifpe.estoque.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ProdutoDao {
	private static final String PERSISTENCE_UNIT = "controle-estoque";

	public void salvar(Produto produto) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(produto);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

}
