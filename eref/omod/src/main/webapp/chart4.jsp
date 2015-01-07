  <%@ page import="java.util.*" %>
<%@ page import="org.openmrs.api.*" %>
<%@ page import="org.openmrs.api.context.Context" %>
<%@ page import="org.openmrs.Patient" %>
<%@ page import="org.openmrs.Encounter" %>
<%@ page import="org.openmrs.Obs" %>
<%@ page import="org.openmrs.Concept" %>
<%@ page import="org.openmrs.module.eref.EreferralService" %>
<%@ page import="org.openmrs.module.eref.db.Ereferral" %>

<%
List<Encounter> elist = new ArrayList<Encounter>();
List<Integer> intlist = new ArrayList<Integer>();
List<Obs> obslist = new ArrayList<Obs>();
Concept c = Context.getConceptService().getConcept(new Integer(32));
List<Concept> clist = new ArrayList<Concept>();
clist.add(c);
List<Obs> olist = Context.getObsService().getObservations(clist, null, null);
int s = olist.size();
//fever count
int fever_count=0;
double avg_temp=0;
int size=0;
//joint pain count
int jointpain_count=0;
//headache
int headache = 0;
//platelet count
double platelet_count =0;
for(int k=0;k<s;k++) {
	
	Obs o1 = olist.get(k);
	  Concept c1 = o1.getValueCoded();
	  if(c1.getDisplayString().equals("POSITIVE")) {
		  Encounter e = o1.getEncounter();
		  Set<Obs> oset = e.getAllObs();
		   size = oset.size();
		   Iterator<Obs> ioset = oset.iterator();
		   for(int m=0;m<size;m++){
			   Obs obs1 = ioset.next();
			   // check fever
			   if(obs1.getConcept().getName().getName().equals("TEMPERATURE (C)")){
				  
				 Double d = obs1.getValueNumeric();
				 if(d.doubleValue()>37.5){
		           avg_temp = avg_temp+d.doubleValue();
		           fever_count++; 
				 }
				 
			   }
			   //Check joint pain
			   if(obs1.getConcept().getName().getName().equals("PAIN IN JOINTS")){
					  Boolean d = obs1.getValueAsBoolean();
					 if(d.booleanValue()==true){
			          
						 jointpain_count++; 
					 }
					 
				   }
			   //check headache
			   if(obs1.getConcept().getName().getName().equals("HEADACHE PRESENT")){
					  Boolean d = obs1.getValueAsBoolean();
					 if(d.booleanValue()==true){
			          
						 headache++; 
					 }
					 
				   }
			   //platelets
			   if(obs1.getConcept().getName().getName().equals("PLATELETS")){
				   Double d = obs1.getValueNumeric();
				   platelet_count = platelet_count+d.doubleValue();
					 
				   }
		   }	   
	  }	
}

double percentage_fever = (((double)fever_count)/size)*100;
double pain_in_joint_percentage = (((double)jointpain_count)/size)*100;
double headache_percentage = (((double)headache)/size)*100;
double avg_platelets = (((double)platelet_count)/size)*100;
String pf = percentage_fever+"";
String fc = fever_count+"";
%>
 <script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script type='text/javascript'>
      google.load('visualization', '1', {packages:['table']});
      google.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Symptom');
        data.addColumn('string', 'No. of patients');
        data.addColumn('string', 'Percentage');
        data.addRows(4);
       
        data.setCell(0, 0, 'Fever');
        data.setCell(0, 1, '<% out.print(fc);%>');
        data.setCell(0, 2, '<% out.print(pf);%>');
        data.setCell(1, 0, 'Pain in joints');
        data.setCell(1, 1, '<% out.print(jointpain_count);%>');
        data.setCell(1, 2, '<% out.print(pain_in_joint_percentage);%>');
        data.setCell(2, 0, 'Headache');
        data.setCell(2, 1, '<% out.print(headache);%>');
        data.setCell(2, 2, '<% out.print(headache_percentage);%>');
        data.setCell(3, 0, 'Platelets');
        data.setCell(3, 1, '<% out.print("Avegare value:");%>');
        data.setCell(3, 2, '<% out.print(avg_platelets);%>');

        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {showRowNumber: true});
      }
    </script>
    <div id='table_div'></div>
  
