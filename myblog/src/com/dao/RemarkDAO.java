package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Remark;

/**
 * A data access object (DAO) providing persistence and search support for
 * Remark entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Remark
 * @author MyEclipse Persistence Tools
 */
public class RemarkDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(RemarkDAO.class);
	// property constants
	public static final String USERNAME = "username";
	public static final String TEXT = "text";
	public static final String MAIL = "mail";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(Remark transientInstance) {
		log.debug("saving Remark instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Remark persistentInstance) {
		log.debug("deleting Remark instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Remark findById(java.lang.Integer id) {
		log.debug("getting Remark instance with id: " + id);
		try {
			Remark instance = (Remark) getHibernateTemplate().get(
					"com.pojo.Remark", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Remark instance) {
		log.debug("finding Remark instance by example");
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
		log.debug("finding Remark instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Remark as model where model."
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
		log.debug("finding all Remark instances");
		try {
			String queryString = "from Remark";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Remark merge(Remark detachedInstance) {
		log.debug("merging Remark instance");
		try {
			Remark result = (Remark) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Remark instance) {
		log.debug("attaching dirty Remark instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Remark instance) {
		log.debug("attaching clean Remark instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RemarkDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RemarkDAO) ctx.getBean("RemarkDAO");
	}
}