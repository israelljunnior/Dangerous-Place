package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AdmDao {
	
	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(Adm Adm) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(Adm);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public Adm buscarPorEmail(String email) {

		Adm obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Adm WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Adm) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	
	public Adm buscarAdm(Adm Adm) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM Adm WHERE Email LIKE :paramEmail AND senha LIKE :paramSenha");
		query.setParameter("paramEmail", Adm.getEmail());
		query.setParameter("paramSenha", Adm.getSenha());
		List<Adm> registros = query.getResultList();
		Adm obj = null;
		if (!registros.isEmpty()) {
		 obj = (Adm) registros.get(0);
		}
		manager.close();
		factory.close();
		return obj;
		}
	
	public Adm buscarPorId(int id) {
		Adm obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Adm.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Adm Adm) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(Adm);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Adm Adm = manager.find(Adm.class, id);
		manager.getTransaction().begin();
		manager.remove(Adm);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

}
