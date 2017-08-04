package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Replay;

/**
 * A data access object (DAO) providing persistence and search support for
 * Replay entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Replay
 * @author MyEclipse Persistence Tools
 */
public class ReplayDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ReplayDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String TEXT = "text";

	protected void initDao() {
		// do nothing
	}

	public void save(Replay transientInstance) {
		log.debug("saving Replay instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Replay persistentInstance) {
		log.debug("deleting Replay instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Replay findById(java.lang.Integer id) {
		log.debug("getting Replay instance with id: " + id);
		try {
			Replay instance = (Replay) getHibernateTemplate().get(
					"com.pojo.Replay", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Replay instance) {
		log.debug("finding Replay instance by example");
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
		log.debug("finding Replay instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Replay as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByText(Object text) {
		return findByProperty(TEXT, text);
	}

	public List findAll() {
		log.debug("finding all Replay instances");
		try {
			String queryString = "from Replay";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Replay merge(Replay detachedInstance) {
		log.debug("merging Replay instance");
		try {
			Replay result = (Replay) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Replay instance) {
		log.debug("attaching dirty Replay instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Replay instance) {
		log.debug("attaching clean Replay instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ReplayDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ReplayDAO) ctx.getBean("ReplayDAO");
	}
}