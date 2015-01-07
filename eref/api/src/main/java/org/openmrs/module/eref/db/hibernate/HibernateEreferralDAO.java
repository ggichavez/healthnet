package org.openmrs.module.eref.db.hibernate;






import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Expression;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.eref.db.Ereferral;
import org.openmrs.module.eref.db.EreferralDAO;


public class HibernateEreferralDAO implements EreferralDAO {
private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory factory) {
		this.sessionFactory = factory;
	}

	public Ereferral getEreferral(Integer hnet_e_reff_id) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Ereferral.class);
		criteria.add(Expression.eq("hnet_e_reff_id", hnet_e_reff_id));
		
		return (Ereferral) criteria.uniqueResult();
		
		//return (Ereferral) sessionFactory.getCurrentSession().get(
			//	Ereferral.class, hnet_e_reff_id);
	}
	
	
	public void createEreferral(Ereferral e) throws DAOException {
		
		Session session = sessionFactory.openSession();
		  session.beginTransaction(); 
		  e.serialize();
		  session.saveOrUpdate(e);
		  session.getTransaction().commit();
		  session.close();

	}
	public void deleteEreferral(Ereferral e) throws DAOException {
		Session session = sessionFactory.openSession();
		  session.beginTransaction(); 
		  e.serialize();
		  session.delete(e);
		  session.getTransaction().commit();
		  session.close();
		
	}
	@SuppressWarnings("unchecked")
	public List<Ereferral> getEreferralList() throws DAOException {
		
		return (List<Ereferral>) allReferrals().list();
	}
	
	private Criteria allReferrals() {
    	//System.out.println("on allQueueItems");
        return sessionFactory.getCurrentSession().createCriteria(
        		Ereferral.class);
    }
}
