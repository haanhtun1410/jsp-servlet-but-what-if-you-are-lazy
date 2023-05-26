package com.example.templatefinal.Responsitories.impl;

import com.example.templatefinal.HibernateUntil;
import com.example.templatefinal.Responsitories.Crud;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.mapping.Collection;
import org.hibernate.query.Query;

import java.util.List;
import java.util.UUID;

public class CrudImpl<T> implements Crud<T> {

    private Class<?> className;

    SessionFactory sessionFactory = HibernateUntil.getSessionFactory();


    public CrudImpl(Class<?> className) {
        this.className = className;

    }

    public CrudImpl() {

    }

    @Override
    public boolean creat(T e) {
        try(Session session = sessionFactory.openSession())  {
            session.beginTransaction();
            session.save(e);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return false;
    }

    @Override
    public boolean update(T e) {
        try(Session session = sessionFactory.openSession())  {
            session.beginTransaction();
            session.update(e);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<T> readAll() {
        try(Session session = sessionFactory.openSession())  {
            Criteria cr = session.createCriteria(className);
            return cr.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                    .list();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public T findByID(UUID id) {
        try (Session session = sessionFactory.openSession()) {
            T entity = (T) session.get(className,id);
            return entity;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean delete(T e) {
        try(Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.delete(e);
            tx.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
