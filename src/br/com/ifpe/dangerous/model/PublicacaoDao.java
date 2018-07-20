package br.com.ifpe.dangerous.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PublicacaoDao {
	
	private static final String PERSISTENCE_UNIT = "danger";
	
	public void salvar(Publicacao publicacao) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(publicacao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	

}
