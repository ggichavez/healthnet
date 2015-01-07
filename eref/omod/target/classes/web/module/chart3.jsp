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
    Concept c = Context.getConceptService().getConcept(new Integer(32));
    List<Concept> clist = new ArrayList<Concept>();
    clist.add(c);
    List<Obs> olist = Context.getObsService().getObservations(clist, null, null);
   int s = olist.size();
  
  
    
    int ag1 = 0;
    int ag2 = 0;
    int ag3 = 0;
    int ag4 = 0;
    int ag5 = 0;
    for(int i=0;i<s;i++)
    {
    	 Obs o1 = olist.get(i);
    	  Concept c1 = o1.getValueCoded();
    	  if(c1.getDisplayString().equals("POSITIVE"))
    	  {
    		  int age = o1.getEncounter().getPatient().getAge().intValue();
    		  if(age>60)
    			  ag5++;
    		  else
    			  if(age>40)
    				  ag4++;
    			  else
    				  if(age>15)
    					  ag3++;
    				  else
    					  if(age>5)
        					  ag2++;
    					  else
    						  ag1++;
    	  }
    	  
    	  
    }
    	
    
    %>


<script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1', {packages: ['corechart']});
    </script>
    <script type="text/javascript">
      function drawVisualization() {
        // Create and populate the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Task');
        data.addColumn('number', 'Hours per Day');
        data.addRows(5);
        data.setValue(0, 0, 'Age Group 0-5');
        data.setValue(0, 1, <%out.print(ag1);%>);
        data.setValue(1, 0, 'Age Group 5-15');
        data.setValue(1, 1, <%out.print(ag2);%>);
        data.setValue(2, 0, 'Age Group 15-40');
        data.setValue(2, 1, <%out.print(ag3);%>);
        data.setValue(3, 0, 'Age Group 40-60');
        data.setValue(3, 1, <%out.print(ag4);%>);
        data.setValue(4, 0, 'Age Group 60+');
        data.setValue(4, 1, <%out.print(ag5);%>);
      
        // Create and draw the visualization.
        new google.visualization.PieChart(document.getElementById('visualization')).
          draw(data, {title:"Malaria Cases:"});
      }
      

      google.setOnLoadCallback(drawVisualization);
    </script>
<div id="visualization" style="width: 600px; height: 400px;"></div>