package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MunicipioDao {
	

	private static final String PERSISTENCE_UNIT = "danger";

	
	public Municipio buscarPorNome(String nome) {

		Municipio obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Municipio WHERE nomeMunicipio = :paramNome");
		query.setParameter("paramNome", nome);
		
		try {
			obj = (Municipio) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	
	public Municipio buscarPorId(int id) {
		Municipio obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Municipio.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
}
