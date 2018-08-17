package br.com.ifpe.dangerous.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class RegiaoAssassinatosDao {
	
	private static final String PERSISTENCE_UNIT = "danger";

	public RegiaoAssassinatos buscarPorNome(String nome) {

		RegiaoAssassinatos obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM RegiaoAssassinatos WHERE regiao = :paramregiao");
		query.setParameter("paramNomeRegiao", nome);
		
		try {
			obj = (RegiaoAssassinatos) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}

}
