package br.com.ifpe.dangerous.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class PublicacaoDao {
	

	private static final String PERSISTENCE_UNIT = "danger";

	public void salvar(Publicacao Publicacao) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(Publicacao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public List<Publicacao> listar(Publicacao Publicacao) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String Titulo = Publicacao != null ? Publicacao.getTitulo() : "";
		String Tema = Publicacao != null ? Publicacao.getTema().getTema(): "";
		if (!Titulo.equals("") && Tema.equals("")) {
			query = manager.createQuery("FROM Publicacao WHERE Titulo LIKE :paramTitulo ORDER BY id_publicacao DESC");
			query.setParameter("paramTitulo", "%" + Titulo + "%");
		} else if (Titulo.equals("") && !Tema.equals("")) {
			query = manager.createQuery("FROM Publicacao WHERE Tema LIKE :paramTema ORDER BY id_publicacao DESC");
			query.setParameter("paramTema", "%" + Tema + "%");
		} else if (!Titulo.equals("") && !Tema.equals("")) {
			query = manager.createQuery(
					"FROM Publicacao WHERE Titulo LIKE :paramTitulo AND Tema LIKE :paramTema ORDER BY id_publicacao DESC");
			query.setParameter("paramTitulo", "%" + Titulo + "%");
			query.setParameter("paramTema", "%" + Tema + "%");
		} else {
			query = manager.createQuery("FROM Publicacao ORDER BY id_publicacao DESC");
		}
		List<Publicacao> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public List<Publicacao> filtrar(Publicacao Publicacao) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String Titulo = Publicacao != null ? Publicacao.getTitulo() : "";
		String Tema = Publicacao != null ? Publicacao.getTitulo() : "";
		if (!Titulo.equals("") && Tema.equals("")) {
			query = manager.createQuery("FROM Publicacao WHERE Titulo LIKE :paramTitulo ORDER BY id_publicacao DESC");
			query.setParameter("paramTitulo", "%" + Titulo + "%");
		} else if (Titulo.equals("") && !Tema.equals("")) {
			query = manager.createQuery("FROM Publicacao WHERE tema.tema LIKE :paramTema ORDER BY id_publicacao DESC");
			query.setParameter("paramTema", "%" + Tema + "%");
		} else if (!Titulo.equals("") && !Tema.equals("")) {
			query = manager.createQuery(
					"FROM Publicacao WHERE titulo LIKE :paramTitulo OR tema.tema LIKE :paramTema ORDER BY id_publicacao DESC");
			query.setParameter("paramTitulo", "%" + Titulo + "%");
			query.setParameter("paramTema", "%" + Tema + "%");
		} else {
			query = manager.createQuery("FROM Publicacao ORDER BY id_publicacao DESC");
		}
		List<Publicacao> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public Publicacao buscarPorId(int id) {
		Publicacao obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Publicacao.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Publicacao Publicacao) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(Publicacao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	

	public void removerPub(int id) {
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Publicacao Publicacao = manager.find(Publicacao.class, id);
		manager.getTransaction().begin();
		manager.remove(Publicacao);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}

}
