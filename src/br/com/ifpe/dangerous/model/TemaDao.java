package br.com.ifpe.dangerous.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TemaDao {
	
	
	private static final String PERSISTENCE_UNIT = "danger";
	
	public Tema buscarPorId(int id) {
		Tema obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Tema.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	

}
