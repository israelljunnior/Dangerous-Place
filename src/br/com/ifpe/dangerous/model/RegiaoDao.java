package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class RegiaoDao {

	
	private static final String PERSISTENCE_UNIT = "danger";

	public Regiao buscarPorNome(String nome) {

		Regiao obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Regiao WHERE nomeRegiao = :paramNomeRegiao");
		query.setParameter("paramNomeRegiao", nome);
		
		try {
			obj = (Regiao) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	
	public List<Municipio> buscarMunicipiosPorId(int id) {

		List<Municipio> obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Municipio WHERE regiao.id = :paramRegiao");
		query.setParameter("paramRegiao", id);
		
		try {
			obj = (List<Municipio>) query.getResultList();
		}catch(NoResultException nre) {
			return null;
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
	
	

	
}
