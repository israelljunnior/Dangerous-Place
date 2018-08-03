package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MunicipioCvpDao {
	

	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(MunicipioCvp MunicipioCvp) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(MunicipioCvp);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public MunicipioCvp buscarPorId(int id) {
		MunicipioCvp obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(MunicipioCvp.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(MunicipioCvp MunicipioCvp) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(MunicipioCvp);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		MunicipioCvp MunicipioCvp = manager.find(MunicipioCvp.class, id);
		manager.getTransaction().begin();
		manager.remove(MunicipioCvp);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}

}
