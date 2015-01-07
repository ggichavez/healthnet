package org.openmrs.module.eref;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.eref.db.Ereferral;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.GlobalProperty;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.PatientIdentifierType;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonAttributeType;
import org.openmrs.PersonName;
import org.openmrs.Role;
import org.openmrs.User;
public class DeleteServlet extends HttpServlet{

	//private static final long serialversionUID = 423894928;
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException 
	{
		String uparam = req.getParameter("uid");
		Encounter e = Context.getEncounterService().getEncounterByUuid(uparam);
		Object o = Context.getService(EreferralService.class);
		
		EreferralService service = (EreferralService)o;
		
		List<Ereferral> ereflist = service.getAllReferrals();
		
		int i = 0;
		Ereferral er = new Ereferral("test");
		for(i=0;i<ereflist.size();i++)
		{
			er = ereflist.get(i);
			String ehid = er.getPat_encounter_id();
			if(ehid.equals(uparam))
				break;
		}
		service.deleteEreferral(er); 
		String contextpath = req.getContextPath();
		contextpath = contextpath+"/module/eref/chart5Link.form";
		 resp.sendRedirect(resp.encodeRedirectURL(contextpath));
		
		
	}
}