package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ComentarioGraficoRegiaoDao {
	
	private static final String PERSISTENCE_UNIT = "danger";
	
	public void salvar(ComentarioGraficoRegiao ComentarioGraficoRegiao) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(ComentarioGraficoRegiao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public List<ComentarioGraficoRegiao> listar() {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<ComentarioGraficoRegiao> lista = manager.createQuery("FROM ComentarioGraficoRegiao ORDER BY data").getResultList();
		manager.close();
		factory.close();
		return lista;
		}
	
	
	public ComentarioGraficoRegiao buscarPorId(int id) {
		ComentarioGraficoRegiao obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(ComentarioGraficoRegiao.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	

	public void alterar(ComentarioGraficoRegiao ComentarioGraficoRegiao) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(ComentarioGraficoRegiao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		ComentarioGraficoRegiao ComentarioGraficoRegiao = manager.find(ComentarioGraficoRegiao.class, id);
		manager.getTransaction().begin();
		manager.remove(ComentarioGraficoRegiao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
	

}
