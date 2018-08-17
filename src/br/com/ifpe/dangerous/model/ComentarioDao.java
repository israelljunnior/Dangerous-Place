package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ComentarioDao {
	
	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(Comentario Comentario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(Comentario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public List<Comentario> listar() {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Comentario> lista = manager.createQuery("FROM Comentario ORDER BY data").getResultList();
		manager.close();
		factory.close();
		return lista;
		}
	
	public Comentario buscarPorId(int id) {
		Comentario obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Comentario.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	
	
	public void alterar(Comentario Comentario) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(Comentario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void remover(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Comentario Comentario = manager.find(Comentario.class, id);
		manager.getTransaction().begin();
		manager.remove(Comentario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
	public void removerPorPub(int pubId) {
		EntityManagerFactory factory =
				Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
				EntityManager manager = factory.createEntityManager();
				manager.getTransaction().begin();
				manager.createQuery("delete FROM Comentario where publicacao.id LIKE :paramId ").setParameter("paramId", pubId).executeUpdate();
				manager.getTransaction().commit();
				manager.close();
				factory.close();
				
		}


}
