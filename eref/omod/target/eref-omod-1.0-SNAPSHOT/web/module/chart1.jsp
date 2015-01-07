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
  
  
    
    int pos1 = 0;
    int pos2 = 0;
    int pos3 = 0;
    int pos4 = 0;
    int pos5 = 0;
    int pos6 = 0;
    int pos7 = 0;
    int pos8 = 0;
    int pos9 = 0;
    int pos10 = 0;
    int pos11 = 0;
    int pos12 = 0;
    int neg1 = 0;
    int neg2 = 0;
    int neg3 = 0;
    int neg4 = 0;
    int neg5 = 0;
    int neg6 = 0;
    int neg7 = 0;
    int neg8 = 0;
    int neg9 = 0;
    int neg10 = 0;
    int neg11 = 0;
    int neg12 = 0;
    int count =0;
    for(int i=0;i<s;i++)
    {
    	 Obs o1 = olist.get(i);
    	  Concept c1 = o1.getValueCoded();
    	  if(c1.getDisplayString().equals("POSITIVE"))
    	  {  count++;
    		  int month = o1.getDateCreated().getMonth();
    		  if(month == 1)
    			  pos1++;
    		  if(month == 2)
    			  pos2++;
    		  if(month == 3)
    			  pos3++;
    		  if(month == 4)
    			  pos4++;
    		  if(month == 5)
    			  pos5++;
    		  if(month == 6)
    			  pos6++;
    		  if(month == 7)
    			  pos7++;
    		  if(month == 8)
    			  pos8++;
    		  if(month == 9)
    			  pos9++;
    		  if(month == 10)
    			  pos10++;
    		  if(month == 11)
    			  pos11++;
    		  if(month == 12)
    			  pos12++;
    		  
    	  }
    	  if(c1.getDisplayString().equals("INDETERMINATE"))
    	  {
    		  int month = o1.getDateCreated().getMonth();
    		  if(month == 1)
    			  neg1++;
    		  if(month == 2)
    			  neg2++;
    		  if(month == 3)
    			  neg3++;
    		  if(month == 4)
    			  neg4++;
    		  if(month == 5)
    			  neg5++;
    		  if(month == 6)
    			  neg6++;
    		  if(month == 7)
    			  neg7++;
    		  if(month == 8)
    			  neg8++;
    		  if(month == 9)
    			  neg9++;
    		  if(month == 10)
    			  neg10++;
    		  if(month == 11)
    			  neg11++;
    		  if(month == 12)
    			  neg12++;
    		  
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
        data.addColumn('string', 'x');
        data.addColumn('number', 'Confirmed Cases');
        data.addColumn('number', 'Suspected Cases');
        data.addRow(["Jan", <%out.print(pos1);%>, <%out.print(neg1);%>]);
        data.addRow(["Feb", <%out.print(pos2);%>, <%out.print(neg2);%>]);
        data.addRow(["Mar", <%out.print(pos3);%>, <%out.print(neg3);%>]);
        data.addRow(["Apr", <%out.print(pos4);%>, <%out.print(neg4);%>]);
        data.addRow(["May", <%out.print(pos5);%>, <%out.print(neg5);%>]);
        data.addRow(["Jun", <%out.print(pos6);%>, <%out.print(neg6);%>]);
        data.addRow(["Jul", <%out.print(pos7);%>, <%out.print(neg7);%>]);
        data.addRow(["Aug", <%out.print(pos8);%>, <%out.print(neg8);%>]);
        data.addRow(["Sep", <%out.print(pos9);%>, <%out.print(neg9);%>]);
        data.addRow(["Oct", <%out.print(pos10);%>, <%out.print(neg10);%>]);
        data.addRow(["Nov", <%out.print(pos11);%>, <%out.print(neg11);%>]);
        data.addRow(["Dec", <%out.print(pos12);%>, <%out.print(neg12);%>]);
       
        // Create and draw the visualization.
        new google.visualization.LineChart(document.getElementById('visualization')).
            draw(data, {curveType: "function",
                        width: 800, height: 400,
                        vAxis: {maxValue: "automatic",viewWindowMode: "explicit",viewWindow :{min: 0}}
            }
                );
      }
      

      google.setOnLoadCallback(drawVisualization);
    </script>
<div id="visualization" style="width: 500px; height: 400px;"></div>
    