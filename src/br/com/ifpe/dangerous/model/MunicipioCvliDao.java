package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MunicipioCvliDao {
	

	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(MunicipioCvli MunicipioCvli) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(MunicipioCvli);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public MunicipioCvli buscarPorId(int id) {
		MunicipioCvli obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(MunicipioCvli.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public MunicipioCvli buscarPorNome(String nome) {
		MunicipioCvli obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(MunicipioCvli.class, nome);
		manager.close();
		factory.close();
		return obj;
		}
	
	

}
