package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Categories;

/**
 * A data access object (DAO) providing persistence and search support for
 * Categories entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Categories
 * @author MyEclipse Persistence Tools
 */
public class CategoriesDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(CategoriesDAO.class);
	// property constants
	public static final String NAME = "name";

	protected void initDao() {
		// do nothing
	}

	public void save(Categories transientInstance) {
		log.debug("saving Categories instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Categories persistentInstance) {
		log.debug("deleting Categories instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Categories findById(java.lang.Integer id) {
		log.debug("getting Categories instance with id: " + id);
		try {
			Categories instance = (Categories) getHibernateTemplate().get(
					"com.pojo.Categories", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Categories instance) {
		log.debug("finding Categories instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Categories instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Categories as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all Categories instances");
		try {
			String queryString = "from Categories";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Categories merge(Categories detachedInstance) {
		log.debug("merging Categories instance");
		try {
			Categories result = (Categories) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Categories instance) {
		log.debug("attaching dirty Categories instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Categories instance) {
		log.debug("attaching clean Categories instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CategoriesDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CategoriesDAO) ctx.getBean("CategoriesDAO");
	}
}