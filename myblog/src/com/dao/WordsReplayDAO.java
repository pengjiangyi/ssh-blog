package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.WordsReplay;

/**
 * A data access object (DAO) providing persistence and search support for
 * WordsReplay entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.WordsReplay
 * @author MyEclipse Persistence Tools
 */
public class WordsReplayDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(WordsReplayDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String TEXT = "text";

	protected void initDao() {
		// do nothing
	}

	public void save(WordsReplay transientInstance) {
		log.debug("saving WordsReplay instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(WordsReplay persistentInstance) {
		log.debug("deleting WordsReplay instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public WordsReplay findById(java.lang.Integer id) {
		log.debug("getting WordsReplay instance with id: " + id);
		try {
			WordsReplay instance = (WordsReplay) getHibernateTemplate().get(
					"com.pojo.WordsReplay", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(WordsReplay instance) {
		log.debug("finding WordsReplay instance by example");
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
		log.debug("finding WordsReplay instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from WordsReplay as model where model."
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
		log.debug("finding all WordsReplay instances");
		try {
			String queryString = "from WordsReplay";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public WordsReplay merge(WordsReplay detachedInstance) {
		log.debug("merging WordsReplay instance");
		try {
			WordsReplay result = (WordsReplay) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(WordsReplay instance) {
		log.debug("attaching dirty WordsReplay instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(WordsReplay instance) {
		log.debug("attaching clean WordsReplay instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static WordsReplayDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (WordsReplayDAO) ctx.getBean("WordsReplayDAO");
	}
}