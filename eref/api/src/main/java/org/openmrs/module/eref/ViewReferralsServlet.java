package org.openmrs.module.eref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Collection;
import java.util.Date;
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
public class ViewReferralsServlet extends HttpServlet{
	List<Ereferral> reflist;
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException 
	{
	    String recipent_name="Vinit";
	    String recipent_email="vadeodhar89@gmail.com";
		resp.setContentType("text/plain");
		String notificationmsg = req.getParameter("msg");
		if(notificationmsg==null)
			resp.getWriter().print("Notification message cannot be empty. Try again");
		else
		{
			String serverurl = "http://aknsha7.appspot.com";
			String u = serverurl+"/guestbook?"+"name="+recipent_name+"&email="+recipent_email+"&message="+notificationmsg ;
		    String us = u.replace(" ","SPACE");
                   //send request
		    URL url = new URL(us);
		    URLConnection conn = url.openConnection();
		    BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    
            String line;
            String answer="";
             int i=0;
    while ((line = rd.readLine()) != null) {i++;
         answer = answer  +"\n"+ line;
    }
     		    
            //wr.close();
    rd.close();
			resp.getWriter().print("Notification mailed.\nMessage\n"+answer);
		}
		
}
}
