package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Artic;

/**
 * A data access object (DAO) providing persistence and search support for Artic
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Artic
 * @author MyEclipse Persistence Tools
 */
public class ArticDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ArticDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String READCOUNT = "readcount";
	public static final String CREATE_YEAR = "createYear";
	public static final String CREATE_MONTH = "createMonth";

	protected void initDao() {
		// do nothing
	}

	public void save(Artic transientInstance) {
		log.debug("saving Artic instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Artic persistentInstance) {
		log.debug("deleting Artic instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Artic findById(java.lang.Integer id) {
		log.debug("getting Artic instance with id: " + id);
		try {
			Artic instance = (Artic) getHibernateTemplate().get(
					"com.pojo.Artic", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Artic instance) {
		log.debug("finding Artic instance by example");
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
		log.debug("finding Artic instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Artic as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByReadcount(Object readcount) {
		return findByProperty(READCOUNT, readcount);
	}

	public List findByCreateYear(Object createYear) {
		return findByProperty(CREATE_YEAR, createYear);
	}

	public List findByCreateMonth(Object createMonth) {
		return findByProperty(CREATE_MONTH, createMonth);
	}

	public List findAll() {
		log.debug("finding all Artic instances");
		try {
			String queryString = "from Artic";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Artic merge(Artic detachedInstance) {
		log.debug("merging Artic instance");
		try {
			Artic result = (Artic) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Artic instance) {
		log.debug("attaching dirty Artic instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Artic instance) {
		log.debug("attaching clean Artic instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ArticDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ArticDAO) ctx.getBean("ArticDAO");
	}
}