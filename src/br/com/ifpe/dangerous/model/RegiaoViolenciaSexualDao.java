package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class RegiaoViolenciaSexualDao {

	private static final String PERSISTENCE_UNIT = "danger";

	public List<RegiaoViolenciaSexual> buscarPorNome(String nome) {

		List<RegiaoViolenciaSexual> obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM RegiaoViolenciaSexual WHERE regiao LIKE :paramRegiao order by ano");
		query.setParameter("paramRegiao", nome);

		try {
			obj = (List<RegiaoViolenciaSexual>) query.getResultList();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();

		return obj;

	}
	
}
