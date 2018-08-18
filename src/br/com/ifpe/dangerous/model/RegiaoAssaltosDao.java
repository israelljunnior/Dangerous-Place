package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class RegiaoAssaltosDao {
	
	private static final String PERSISTENCE_UNIT = "danger";

	public List<RegiaoAssaltos> buscarPorNome(String nome) {

		List<RegiaoAssaltos> obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM RegiaoAssaltos WHERE regiao = :paramRegiao");
		query.setParameter("paramRegiao", nome);
		
		try {
			obj = (List<RegiaoAssaltos>) query.getResultList();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	

	
	

}
