package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class RegiaoDao {

	
	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(Regiao Regiao) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(Regiao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public Regiao buscarPorEmail(String email) {

		Regiao obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Regiao WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Regiao) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	
	public Regiao buscarRegiao(Regiao Regiao) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM Regiao WHERE Email LIKE :paramEmail");
		query.setParameter("paramEmail", Regiao.getNomeRegiao());
		List<Regiao> registros = query.getResultList();
		Regiao obj = null;
		if (!registros.isEmpty()) {
		 obj = (Regiao) registros.get(0);
		}
		manager.close();
		factory.close();
		return obj;
		}
	
	public Regiao buscarPorId(int id) {
		Regiao obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Regiao.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Regiao Regiao) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(Regiao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Regiao Regiao = manager.find(Regiao.class, id);
		manager.getTransaction().begin();
		manager.remove(Regiao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
}
