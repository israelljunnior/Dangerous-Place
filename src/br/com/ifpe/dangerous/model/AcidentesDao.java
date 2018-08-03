package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AcidentesDao {
	

	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(Acidentes Acidentes) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(Acidentes);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public Acidentes buscarPorEmail(String email) {

		Acidentes obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Acidentes WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Acidentes) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	
	public Acidentes buscarPorId(int id) {
		Acidentes obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Acidentes.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Acidentes Acidentes) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(Acidentes);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Acidentes Acidentes = manager.find(Acidentes.class, id);
		manager.getTransaction().begin();
		manager.remove(Acidentes);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}

}
