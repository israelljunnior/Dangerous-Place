package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class MunicipioViolenciaSexualDao {

	private static final String PERSISTENCE_UNIT = "danger";

	public List<MunicipioViolenciaSexual> buscarPorNome(String nome) {

		List<MunicipioViolenciaSexual> obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM MunicipioViolenciaSexual WHERE municipio LIKE :paramMunicipio order by ano");
		query.setParameter("paramMunicipio", nome);

		try {
			obj = (List<MunicipioViolenciaSexual>) query.getResultList();
		} catch (NoResultException nre) {
			return null;
		}

		manager.close();
		factory.close();

		return obj;

	}

}
