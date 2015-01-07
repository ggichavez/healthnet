package org.openmrs.module.eref;



import java.util.List;


import org.openmrs.api.APIException;

import org.openmrs.api.OpenmrsService;
import org.openmrs.module.eref.db.Ereferral;
import org.openmrs.module.eref.db.EreferralDAO;

public interface EreferralService extends OpenmrsService{

	public void setEreferralDAO(EreferralDAO dao);
	
	public void createEreferral(Ereferral queueItem) throws APIException;
	public void deleteEreferral(Ereferral queueItem) throws APIException;
	public Ereferral getEreferral(Integer referralid) throws APIException;
	public List<Ereferral> getAllReferrals()throws APIException;
}
