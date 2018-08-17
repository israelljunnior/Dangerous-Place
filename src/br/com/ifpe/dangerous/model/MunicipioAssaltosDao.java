package br.com.ifpe.dangerous.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MunicipioAssaltosDao {
	
	private static final String PERSISTENCE_UNIT = "danger";

	public MunicipioAssaltos buscarPorNome(String nome) {

		MunicipioAssaltos obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM MunicipioAssaltos WHERE municipio = :paramMunicipio");
		query.setParameter("paramMunicipio", nome);
		
		try {
			obj = (MunicipioAssaltos) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}

}
