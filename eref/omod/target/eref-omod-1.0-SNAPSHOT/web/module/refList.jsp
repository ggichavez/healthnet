<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>

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
        data.addRows(4);
        data.setCell(0, 0, 'First patient');
        data.setCell(0, 1, 'Malaria');
        data.setCell(0, 2, '11-11-2011');
        data.setCell(0, 3, '12:10');
        data.setCell(0, 4, 'Thane');
        data.setCell(0, 5, '<a href="http://localhost:8080/openmrs/module/eref/refPatientLink.form">View detais</a>');
        data.setCell(1, 0, 'Mad patient');
        data.setCell(1, 1, 'Malaria');
        data.setCell(1, 2, '11-11-2011');
        data.setCell(1, 3, '14:10');
        data.setCell(1, 4, 'Thane');
        data.setCell(1, 5, '<a href="http://localhost:8080/openmrs/module/eref/refPatientLink.form">View detais</a>');
        data.setCell(2, 0, 'Sad patient');
        data.setCell(2, 1, 'Accident');
        data.setCell(2, 2, '12-11-2011');
        data.setCell(2, 3, '11:10');
        data.setCell(2, 4, 'Road');
        data.setCell(2, 5, '<a href="http://localhost:8080/openmrs/module/eref/refPatientLink.form">View detais</a>');
        data.setCell(3, 0, 'Last Patient');
        data.setCell(3, 1, 'Unknown');
        data.setCell(3, 2, '14-11-2011');
        data.setCell(3, 3, '23:10');
        data.setCell(3, 4, 'Unknown location');
        data.setCell(3, 5, '<a href="http://localhost:8080/openmrs/module/eref/refPatientLink.form">View detais</a>');
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
