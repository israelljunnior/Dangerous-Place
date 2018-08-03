package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

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
	
	public List<Comentario> listar(Comentario Comentario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		Publicacao publicacao = Comentario != null ? Comentario.getPublicacao() : null;
		if (!publicacao.equals(null)) {
			query = manager.createQuery("FROM Comentario WHERE publicacao.id LIKE :paramId ORDER BY Data");
			query.setParameter("paramId", "%" + publicacao.getId() + "%");
		}
		List<Comentario> lista = query.getResultList();
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


}
