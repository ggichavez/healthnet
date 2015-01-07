<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="org.openmrs.api.*" %>
<%@ page import="org.openmrs.api.context.Context" %>
<%@ page import="org.openmrs.Patient" %>
<%@ page import="org.openmrs.Encounter" %>
<%@ page import="org.openmrs.Obs" %>
<%@ page import="org.openmrs.module.eref.EreferralService" %>
<%@ page import="org.openmrs.module.eref.db.Ereferral" %>
<% 
List<Encounter> elist =  new ArrayList<Encounter>();

Object o = Context.getService(EreferralService.class);
EreferralService service = (EreferralService)o;
List<Ereferral> ereflist = service.getAllReferrals();
for(int k=0;k<ereflist.size();k++)
{
	String euid = ereflist.get(k).getPat_encounter_id();
	Encounter encounter1 = Context.getEncounterService().getEncounterByUuid(euid);
	elist.add(encounter1);
}
 %>
 
 
 

<script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script type='text/javascript'>
      var table;   
      google.load('visualization', '1', {packages:['table']});
      google.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('string', 'Emergency type');
        data.addColumn('string', 'Referral date');   
        data.addColumn('string', 'Referral time');
        data.addColumn('string', 'Referred from');  
        data.addColumn('string', 'View details'); 
        data.addRows(<%=elist.size() %>);
        <% for(int m=0;m<elist.size();m++)
        {
        	out.print("data.setCell(");out.print(m);out.print(", 0, '");out.print(elist.get(m).getPatient().getGivenName());out.println("');");
        	out.print("data.setCell(");out.print(m);out.print(", 1, '");out.print(elist.get(m).getEncounterType().getName());out.println("');");
            out.print("data.setCell(");out.print(m);out.print(", 2, '");out.print(elist.get(m).getDateCreated().getDay()+" , "+elist.get(m).getDateCreated().getDate()+"/"+(elist.get(m).getDateCreated().getMonth()+1)+"/"+(elist.get(m).getDateCreated().getYear()+1900));out.println("');");
            out.print("data.setCell(");out.print(m);out.print(", 3, '");out.print(elist.get(m).getDateCreated().getHours()+":"+elist.get(m).getDateCreated().getMinutes());out.println("');");
            out.print("data.setCell(");out.print(m);out.print(", 4, '");out.print(elist.get(m).getLocation().getName());out.println("');");
            out.print("data.setCell(");out.print(m);out.print(", 5, '<a href=\"");out.print(request.getContextPath());out.print("/module/eref/refPatientLink.form?a=");out.print(elist.get(m).getUuid());out.println("\">View detais</a>');");
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
 <div id='table_div'></div>


<%@ include file="/WEB-INF/template/footer.jsp"%>