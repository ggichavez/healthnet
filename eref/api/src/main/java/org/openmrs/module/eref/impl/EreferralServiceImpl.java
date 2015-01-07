package org.openmrs.module.eref.impl;


import java.util.List;


import org.openmrs.api.APIException;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.eref.EreferralService;
import org.openmrs.module.eref.db.Ereferral;
import org.openmrs.module.eref.db.EreferralDAO;


public class EreferralServiceImpl extends BaseOpenmrsService implements EreferralService{

	private EreferralDAO dao;
	private EreferralDAO getEreferralDAO() {
        return dao;
    }
    
    public void setEreferralDAO(EreferralDAO dao) {
        this.dao = dao;
    }
    
    public void createEreferral(Ereferral erefitem) throws APIException {
        getEreferralDAO().createEreferral(erefitem);
    }
    public void deleteEreferral(Ereferral queueItem) throws APIException {
    	getEreferralDAO().deleteEreferral(queueItem);
    }
    
    public Ereferral getEreferral(Integer referralid) throws APIException {
    	return getEreferralDAO().getEreferral(referralid);
    }
    
    public List<Ereferral> getAllReferrals()throws APIException {
    	return getEreferralDAO().getEreferralList();
    }
}
