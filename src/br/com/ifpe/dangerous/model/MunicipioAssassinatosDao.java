package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MunicipioAssassinatosDao {
	
	
	private static final String PERSISTENCE_UNIT = "danger";

	public List<MunicipioAssassinatos> buscarPorNome(String nome) {

		List<MunicipioAssassinatos> obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM MunicipioAssassinatos WHERE municipio = :paramMunicipio");
		query.setParameter("paramMunicipio", nome);
		
		try {
			obj = (List<MunicipioAssassinatos>) query.getResultList();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}

}
