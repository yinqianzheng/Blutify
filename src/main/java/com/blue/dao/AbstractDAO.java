package com.blue.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.blue.model.Artist;

public abstract class AbstractDAO<PK extends Serializable, T> {
     
    private final Class<T> persistentClass;
    
    
    @SuppressWarnings("unchecked")
    public AbstractDAO(){
        this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }
     
    
    @Autowired
    private SessionFactory sessionFactory;
 
    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    
 
    @SuppressWarnings("unchecked")
    public T getByKey(PK key) throws Exception {
    		try {
        return (T) getSession().get(persistentClass, key);
    		}catch(Exception e) {
    			throw new Exception("exeception");
    		}
    }
    
 
    public void persist(T entity) {
        getSession().persist(entity);
    }
    
 
    public void delete(T entity) {
        getSession().delete(entity);
    }
    
     
    protected Criteria createEntityCriteria(){
        return getSession().createCriteria(persistentClass);
    }

 
}