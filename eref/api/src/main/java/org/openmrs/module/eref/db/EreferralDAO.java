package org.openmrs.module.eref.db;

import java.util.Date;
import java.util.List;

import org.openmrs.api.db.DAOException;

public interface EreferralDAO {
	
	/*public void set_hnet_e_reff_id(Integer hnet_e_reff_id);
	
	public void set_referring_person_id(Integer referring_person_id) throws DAOException;
	public void set_patient_name(String patient_name) throws DAOException;
	public void set_referring_person_name(String referring_person_name) throws DAOException;
	public void set_referred_hosp_id(Integer referred_hosp_id) throws DAOException;
	public void set_date_referred(Date date_referred) throws DAOException;
	public void set_referral_place(String referral_place) throws DAOException;
	public void set_date_reported(Date date_reported) throws DAOException;
	public void set_date_discharged(Date date_discharged) throws DAOException;
	public void set_case_status(String case_status) throws DAOException;
	public void set_action_taken(String action_taken) throws DAOException;
	public void set_treatment_received(String treatment_received) throws DAOException;
	public Integer get_hnet_e_reff_id() throws DAOException;
	public Integer get_referring_person_id() throws DAOException;
	public String get_patient_name() throws DAOException;
	public String get_referring_person_name() throws DAOException;
	public Integer get_referred_hosp_id() throws DAOException;
	public Date get_date_referred() throws DAOException;
	public String get_referral_place() throws DAOException;
	public Date get_date_reported() throws DAOException;
	public Date get_date_discharged() throws DAOException;
	public String get_case_status() throws DAOException;
	public String get_action_taken() throws DAOException;
	public String get_treatment_received() throws DAOException;	
*/
	public Ereferral getEreferral(Integer hnet_e_reff_id) throws DAOException;
	public List<Ereferral> getEreferralList() throws DAOException;
	public void createEreferral(Ereferral e) throws DAOException;
	public void deleteEreferral(Ereferral e) throws DAOException;
	
	
}