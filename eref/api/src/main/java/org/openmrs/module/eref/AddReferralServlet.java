package org.openmrs.module.eref;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptDatatype;
import org.openmrs.ConceptDescription;
import org.openmrs.ConceptName;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.PatientIdentifierType;
import org.openmrs.Person;
import org.openmrs.PersonName;
import org.openmrs.Privilege;
import org.openmrs.api.ConceptService;
import org.openmrs.api.EncounterService;
import org.openmrs.api.ObsService;
import org.openmrs.api.PatientService;
import org.openmrs.api.context.Context;
import org.openmrs.module.eref.EreferralService;
import org.openmrs.module.eref.db.Ereferral;

public class AddReferralServlet extends HttpServlet{

	
	String healthworker_id;
	String referred_from;
	String patient_id;
	String patient_fname;
	String patient_lname;
	Date patient_dob;
	String patient_gender;
	String concept_names[];
	String concept_responses[];
	String patient_location;
	int no_of_questions = 0;
	String birthdate_day;
	String birthdate_month;
	String birthdate_year;
	String emergency_type;
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException 
	{    
		
		String uname = req.getParameter("uname");
		String pass = req.getParameter("pass");
		Context.authenticate(uname, pass);
		no_of_questions = 0;
		resp.setContentType("text/plain");
		int no_of_param = Integer.parseInt(req.getParameter("total"));
		
		 String q[]= new String[no_of_param];
		 String a[] = new String[no_of_param];
		 concept_names = new String[no_of_param];
		 concept_responses = new String[no_of_param];
		 Date today = new Date();
		 Date dob = new Date();
		 String qes="q";
		 String ans = "a";
		 
		 for(int i=0;i<no_of_param;i++)
		 {
			 int k = i+1;
			 q[i] = req.getParameter(qes+k);
			 q[i]=q[i].replaceAll("@"," ");
			 a[i] = req.getParameter(ans+k);
			 a[i]=a[i].replaceAll("@"," ");
			 if(q[i].equals("patientId"))
				 patient_id = a[i];
			 else
				 if(q[i].equals("patientFirstName"))
					 patient_fname = a[i];
				 else
					 if(q[i].equals("patientLastName"))
						 patient_lname = a[i];
					  else
						  if(q[i].equals("patientGender"))
							  patient_gender=a[i];
						  else
							  if(q[i].equals("LOCATION"))
								  patient_location = a[i];
							  else
								  if(q[i].equals("patientBirthdateDay"))
									  birthdate_day = a[i];
								  else
									  if(q[i].equals("patientBirthdateYear"))
							           birthdate_year = a[i];
									  else
										  if(q[i].equals("patientBirthdateMonth"))
										  {
											  birthdate_month = a[i];
											  if(birthdate_month.equalsIgnoreCase("January"))  
												  birthdate_month = "0";
											  if(birthdate_month.equalsIgnoreCase("February"))  
												  birthdate_month = "1";
											  if(birthdate_month.equalsIgnoreCase("March"))  
												  birthdate_month = "2";
											  if(birthdate_month.equalsIgnoreCase("April"))  
												  birthdate_month = "3";
											  if(birthdate_month.equalsIgnoreCase("May"))  
												  birthdate_month = "4";
											  if(birthdate_month.equalsIgnoreCase("June"))  
												  birthdate_month = "5";
											  if(birthdate_month.equalsIgnoreCase("July"))  
												  birthdate_month = "6";
											  if(birthdate_month.equalsIgnoreCase("August"))  
												  birthdate_month = "7";
											  if(birthdate_month.equalsIgnoreCase("September"))  
												  birthdate_month = "8";
											  if(birthdate_month.equalsIgnoreCase("October"))  
												  birthdate_month = "9";
											  if(birthdate_month.equalsIgnoreCase("November"))  
												  birthdate_month = "10";
											  if(birthdate_month.equalsIgnoreCase("December"))  
												  birthdate_month = "11";
										  }
										  else
											  if(q[i].equals("TYPE"))
												  emergency_type=a[i];
						  else
						  {
							  concept_names[no_of_questions]=q[i];
							  concept_responses[no_of_questions]=a[i];
							  no_of_questions++;
						  }
			                			 
				 
			 
		 }
		 
		 
		 Location loc = new Location();
			loc.setCountry("India");
			loc.setAddress1(patient_location);
			loc.setName(patient_location);
			Context.getLocationService().saveLocation(loc);
		    
			PatientIdentifierType pidtype = Context.getPatientService().getPatientIdentifierTypeByName("Old Identification Number");
		 
			PatientIdentifier pid = new PatientIdentifier();
			pid.setIdentifierType(pidtype);
			pid.setLocation(loc);
		    pid.setIdentifier(patient_id);
           
		    dob.setDate(Integer.parseInt(birthdate_day));
		    dob.setMonth(Integer.parseInt(birthdate_month));
		    dob.setYear(Integer.parseInt(birthdate_year)-1900);
		    
		    PersonName person = new PersonName(patient_fname,"",patient_lname);
		    Patient pat = new Patient();
			pat.setBirthdate(dob);
			pat.setDateCreated(today);
			pat.setGender(patient_gender);
			pat.addName(person);
			pat.addIdentifier(pid);
			Context.getPatientService().savePatient(pat);
			
			Encounter enc = new Encounter();
			enc.setEncounterDatetime(today);
			enc.setLocation(loc);
			enc.setPatient(pat);
			
			EncounterType etype = new EncounterType();
			List<EncounterType> elist = Context.getEncounterService().getAllEncounterTypes();
			int noe = elist.size();
			int k =0;
			for( k=0;k<noe;k++)
			{	
			EncounterType et = elist.get(k);
			if(et.getName().equals(emergency_type))
				{etype = et; break;}
			}
			if(k==noe)
			{
				etype = new EncounterType();
				etype.setName(emergency_type);
				etype.setDescription("Emergency referral encounter to be uploaded from phone");
				Context.getEncounterService().saveEncounterType(etype);
			}
			enc.setEncounterType(etype);
			enc.setProvider(pat);
			
			
		Context.getEncounterService().saveEncounter(enc);
			String test="";
			Obs obs[] = new Obs[no_of_questions];
			ConceptService cs = Context.getConceptService();
			int k1=0;
			for(int k2=0;k2<no_of_questions;k2++)
			{
				obs[k2] = new Obs();
				obs[k2].setLocation(loc);
				obs[k2].setObsDatetime(today);
				Concept c = cs.getConceptByName(concept_names[k2]);
				if(c==null)
				{
					c = new Concept();
					
					ConceptName cname = new ConceptName();
					cname.setName(concept_names[k2]);
					Locale locale =  Locale.ENGLISH;
					cname.setLocale(locale);
					ConceptDatatype ctype = new ConceptDatatype();
					ctype = cs.getConceptDatatypeByName("Text");
					ConceptClass cclass = cs.getConceptClassByName("Test");
					c.setPreferredName(cname);
					c.setConceptClass(cclass);
					c.setDatatype(ctype);
					c.setFullySpecifiedName(cname);
					ConceptDescription cdes = new ConceptDescription();
					cdes.setDescription("Hnet");
					cdes.setLocale(locale);
					
					c.addDescription(cdes);
					
					cs.saveConcept(c);
				}
				obs[k2].setConcept(c);
				obs[k2].setPerson(pat);
				
				try{
				obs[k2].setValueAsString(concept_responses[k2]);
				
				}
				catch(Exception e){obs[k2].setValueNumeric(11.0);}
				Context.getObsService().saveObs(obs[k2], null);
				enc.addObs(obs[k2]);
			}
			Context.getEncounterService().saveEncounter(enc);
			
		
		//Add encounter to queue
		
		Object o = Context.getService(EreferralService.class);
		EreferralService service = (EreferralService)o;
		Ereferral eref = new Ereferral(enc.getUuid());
		service.createEreferral(eref);
		
		
		Context.logout();
		
		//Integer i2 = new Integer(1);
		
	//	List<Encounter> elist = new ArrayList<Encounter>();
		//Context.getAdministrationService().createPrivilege(arg0);
	//	Privilege pre = new Privilege();
		//pre.
			/*
			obs1.setPerson(pp);
			obs1.setLocation(loc);
			obs1.setObsDatetime(today);
			obs1.setConcept(cs.getConcept(729));
			obs1.setValueNumeric(134.0);
			os.saveObs(obs1,null);
			*/
			
			
			
			/*
		 PatientIdentifierType pt = new PatientIdentifierType();
		 pt.setPatientIdentifierTypeId(1);
		 
	  PatientIdentifier pid = new PatientIdentifier("89989",pt,new Location());
	  
		 Patient pat = new Patient();
		 pat.addIdentifier(pid);
 Date today = new Date();
         pat.setId(4144);
         pat.setPatientId(89989);
         pat.setPersonId(89989);
         pat.setBirthdate(today);
				 //getPatientByUuid("1234-56989-123");
		 pat.setGender("M");
	//	 PersonName pname = new PersonName(patient_name);
		 pat.addName(new PersonName(patient_name, "Bob", "Smith"));
		
		 ps.savePatient(pat);
		 for(int k = 0;k<no;k++)
		 {
			 String u1 = "q"+k;
			 String u2 = "a"+k;
			 q[k]= req.getParameter(u1);
			 a[k]= req.getParameter(u2); 
			 
		 }
		// Object o = Context.getService(EreferralService.class);
        // EreferralService service = (EreferralService)o;
         
     //    Ereferral eref = new Ereferral(hwid,patient_name,healthworker_name,hid);
         Encounter en = new Encounter();
   //     

         en.setDateCreated(today);
        // Integer t = en.getEncounterId();
       //  en.setId(12345);
        
        // eref.setHnet_e_reff_id(mint);
        // service.createEreferral(eref);
        Object o1 = Context.getService(EncounterService.class);
         EncounterService  ens = (EncounterService) o1 ;
         for(int k=0;k<no;k++)
        {
        	Obs obs = new Obs();
        	obs.setComment(a[k]);
        	en.addObs(obs);
        }
         
       //  ens.saveEncounter(en);
         */
	/*	 List<Patient> plist = ps.getAllPatients();
		 Patient pp = plist.get(0);
		 String ppname = pp.getGivenName();
		 String ppsurnamr = pp.getFamilyName();
		 if(ppname==null)
			 ppname ="ano first";
		 if(ppsurnamr==null)
			 ppsurnamr="ano last";
		 pp.setGender("M");
		 ps.savePatient(pp);
	/*	PatientIdentifierType ppidtype = ps.getPatientIdentifierTypeByName("Old Identification Number");
		PatientIdentifier ppid = new PatientIdentifier();
		Integer ppidid = new Integer("1234098");
		ppid.setPatientIdentifierId(ppidid);
		ppid.setIdentifier("1234098");
	
	ppid.setLocation(loc);
		ppid.setDateCreated(today);
		ppid.setIdentifierType(ppidtype);
		ps.savePatientIdentifier(ppid);
		Patient newpp = new Patient();
		newpp.addIdentifier(ppid);
		newpp.setPatientId(1234098);
		newpp.setGender("F");
		newpp.setBirthdate(today);
		newpp.setDateCreated(today);
		PersonName ppno = new PersonName("pp","kr","pr");
		newpp.addName(ppno);
		
		ps.savePatient(newpp);*/
		/*Object o1 = Context.getService(EncounterService.class);
		Object o2 = Context.getService(ConceptService.class);
		ConceptService cs = Context.getConceptService();
		EncounterService es = Context.getEncounterService();
		ObsService os = Context.getObsService();
		/* EncounterService  ens = (EncounterService) o1 ;
		 Encounter ppen = new Encounter();
		 
		 ppen.setEncounterId(11110000);
		 ppen.setEncounterDatetime(today);
		 ppen.setPatient(pp);
		 EncounterType etype = ens.getEncounterType("healthnetreferral");
		 
		
		 
		 ppen.setEncounterType(etype);
		 ens.saveEncounter(ppen);
		 */
		
		/*Location loc = new Location();
		loc.setCountry("India");
		loc.setAddress1("Thane");
		loc.setName("Thane");
		Context.getLocationService().saveLocation(loc);
		Encounter enc = new Encounter();
		enc.setEncounterDatetime(today);
		enc.setLocation(loc);
		enc.setPatient(pp);
		enc.setProvider(pp);
		Obs obs1 = new Obs();
		obs1.setPerson(pp);
		obs1.setLocation(loc);
		obs1.setObsDatetime(today);
		obs1.setConcept(cs.getConcept(729));
		obs1.setValueNumeric(134.0);
		os.saveObs(obs1,null);
		enc.addObs(obs1);
		//EncounterType etype = es.getEncounterType("healthnetreferral");
		
		
	//	enc.setEncounterType(etype);
	//	es.saveEncounter(enc);
	//	Obs obs2 = new Obs();
		//obs2.setConcept(cs.getConcept(12));
		EncounterType etype = new EncounterType();
		List<EncounterType> elist = es.getAllEncounterTypes();
		int noe = elist.size();
		String n="";
		for(int k=0;k<noe;k++)
		{	
		EncounterType et = elist.get(k);
		if(et.getName().equals("healthnetreferral"))
			{etype = et; break;}
		}
		enc.setEncounterType(etype);
		es.saveEncounter(enc);
		*/
         //resp.getWriter().println("Patient found \n"+ppname+"\n"+ppsurnamr+today.toString());
		 //resp.getWriter().println("Number of Encounter types"+noe+ " NameS "+ n);	
         
		//Person per = new Person("pnm","kr","pd");
		//Patient pat = new Patient();
		/*PatientIdentifierType pt = Context.getPatientService().getPatientIdentifierTypeByName("Old Identification Number");
		Location loc = new Location();
		loc.setCountry("India");
		loc.setAddress1("Thane");
		loc.setName("Thane");
		Context.getLocationService().saveLocation(loc);
		
		PatientIdentifier pid = new PatientIdentifier();
		pid.setIdentifierType(pt);
		pid.setLocation(loc);
		//pid.setPatient(p);
	    pid.setIdentifier("123545");
	  //  pid.setId(123545);
		//Context.getPatientService().savePatientIdentifier(pid);
		Person pr = new Person();
		
		Patient p = new Patient();
		p.setBirthdate(today);
		p.setDateCreated(today);
		p.setGender("M");
		PersonName prn = new PersonName("per","don","son");
		
		//p.setPatientId("123545");
		p.addName(prn);
		p.addIdentifier(pid);
		Context.getPatientService().savePatient(p);
		//List<PatientIdentifierType> pt = Context.getPatientService().getAllPatientIdentifierTypes();
		//String res ="";
		for(int k=0;k<pt.size();k++)
			res = res + pt.get(k)+ "  ";*/
		resp.getWriter().println("Hospital_list \n");
		resp.getWriter().flush();
		resp.getWriter().close();
		//resp.getWriter().close();
		//Encounter e1 = new Encounter();
		
		//Patient p1 = new Patient();
		
	// Set<Obs> oset1 = enc.getObs();
	//	oset1.size();
	 //     Iterator<Obs> ioset = oset.iterator();
	// Obs obs1 =   ioset.next();
	      
	}
}

