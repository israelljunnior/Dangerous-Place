package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ComentarioGraficoMunicipioDao {

	private static final String PERSISTENCE_UNIT = "danger";
	
	public void salvar(ComentarioGraficoMunicipio ComentarioGraficoMunicipio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(ComentarioGraficoMunicipio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	

	public List<ComentarioGraficoMunicipio> listar() {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<ComentarioGraficoMunicipio> lista = manager.createQuery("FROM ComentarioGraficoMunicipio ORDER BY data").getResultList();
		manager.close();
		factory.close();
		return lista;
		}
	
	public ComentarioGraficoMunicipio buscarPorId(int id) {
		ComentarioGraficoMunicipio obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(ComentarioGraficoMunicipio.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(ComentarioGraficoMunicipio ComentarioGraficoMunicipio) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(ComentarioGraficoMunicipio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		ComentarioGraficoMunicipio ComentarioGraficoMunicipio = manager.find(ComentarioGraficoMunicipio.class, id);
		manager.getTransaction().begin();
		manager.remove(ComentarioGraficoMunicipio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
}
