package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TemaDao {
	
	
	private static final String PERSISTENCE_UNIT = "danger";
	
	public List<Tema> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Tema> lista = manager.createQuery("FROM Tema ORDER BY id").getResultList();
		manager.close();
		factory.close();
		return lista;
		}
	
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
