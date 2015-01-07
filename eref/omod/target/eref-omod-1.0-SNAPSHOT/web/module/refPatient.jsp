<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="org.openmrs.api.*" %>
<%@ page import="org.openmrs.api.context.Context" %>
<%@ page import="org.openmrs.Patient" %>
<%@ page import="org.openmrs.Encounter" %>
<%@ page import="org.openmrs.Obs" %>

<% String a = request.getParameter("a");
   Encounter enc = Context.getEncounterService().getEncounterByUuid(a);
   Patient p = enc.getPatient();
   Set<Obs> oset = enc.getAllObs();
   int s = oset.size();
   s = s+8;
   Iterator<Obs> ioset = oset.iterator();
   Integer it = enc.getEncounterId();
   int it1 = it.intValue();
   out.print(it1);
%>

<script type='text/javascript'>
goback()
{
	document.location.href = "${pageContext.request.contextPath}/module/eref/chart5Link.form";
}

</script>
<script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script type='text/javascript'>
      var table;   
      google.load('visualization', '1', {packages:['table']});
      google.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Property');
        data.addColumn('string', 'Value');
        
        data.addRows(<% out.print(s); %>);
        data.setCell(0, 0, 'Patient Name');
        data.setCell(0, 1, '<% out.print(p.getGivenName()+"  "+p.getFamilyName()); %>');
        data.setCell(1, 0, 'Refered from');
        data.setCell(1, 1, '<% out.print(enc.getLocation().getName()); %>');
        data.setCell(2, 0, 'Referral Date');
        data.setCell(2, 1, '<% out.print(enc.getDateCreated().getDay()+"/"+(enc.getDateCreated().getMonth()+1)+"/"+(enc.getDateCreated().getYear()+1900));%>');
        data.setCell(3, 0, 'Referral Time');
        data.setCell(3, 1, '<% out.print(enc.getDateCreated().getHours()+":"+enc.getDateCreated().getMinutes()); %>');
        data.setCell(4, 0, 'Contact Number');
        data.setCell(4, 1, '9969242456');
        data.setCell(5, 0, 'Age');
        data.setCell(5, 1, '<% out.print(p.getAge()); %>');
        data.setCell(6, 0, 'Gender');
        data.setCell(6, 1, '<% out.print(p.getGender()); %>');
        data.setCell(7, 0, 'Patient Condition');
        data.setCell(7, 1, ' ');
        <% for(int m=0;m<oset.size();m++)
        {   
            int m1=m+8; 
            Obs obs1 = ioset.next();
        	out.print("data.setCell(");out.print(m1);out.print(", 0, '");out.print(obs1.getConcept().getName().getName());out.println("');");
        	out.print("data.setCell(");out.print(m1);out.print(", 1, '");out.print(obs1.getValueAsString(null));out.println("');");
            
        }
        %>
        table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {showRowNumber: true, allowHtml
: true});
// Add our selection handler. 
//google.visualization.events.addListener(table, 'select', //selectHandler); 
} 

// The selection handler. 
// Loop through all items in the selection and concatenate 
// a single message from all of them. 
function selectHandler() { 
var selection = table.getSelection();
var message = ''; 
for (var i = 0; i < selection.length; i++) { 
var item = selection[i]; 
if(item.column ==5)
{ message = message+item.row; }
else
{ message = message+item.row+' c '+item.column;}

}

alert('You selected ' + message); 
}
    </script>
<div id ='content'>
    <div id='table_div' align ='left'></div>
  <div id='button_div'align ="center">
  
  <a href = "${pageContext.request.contextPath}/module/eref/chart5Link.form">Go Back</a><a href = "${pageContext.request.contextPath}/moduleServlet/eref/deleteServlet?uid="<%out.print(a);%>>Remove Patient</a>

</div>
 </div>   
   

<%@ include file="/WEB-INF/template/footer.jsp"%>