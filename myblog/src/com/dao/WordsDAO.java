package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Words;

/**
 * A data access object (DAO) providing persistence and search support for Words
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Words
 * @author MyEclipse Persistence Tools
 */
public class WordsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(WordsDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String TEXT = "text";
	public static final String MAIL = "mail";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(Words transientInstance) {
		log.debug("saving Words instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Words persistentInstance) {
		log.debug("deleting Words instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Words findById(java.lang.Integer id) {
		log.debug("getting Words instance with id: " + id);
		try {
			Words instance = (Words) getHibernateTemplate().get(
					"com.pojo.Words", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Words instance) {
		log.debug("finding Words instance by example");
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
		log.debug("finding Words instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Words as model where model."
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

	public List findByMail(Object mail) {
		return findByProperty(MAIL, mail);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all Words instances");
		try {
			String queryString = "from Words";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Words merge(Words detachedInstance) {
		log.debug("merging Words instance");
		try {
			Words result = (Words) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Words instance) {
		log.debug("attaching dirty Words instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Words instance) {
		log.debug("attaching clean Words instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static WordsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (WordsDAO) ctx.getBean("WordsDAO");
	}
}