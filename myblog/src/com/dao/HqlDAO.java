package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.User;

public class HqlDAO extends HibernateDaoSupport{
//��ѯ����
	public List query(final String hql,final Object...p) {
		
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				
				Query query=session.createQuery(hql);
				
				if(p!=null)
				{
					for(int i=0;i<p.length;i++)
					{
						query.setParameter(i, p[i]);
					}
				}
				
				return query.list();
				
			}
			
			
			
			
			
		});
		
		
	}
	public Session getHibernateSession() {
		return (Session) super.getHibernateTemplate().execute(
				new HibernateCallback() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// TODO Auto-generated method stub
						return session;
					}

				});

	}
	//��ݸ��²���
	public int update(final String hql,final Object...p) {
	return getHibernateTemplate().execute(new HibernateCallback() {

		@Override
		public Object doInHibernate(Session session) throws HibernateException,
				SQLException {
			
			Query query=session.createQuery(hql);
			if(p!=null)
			{
				for(int i=0;i<p.length;i++)
				{
					query.setParameter(i, p[i]);
				}
			}
			
			return query.executeUpdate();
			
			
		}
	});
		
	}
	
	//��ҳ��ѯ  
	//page:ҳ��
	//size:ÿҳ��ʾ���ٸ�
	public List fengyeQuery(final int page,final int size,final String hql,final Object...p) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createQuery(hql).setFirstResult((page-1)*size).setMaxResults(size);
				if(p!=null)
				{
					for(int i=0;i<p.length;i++)
					{
						query.setParameter(i, p[i]);
					}
				}
				return query.list();
				
			
			}
		});
		
	}
	//�ۺϲ�ѯ
	public double unique(final String hql, final Object... p) {

		List list = findByHQL(hql, p);

		if (list.size() > 0) {
			Object obj = list.get(0);
			if (obj != null) {
				return Double.parseDouble(obj.toString());
			}
		}
		return 0;
	}

	public List findByHQL(final String hql, final Object... p) {
		List list = getHibernateTemplate().find(hql, p);
		return list;
	}

	
	
	

}
